/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2009 Soeren Sonnenburg
 * Copyright (C) 2009 Fraunhofer Institute FIRST and Max-Planck-Society
 */

/* These functions return new Objects */
%newobject CGradientEvaluation::evaluate();
%newobject CCrossValidation::evaluate();

#if defined(USE_SWIG_DIRECTORS) && defined(SWIGPYTHON)
%feature("director") shogun::CDirectorContingencyTableEvaluation;
#endif

/* Remove C Prefix */
%rename(Evaluation) CEvaluation;
%rename(BinaryClassEvaluation) CBinaryClassEvaluation;
%rename(ClusteringEvaluation) CClusteringEvaluation;
%rename(ClusteringAccuracy) CClusteringAccuracy;
%rename(ClusteringMutualInformation) CClusteringMutualInformation;
%rename(ContingencyTableEvaluation) CContingencyTableEvaluation;
%rename(MulticlassAccuracy) CMulticlassAccuracy;
%rename(MeanAbsoluteError) CMeanAbsoluteError;
%rename(MeanSquaredError) CMeanSquaredError;
%rename(MeanSquaredLogError) CMeanSquaredLogError;
%rename(ROCEvaluation) CROCEvaluation;
%rename(PRCEvaluation) CPRCEvaluation;
%rename(AccuracyMeasure) CAccuracyMeasure;
%rename(ErrorRateMeasure) CErrorRateMeasure;
%rename(BALMeasure) CBALMeasure;
%rename(WRACCMeasure) CWRACCMeasure;
%rename(F1Measure) CF1Measure;
%rename(CrossCorrelationMeasure) CCrossCorrelationMeasure;
%rename(RecallMeasure) CRecallMeasure;
%rename(PrecisionMeasure) CPrecisionMeasure;
%rename(SpecificityMeasure) CSpecificityMeasure;
%rename(CrossValidation) CCrossValidation;
%rename(SplittingStrategy) CSplittingStrategy;
%rename(StratifiedCrossValidationSplitting) CStratifiedCrossValidationSplitting;
%rename(CrossValidationSplitting) CCrossValidationSplitting;
%rename(DifferentiableFunction) CDifferentiableFunction;
%rename(GradientCriterion) CGradientCriterion;
%rename(GradientEvaluation) CGradientEvaluation;
%rename(MulticlassOVREvaluation) CMulticlassOVREvaluation;
%rename(CrossValidationResult) CCrossValidationResult;
%rename(CrossValidationOutput) CCrossValidationOutput;
%rename(CrossValidationPrintOutput) CCrossValidationPrintOutput;
%rename(CrossValidationMKLStorage) CCrossValidationMKLStorage;
%rename(CrossValidationMulticlassStorage) CCrossValidationMulticlassStorage;
%rename(StructuredAccuracy) CStructuredAccuracy;
%rename(DirectorContingencyTableEvaluation) CDirectorContingencyTableEvaluation;

/* Include Class Headers to make them visible from within the target language */
%include <evaluation/EvaluationResult.h>
%include <evaluation/Evaluation.h>
%include <evaluation/BinaryClassEvaluation.h>
%include <evaluation/ClusteringEvaluation.h>
%include <evaluation/ClusteringAccuracy.h>
%include <evaluation/ClusteringMutualInformation.h>
%include <evaluation/ContingencyTableEvaluation.h>
%include <evaluation/MulticlassAccuracy.h>
%include <evaluation/MeanAbsoluteError.h>
%include <evaluation/MeanSquaredError.h>
%include <evaluation/MeanSquaredLogError.h>
%include <evaluation/ROCEvaluation.h>
%include <evaluation/PRCEvaluation.h>
%include <evaluation/MachineEvaluation.h>
%include <evaluation/CrossValidation.h>
%include <evaluation/SplittingStrategy.h>
%include <evaluation/DifferentiableFunction.h>
%include <evaluation/GradientCriterion.h>
%include <evaluation/GradientEvaluation.h>
%include <evaluation/GradientResult.h>
%include <evaluation/MulticlassOVREvaluation.h>
%include <evaluation/StratifiedCrossValidationSplitting.h>
%include <evaluation/CrossValidationSplitting.h>
%include <evaluation/CrossValidationOutput.h>
%include <evaluation/CrossValidationPrintOutput.h>
%include <evaluation/CrossValidationMKLStorage.h>
%include <evaluation/CrossValidationMulticlassStorage.h>
%include <evaluation/StructuredAccuracy.h>
%include <evaluation/DirectorContingencyTableEvaluation.h>
