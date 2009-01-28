/***********************************************************************/
/*                                                                     */
/*   Optimizer.cpp                                                     */
/*                                                                     */
/*   Interface to the PR_LOQO optimization package for SVM.            */
/*                                                                     */
/*   Author: Thorsten Joachims                                         */
/*   Date: 19.07.99                                                    */
/*                                                                     */
/*   Copyright (c) 1999  Universitaet Dortmund - All rights reserved   */
/*                                                                     */
/*   This software is available for non-commercial use only. It must   */
/*   not be modified and distributed without prior permission of the   */
/*   author. The author is not responsible for implications from the   */
/*   use of this software.                                             */
/*                                                                     */
/***********************************************************************/

#include "base/SGObject.h"

#include "classifier/svm/pr_loqo.h"
#include "classifier/svm/Optimizer.h"
#include "classifier/svm/SVM.h"

#ifdef USE_SVMLIGHT
#include "classifier/svm/SVM_light.h"
#endif //USE_SVMLIGHT

#include "lib/common.h"
#include "lib/Mathematics.h"

int32_t verbosity=1;

/* /////////////////////////////////////////////////////////////// */

float64_t *optimize_qp();
float64_t *primal=0,*dual=0;
float64_t init_margin=0.15;
int32_t   init_iter=500,precision_violations=0;
float64_t model_b;
float64_t opt_precision=DEF_PRECISION;

/* /////////////////////////////////////////////////////////////// */

/* start the optimizer and return the optimal values */
float64_t *optimize_qp(
		QP *qp, float64_t *epsilon_crit, int32_t nx, float64_t *threshold,
		int32_t& svm_maxqpsize)
{
	register int32_t i, j, result;
	float64_t margin, obj_before, obj_after;
	float64_t sigdig, dist, epsilon_loqo;
	int32_t iter;

	if(!primal) { /* allocate memory at first call */
		primal=new float64_t[nx*3];
		dual=new float64_t[nx*2+1];
	}

	obj_before=0; /* calculate objective before optimization */
	for(i=0;i<qp->opt_n;i++) {
		obj_before+=(qp->opt_g0[i]*qp->opt_xinit[i]);
		obj_before+=(0.5*qp->opt_xinit[i]*qp->opt_xinit[i]*qp->opt_g[i*qp->opt_n+i]);
		for(j=0;j<i;j++) {
			obj_before+=(qp->opt_xinit[j]*qp->opt_xinit[i]*qp->opt_g[j*qp->opt_n+i]);
		}
	}

	result=STILL_RUNNING;
	qp->opt_ce0[0]*=(-1.0);
	/* Run pr_loqo. If a run fails, try again with parameters which lead */
	/* to a slower, but more robust setting. */
	for(margin=init_margin,iter=init_iter;
		(margin<=0.9999999) && (result!=OPTIMAL_SOLUTION);) {

		opt_precision=CMath::max(opt_precision, DEF_PRECISION);
		sigdig=-log10(opt_precision);

		result=pr_loqo((int32_t)qp->opt_n,(int32_t)qp->opt_m,
				(float64_t *)qp->opt_g0,(float64_t *)qp->opt_g,
				(float64_t *)qp->opt_ce,(float64_t *)qp->opt_ce0,
				(float64_t *)qp->opt_low,(float64_t *)qp->opt_up,
				(float64_t *)primal,(float64_t *)dual,
				(int32_t)(verbosity-2),
				(float64_t)sigdig,(int32_t)iter,
				(float64_t)margin,(float64_t)(qp->opt_up[0])/4.0,(int32_t)0);

		if(isnan(dual[0])) {     /* check for choldc problem */
			if(verbosity>=2) {
				SG_SDEBUG("Restarting PR_LOQO with more conservative parameters.\n");
			}
			if(init_margin<0.80) { /* become more conservative in general */
				init_margin=(4.0*margin+1.0)/5.0;
			}
			margin=(margin+1.0)/2.0;
			(opt_precision)*=10.0;   /* reduce precision */
			if(verbosity>=2) {
				SG_SDEBUG("Reducing precision of PR_LOQO.\n");
			}
		}
		else if(result!=OPTIMAL_SOLUTION) {
			iter+=2000;
			init_iter+=10;
			(opt_precision)*=10.0;   /* reduce precision */
			if(verbosity>=2) {
				SG_SDEBUG("Reducing precision of PR_LOQO due to (%ld).\n",result);
			}
		}
	}

	if(qp->opt_m)         /* Thanks to Alex Smola for this hint */
		model_b=dual[0];
	else
		model_b=0;

	/* Check the precision of the alphas. If results of current optimization */
	/* violate KT-Conditions, relax the epsilon on the bounds on alphas. */
	epsilon_loqo=1E-10;
	for(i=0;i<qp->opt_n;i++) {
		dist=-model_b*qp->opt_ce[i];
		dist+=(qp->opt_g0[i]+1.0);
		for(j=0;j<i;j++) {
			dist+=(primal[j]*qp->opt_g[j*qp->opt_n+i]);
		}
		for(j=i;j<qp->opt_n;j++) {
			dist+=(primal[j]*qp->opt_g[i*qp->opt_n+j]);
		}
		/*  SG_SDEBUG("LOQO: a[%d]=%f, dist=%f, b=%f\n",i,primal[i],dist,dual[0]); */
		if((primal[i]<(qp->opt_up[i]-epsilon_loqo)) && (dist < (1.0-(*epsilon_crit)))) {
			epsilon_loqo=(qp->opt_up[i]-primal[i])*2.0;
		}
		else if((primal[i]>(0+epsilon_loqo)) && (dist > (1.0+(*epsilon_crit)))) {
			epsilon_loqo=primal[i]*2.0;
		}
	}

	for(i=0;i<qp->opt_n;i++) {  /* clip alphas to bounds */
		if(primal[i]<=(0+epsilon_loqo)) {
			primal[i]=0;
		}
		else if(primal[i]>=(qp->opt_up[i]-epsilon_loqo)) {
			primal[i]=qp->opt_up[i];
		}
	}

	obj_after=0;  /* calculate objective after optimization */
	for(i=0;i<qp->opt_n;i++) {
		obj_after+=(qp->opt_g0[i]*primal[i]);
		obj_after+=(0.5*primal[i]*primal[i]*qp->opt_g[i*qp->opt_n+i]);
		for(j=0;j<i;j++) {
			obj_after+=(primal[j]*primal[i]*qp->opt_g[j*qp->opt_n+i]);
		}
	}

	/* if optimizer returned NAN values, reset and retry with smaller */
	/* working set. */
	if(isnan(obj_after) || isnan(model_b)) {
		for(i=0;i<qp->opt_n;i++) {
			primal[i]=qp->opt_xinit[i];
		}
		model_b=0;
		if(svm_maxqpsize>2) {
			svm_maxqpsize--;  /* decrease size of qp-subproblems */
		}
	}

	if(obj_after >= obj_before) { /* check whether there was progress */
		(opt_precision)/=100.0;
		precision_violations++;
		if(verbosity>=2) {
			SG_SDEBUG("Increasing Precision of PR_LOQO.\n");
		}
	}

	if(precision_violations > 500) {
		(*epsilon_crit)*=10.0;
		precision_violations=0;
		SG_SINFO("Relaxing epsilon on KT-Conditions.\n");
	}

	(*threshold)=model_b;

	if(result!=OPTIMAL_SOLUTION) {
		SG_SERROR("PR_LOQO did not converge.\n");
		return(qp->opt_xinit);
	}
	else {
		return(primal);
	}
}

