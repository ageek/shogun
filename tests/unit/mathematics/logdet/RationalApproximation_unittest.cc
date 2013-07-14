/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2013 Soumyajit De
 */
 
#include <shogun/lib/common.h>

#ifdef HAVE_EIGEN3
#include <shogun/lib/SGVector.h>
#include <shogun/lib/SGMatrix.h>
#include <shogun/lib/DynamicObjectArray.h>
#include <shogun/lib/computation/engine/SerialComputationEngine.h>
#include <shogun/lib/computation/job/ScalarResult.h>
#include <shogun/lib/computation/job/IndividualJobResultAggregator.h>
#include <shogun/lib/computation/job/RationalApproximationIndividualJob.h>
#include <shogun/mathematics/eigen3.h>
#include <shogun/mathematics/logdet/DenseMatrixOperator.h>
#include <shogun/mathematics/logdet/DirectLinearSolverComplex.h>
#include <shogun/mathematics/logdet/DirectEigenSolver.h>
#include <shogun/mathematics/logdet/LogRationalApproximationIndividual.h>
#include <unsupported/Eigen/MatrixFunctions>
#include <gtest/gtest.h>

using namespace shogun;
using namespace Eigen;

TEST(RationalApproximation, precompute)
{
	CSerialComputationEngine* e=new CSerialComputationEngine;
	SG_REF(e);
	
	const index_t size=2;
	SGMatrix<float64_t> m(size, size);
	m(0,0)=2.0;
	m(0,1)=1.0;
	m(1,0)=1.0;
	m(1,1)=3.0;

	CDenseMatrixOperator<float64_t, float64_t>* op=new CDenseMatrixOperator<float64_t, float64_t>(m);
	SG_REF(op);

	CDirectEigenSolver* eig_solver=new CDirectEigenSolver(op);
	SG_REF(eig_solver);

	CDirectLinearSolverComplex* linear_solver=new CDirectLinearSolverComplex();
	SG_REF(linear_solver);

	CLogRationalApproximationIndividual *op_func
		=new CLogRationalApproximationIndividual(
			op, e, eig_solver, (CLinearSolver<complex64_t, float64_t>*)linear_solver, 5);
	SG_REF(op_func);

	op_func->precompute();

	SGVector<complex64_t> shifts=op_func->get_shifts();
	SGVector<complex64_t> weights=op_func->get_weights();
	float64_t const_multiplier=op_func->get_constant_multiplier();

	Map<VectorXcd> map_shifts(shifts.vector, shifts.vlen);
	Map<VectorXcd> map_weights(weights.vector, weights.vlen);

	// reference values are generated using KRYLSTAT	
	SGVector<complex64_t> ref_shifts(5);
	ref_shifts[0]=complex64_t(0.51827127849765364243, 0.23609847245566201179);
	ref_shifts[1]=complex64_t(0.44961096840887382342, 0.86844451701724056925);
	ref_shifts[2]=complex64_t(0.52786404500042061194, 2.17286896751640146164);
	ref_shifts[3]=complex64_t(2.35067127618097071462, 4.54043100490560203042);
	ref_shifts[4]=complex64_t(7.98944200008961935566, 3.63959017266438733529);
	Map<VectorXcd> map_ref_shifts(ref_shifts.vector, ref_shifts.vlen);
	SGVector<complex64_t> ref_weights(5);
	ref_weights[0]=complex64_t(-0.01647563566875611188, -0.01058494296357846871);
	ref_weights[1]=complex64_t(-0.01690640878366324318, 0.02513114861539664235);
	ref_weights[2]=complex64_t(0.02229379592072704488, 0.03691476590076240433);
	ref_weights[3]=complex64_t(0.05440205028428418688, 0.00100377381669515997);
	ref_weights[4]=complex64_t(0.03177788684575824640, -0.05246446606420653719);
	Map<VectorXcd> map_ref_weights(ref_weights.vector, ref_weights.vlen);
	
#ifdef HAVE_ARPREC
	EXPECT_NEAR(const_multiplier, -10.02791094628079981987, 1E-19);
	EXPECT_NEAR(map_shifts.norm(), map_ref_shifts.norm(), 1E-14);
	EXPECT_NEAR(map_weights.norm(), map_ref_weights.norm(), 1E-14);
#else
	EXPECT_NEAR(const_multiplier, -10.02791094628079981987, 1E-15);
	EXPECT_NEAR(map_shifts.norm(), map_ref_shifts.norm(), 1E-12);
	EXPECT_NEAR(map_weights.norm(), map_ref_weights.norm(), 1E-12);
#endif

	SG_UNREF(eig_solver);
	SG_UNREF(linear_solver);
	SG_UNREF(op_func);
	SG_UNREF(e);
	SG_UNREF(op);
}

TEST(RationalApproximation, trace_accuracy)
{
	CSerialComputationEngine* e=new CSerialComputationEngine;
	SG_REF(e);

	const index_t size=5;
	SGMatrix<float64_t> m(size, size);
	m.set_const(0.0);
	float64_t coeff=0.001;
	for (index_t i=0; i<size; ++i)
	{
		m(i,i)=coeff;
		coeff*=10;
	}

	// create the operator
	CDenseMatrixOperator<float64_t, float64_t>* op=new CDenseMatrixOperator<float64_t, float64_t>(m);
	SG_REF(op);

	// create the eigen solver for finding max/min eigenvalues
	CDirectEigenSolver* eig_solver=new CDirectEigenSolver(op);
	SG_REF(eig_solver);

	// create the direct linear solver for solving the systems that generates from
	// rational approximation of the operator function
	CDirectLinearSolverComplex* linear_solver=new CDirectLinearSolverComplex();
	SG_REF(linear_solver);

	// compute the number of shifts to assure a given accuracy
	float64_t accuracy=1E-19;

	eig_solver->compute();
	float64_t max_eig=eig_solver->get_max_eigenvalue();
	float64_t min_eig=eig_solver->get_min_eigenvalue();
	float64_t pi=CMath::PI;

	index_t num_shifts=static_cast<index_t>(-1.5*(CMath::log(max_eig/min_eig)+6.0)
  	*CMath::log(accuracy)/(2.0*pi*pi));

	// create the operator function that extracts the trace
	// of the approximation of log of the linear operator
	CLogRationalApproximationIndividual *op_func
  	=new CLogRationalApproximationIndividual(
			op, e, eig_solver, linear_solver, num_shifts);
	SG_REF(op_func);

	op_func->precompute();

	// create the aggregators to contain the result aggregators
	CDynamicObjectArray aggregators;

	// extract the trace of approximation of log using basis vectors
	for (index_t i=0; i<size; ++i)
	{
		SGVector<float64_t> s(size);
		s.set_const(0.0);
		s[i]=1.0;
		CJobResultAggregator* agg=op_func->submit_jobs(s);
		aggregators.append_element(agg);
		SG_UNREF(agg);
	}
	// wait for all computation jobs to be computed
	e->wait_for_all();

	// use the aggregators to find the final result
	int32_t num_aggregates=aggregators.get_num_elements();
	float64_t result=0.0;
	for (int32_t i=0; i<num_aggregates; ++i)
	{
		CJobResultAggregator* agg=dynamic_cast<CJobResultAggregator*>
			(aggregators.get_element(i));

		// call finalize on all the aggregators
		agg->finalize();
		CScalarResult<float64_t>* r=dynamic_cast<CScalarResult<float64_t>*>
			(agg->get_final_result());

		// its important that we don't just unref the result here
		result+=r->get_result();
		SG_UNREF(agg);
	}

	// clear all aggregators
	aggregators.clear_array();

#if EIGEN_VERSION_AT_LEAST(3,1,0)
	// compute the trace of log(m) using Eigen3 that uses Schur-Parlett algorithm
	Map<MatrixXd> eig_m(m.matrix, m.num_rows, m.num_cols);
	float64_t trace_log_m=eig_m.log().diagonal().sum();
#else
	float64_t trace_log_m=-11.51292546497021618279;
#endif // EIGEN_VERSION_AT_LEAST(3,1,0)

#ifdef HAVE_ARPREC
	EXPECT_NEAR(result, trace_log_m, 1E-13);
#else
	EXPECT_NEAR(result, trace_log_m, 1E-07);
#endif

	SG_UNREF(eig_solver);
	SG_UNREF(linear_solver);
	SG_UNREF(op_func);
	SG_UNREF(e);
	SG_UNREF(op);
}

#endif // HAVE_EIGEN3
