/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2012 Sergey Lisitsyn
 * Copyright (C) 2012 Sergey Lisitsyn
 */

/* Multitask renames */
%rename(MultitaskKernelNormalizer) CMultitaskKernelNormalizer;
%rename(MultitaskKernelMklNormalizer) CMultitaskKernelMklNormalizer;
%rename(MultitaskKernelTreeNormalizer) CMultitaskKernelTreeNormalizer;
%rename(MultitaskKernelMaskNormalizer) CMultitaskKernelMaskNormalizer;
%rename(MultitaskKernelMaskPairNormalizer) CMultitaskKernelMaskPairNormalizer;
%rename(MultitaskKernelPlifNormalizer) CMultitaskKernelPlifNormalizer;

%rename(Task) CTask;
%rename(TaskRelationBase) CTaskRelation;
%rename(TaskTree) CTaskTree;
%rename(TaskGroup) CTaskGroup;
%rename(MultitaskLinearMachineBase) CMultitaskLinearMachine;
%rename(MultitaskLeastSquaresRegression) CMultitaskLeastSquaresRegression;
%rename(MultitaskLogisticRegression) CMultitaskLogisticRegression;
%rename(MultitaskL12LogisticRegression) CMultitaskL12LogisticRegression;
%rename(MultitaskTraceLogisticRegression) CMultitaskTraceLogisticRegression;
%rename(MultitaskClusteredLogisticRegression) CMultitaskClusteredLogisticRegression;

%rename(MultitaskROCEvaluation) CMultitaskROCEvaluation;

%rename(LibLinearMTL) CLibLinearMTL;

/* Domain adaptation renames */
#ifdef SHOGUN_USE_SVMLIGHT
%rename(DomainAdaptationSVM) CDomainAdaptationSVM;
#endif // SHOGUN_USE_SVMLIGHT
%rename(DomainAdaptationSVMLinear) CDomainAdaptationSVMLinear;
%rename(DomainAdaptationMulticlassLibLinear) CDomainAdaptationMulticlassLibLinear;

/* Multitask includes */
%include <transfer/multitask/MultitaskKernelNormalizer.h>
%include <transfer/multitask/MultitaskKernelMklNormalizer.h>
%include <transfer/multitask/MultitaskKernelTreeNormalizer.h>
%include <transfer/multitask/MultitaskKernelMaskNormalizer.h>
%include <transfer/multitask/MultitaskKernelMaskPairNormalizer.h>
%include <transfer/multitask/MultitaskKernelPlifNormalizer.h>

%include <transfer/multitask/Task.h>
%include <transfer/multitask/TaskRelation.h>
%include <transfer/multitask/TaskTree.h>
%include <transfer/multitask/TaskGroup.h>
%include <transfer/multitask/MultitaskLinearMachine.h>
%include <transfer/multitask/MultitaskLeastSquaresRegression.h>
%include <transfer/multitask/MultitaskLogisticRegression.h>
%include <transfer/multitask/MultitaskL12LogisticRegression.h>
%include <transfer/multitask/MultitaskTraceLogisticRegression.h>
%include <transfer/multitask/MultitaskClusteredLogisticRegression.h>

%include <transfer/multitask/MultitaskROCEvaluation.h>

%include <transfer/multitask/LibLinearMTL.h>

/* Domain adaptation includes */
#ifdef SHOGUN_USE_SVMLIGHT
%include <transfer/domain_adaptation/DomainAdaptationSVM.h>
#endif // SHOGUN_USE_SVMLIGHT
%include <transfer/domain_adaptation/DomainAdaptationSVMLinear.h>
%include <transfer/domain_adaptation/DomainAdaptationMulticlassLibLinear.h>

#ifdef SHOGUN_HAVE_LAPACK
SERIALIZABLE_DUMMY(shogun::MappedSparseMatrix);
#endif
