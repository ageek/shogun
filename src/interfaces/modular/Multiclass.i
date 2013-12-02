/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2012 Sergey Lisitsyn
 * Copyright (C) 2012 Sergey Lisitsyn
 */

/* Remove C Prefix */
%rename(BalancedConditionalProbabilityTree) CBalancedConditionalProbabilityTree;
%rename(ConditionalProbabilityTree) CConditionalProbabilityTree;
%rename(RandomConditionalProbabilityTree) CRandomConditionalProbabilityTree;
%rename(RelaxedTree) CRelaxedTree;
%rename(RelaxedTreeNodeData) CRelaxedTreeNodeData;
%rename(TreeMachineNode) CTreeMachineNode;
%rename(VwConditionalProbabilityTree) VwConditionalProbabilityTree;

%rename(RejectionStrategy) CRejectionStrategy;
%rename(ThresholdRejectionStrategy) CThresholdRejectionStrategy;
%rename(DixonQTestRejectionStrategy) CDixonQTestRejectionStrategy;
%rename(MulticlassStrategy) CMulticlassStrategy;
%rename(MulticlassOneVsRestStrategy) CMulticlassOneVsRestStrategy;
%rename(MulticlassOneVsOneStrategy) CMulticlassOneVsOneStrategy;
%rename(BaseMulticlassMachine) CBaseMulticlassMachine;
%rename(MulticlassMachine) CMulticlassMachine;
%rename(NativeMulticlassMachine) CNativeMulticlassMachine;
%rename(LinearMulticlassMachine) CLinearMulticlassMachine;
%rename(KernelMulticlassMachine) CKernelMulticlassMachine;
%rename(MulticlassSVM) CMulticlassSVM;
%rename(MKLMulticlass) CMKLMulticlass;

%newobject apply_multiclass_multiple_output();

%rename(ECOCStrategy) CECOCStrategy;
%rename(ECOCEncoder) CECOCEncoder;
%rename(ECOCDecoder) CECOCDecoder;
%rename(ECOCOVREncoder) CECOCOVREncoder;
%rename(ECOCOVOEncoder) CECOCOVOEncoder;
%rename(ECOCRandomSparseEncoder) CECOCRandomSparseEncoder;
%rename(ECOCRandomDenseEncoder) CECOCRandomDenseEncoder;
%rename(ECOCDiscriminantEncoder) CECOCDiscriminantEncoder;
%rename(ECOCForestEncoder) CECOCForestEncoder;
%rename(ECOCSimpleDecoder) CECOCSimpleDecoder;
%rename(ECOCHDDecoder) CECOCHDDecoder;
%rename(ECOCIHDDecoder) CECOCIHDDecoder;
%rename(ECOCEDDecoder) CECOCEDDecoder;
%rename(ECOCAEDDecoder) CECOCAEDDecoder;
%rename(ECOCLLBDecoder) CECOCLLBDecoder;

%rename(MulticlassTreeGuidedLogisticRegression) CMulticlassTreeGuidedLogisticRegression;
%rename(MulticlassLogisticRegression) CMulticlassLogisticRegression;
%rename(MulticlassLibLinear) CMulticlassLibLinear;
%rename(MulticlassOCAS) CMulticlassOCAS;
%rename(MulticlassSVM) CMulticlassSVM;
%rename(MulticlassLibSVM) CMulticlassLibSVM;
%rename(LaRank) CLaRank;
%rename(ScatterSVM) CScatterSVM;
%rename(GMNPSVM) CGMNPSVM;
%rename(KNN) CKNN;
%rename(GaussianNaiveBayes) CGaussianNaiveBayes;
%rename(QDA) CQDA;
%rename(MCLDA) CMCLDA;

%rename(ShareBoost) CShareBoost;

/* Include Class Headers to make them visible from within the target language */
%include <machine/BaseMulticlassMachine.h>
%include <multiclass/tree/TreeMachine.h>
%include <multiclass/tree/RelaxedTreeNodeData.h>
%include <multiclass/tree/ConditionalProbabilityTreeNodeData.h>
namespace shogun
{
    %template(TreeMachineWithConditionalProbabilityTreeNodeData) CTreeMachine<ConditionalProbabilityTreeNodeData>;
    %template(TreeMachineWithRelaxedTreeNodeData) CTreeMachine<RelaxedTreeNodeData>;
}

%include <multiclass/tree/ConditionalProbabilityTree.h>
%include <multiclass/tree/BalancedConditionalProbabilityTree.h>
%include <multiclass/tree/RandomConditionalProbabilityTree.h>
%include <multiclass/tree/RelaxedTree.h>
%include <multiclass/tree/TreeMachineNode.h>
%include <multiclass/tree/VwConditionalProbabilityTree.h>

%include <multiclass/RejectionStrategy.h>
%include <multiclass/MulticlassStrategy.h>
%include <multiclass/MulticlassOneVsRestStrategy.h>
%include <multiclass/MulticlassOneVsOneStrategy.h>
%include <machine/MulticlassMachine.h>
%include <machine/NativeMulticlassMachine.h>
%include <machine/LinearMulticlassMachine.h>
%include <machine/KernelMulticlassMachine.h>
%include <multiclass/MulticlassSVM.h>
%include <classifier/mkl/MKLMulticlass.h>

%include <multiclass/ecoc/ECOCEncoder.h>
%include <multiclass/ecoc/ECOCDecoder.h>
%include <multiclass/ecoc/ECOCOVREncoder.h>
%include <multiclass/ecoc/ECOCOVOEncoder.h>
%include <multiclass/ecoc/ECOCRandomSparseEncoder.h>
%include <multiclass/ecoc/ECOCRandomDenseEncoder.h>
%include <multiclass/ecoc/ECOCDiscriminantEncoder.h>
%include <multiclass/ecoc/ECOCForestEncoder.h>
%include <multiclass/ecoc/ECOCSimpleDecoder.h>
%include <multiclass/ecoc/ECOCHDDecoder.h>
%include <multiclass/ecoc/ECOCIHDDecoder.h>
%include <multiclass/ecoc/ECOCEDDecoder.h>
%include <multiclass/ecoc/ECOCAEDDecoder.h>
%include <multiclass/ecoc/ECOCLLBDecoder.h>
%include <multiclass/ecoc/ECOCStrategy.h>

%include <multiclass/MulticlassTreeGuidedLogisticRegression.h>
%include <multiclass/MulticlassLogisticRegression.h>
%include <multiclass/MulticlassLibLinear.h>
%include <multiclass/MulticlassOCAS.h>
%include <multiclass/MulticlassSVM.h>
%include <multiclass/MulticlassLibSVM.h>
%include <multiclass/LaRank.h>
%include <multiclass/ScatterSVM.h>
%include <multiclass/GMNPSVM.h>
%include <multiclass/KNN.h>
%include <multiclass/GaussianNaiveBayes.h>
%include <multiclass/QDA.h>
%include <multiclass/MCLDA.h>
%include <multiclass/ShareBoost.h>
