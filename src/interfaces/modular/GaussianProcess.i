/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2013 Heiko Strathmann
 */

/* Remove C Prefix */
#ifdef HAVE_EIGEN3
%rename(MeanFunction) CMeanFunction;
%rename(ZeroMean) CZeroMean;

%rename(InferenceMethod) CInferenceMethod;
%rename(ExactInferenceMethod) CExactInferenceMethod;
%rename(LaplacianInferenceMethod) CLaplacianInferenceMethod;
%rename(FITCInferenceMethod) CFITCInferenceMethod;
%rename(EPInferenceMethod) CEPInferenceMethod;

%rename(LikelihoodModel) CLikelihoodModel;
%rename(ProbitLikelihood) CProbitLikelihood;
%rename(LogitLikelihood) CLogitLikelihood;
%rename(GaussianLikelihood) CGaussianLikelihood;
%rename(StudentsTLikelihood) CStudentsTLikelihood;

%rename(GaussianProcessMachine) CGaussianProcessMachine;
%rename(GaussianProcessBinaryClassification) CGaussianProcessBinaryClassification;
%rename(GaussianProcessRegression) CGaussianProcessRegression;

#endif //HAVE_EIGEN3

/* These functions return new Objects */

/* Include Class Headers to make them visible from within the target language */
#ifdef HAVE_EIGEN3
%include <evaluation/DifferentiableFunction.h>
%include <machine/gp/LikelihoodModel.h>
%include <machine/gp/ProbitLikelihood.h>
%include <machine/gp/LogitLikelihood.h>
%include <machine/gp/GaussianLikelihood.h>
%include <machine/gp/StudentsTLikelihood.h>

%include <machine/gp/MeanFunction.h>
%include <machine/gp/ZeroMean.h>

%include <machine/gp/InferenceMethod.h>
%include <machine/gp/LaplacianInferenceMethod.h>
%include <machine/gp/ExactInferenceMethod.h>
%include <machine/gp/LaplacianInferenceMethod.h>
%include <machine/gp/FITCInferenceMethod.h>
%include <machine/gp/EPInferenceMethod.h>

%include <machine/GaussianProcessMachine.h>
%include <classifier/GaussianProcessBinaryClassification.h>
%include <regression/GaussianProcessRegression.h>

%include <machine/gp/MeanFunction.h>
%include <machine/gp/ZeroMean.h>
#endif //HAVE_EIGEN3
