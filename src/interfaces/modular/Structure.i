/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2009 Soeren Sonnenburg, 2012 Fernando José Iglesias García
 * Copyright (C) 2009 Fraunhofer Institute FIRST and Max-Planck-Society
 */

#if defined(SHOGUN_USE_SWIG_DIRECTORS) && defined(SWIGPYTHON)
%feature("director") shogun::CDirectorStructuredModel;
#endif

/* Remove C Prefix */
%rename(PlifBase) CPlifBase;
%rename(Plif) CPlif;
%rename(PlifArray) CPlifArray;
%rename(DynProg) CDynProg;
%rename(PlifMatrix) CPlifMatrix;
%rename(SegmentLoss) CSegmentLoss;
%rename(IntronList) CIntronList;

%rename(StructuredModel) CStructuredModel;
%rename(ResultSet) CResultSet;
%rename(MulticlassModel) CMulticlassModel;
%rename(MulticlassSOLabels) CMulticlassSOLabels;
%rename(RealNumber) CRealNumber;
%rename(HMSVMModel) CHMSVMModel;
%rename(SequenceLabels) CSequenceLabels;
%rename(Sequence) CSequence;
%rename(StateModel) CStateModel;
%rename(TwoStateModel) CTwoStateModel;
%rename(DirectorStructuredModel) CDirectorStructuredModel;

%rename(FactorType) CFactorType;
%rename(TableFactorType) CTableFactorType;
%rename(FactorDataSource) CFactorDataSource;
%rename(Factor) CFactor;
%rename(DisjointSet) CDisjointSet;
%rename(FactorGraph) CFactorGraph;
%rename(FactorGraphObservation) CFactorGraphObservation;
%rename(FactorGraphLabels) CFactorGraphLabels;
%rename(FactorGraphFeatures) CFactorGraphFeatures;
%rename(MAPInference) CMAPInference;
%rename(FactorGraphModel) CFactorGraphModel;

%rename(SOSVMHelper) CSOSVMHelper;
%rename(StructuredOutputMachine) CStructuredOutputMachine;
%rename(LinearStructuredOutputMachine) CLinearStructuredOutputMachine;
%rename(KernelStructuredOutputMachine) CKernelStructuredOutputMachine;
%rename(DualLibQPBMSOSVM) CDualLibQPBMSOSVM;

#ifdef SHOGUN_USE_MOSEK
%rename(PrimalMosekSOSVM) CPrimalMosekSOSVM;
#endif /* SHOGUN_USE_MOSEK */

%rename(StochasticSOSVM) CStochasticSOSVM;

/* Include Class Headers to make them visible from within the target language */
%include <structure/PlifBase.h>
%include <structure/Plif.h>
%include <structure/PlifArray.h>
%include <structure/DynProg.h>
%include <structure/PlifMatrix.h>
%include <structure/IntronList.h>
%include <structure/SegmentLoss.h>

%include <structure/BmrmStatistics.h>
%include <structure/StructuredModel.h>
%include <structure/MulticlassModel.h>
%include <structure/MulticlassSOLabels.h>
%include <structure/HMSVMModel.h>
%include <structure/SequenceLabels.h>
%include <structure/StateModelTypes.h>
%include <structure/StateModel.h>
%include <structure/TwoStateModel.h>
%include <structure/DirectorStructuredModel.h>

%include <structure/FactorType.h>
%include <structure/Factor.h>
%include <structure/DisjointSet.h>
%include <structure/FactorGraph.h>
%include <features/FactorGraphFeatures.h>
%include <labels/FactorGraphLabels.h>
%include <structure/MAPInference.h>
%include <structure/FactorGraphModel.h>

%include <structure/SOSVMHelper.h>
%include <machine/StructuredOutputMachine.h>
%include <machine/LinearStructuredOutputMachine.h>
%include <machine/KernelStructuredOutputMachine.h>

%include <structure/DualLibQPBMSOSVM.h>

#ifdef SHOGUN_USE_MOSEK
%include <structure/PrimalMosekSOSVM.h>
#endif /* SHOGUN_USE_MOSEK */

%include <structure/StochasticSOSVM.h>
