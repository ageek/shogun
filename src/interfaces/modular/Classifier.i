/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2009 Soeren Sonnenburg
 * Written (W) 2013 Heiko Strathmann
 * Copyright (C) 2009 Fraunhofer Institute FIRST and Max-Planck-Society
 */

#ifdef HAVE_PYTHON
%feature("autodoc", "get_w(self) -> [] of float") get_w;
%feature("autodoc", "get_support_vectors(self) -> [] of int") get_support_vectors;
%feature("autodoc", "get_alphas(self) -> [] of float") get_alphas;
#endif

#if defined(USE_SWIG_DIRECTORS) && defined(SWIGPYTHON)
%feature("director") shogun::CDirectorLinearMachine;
%feature("director") shogun::CDirectorKernelMachine;
%feature("director:except") {
    if ($error != NULL) {
        throw Swig::DirectorMethodException();
    }
}
#endif

/* Remove C Prefix */
%rename(Machine) CMachine;
%rename(KernelMachine) CKernelMachine;
%rename(GNPPSVM) CGNPPSVM;
%rename(GPBTSVM) CGPBTSVM;
%rename(LDA) CLDA;
%rename(LibLinear) CLibLinear;
%rename(LibSVM) CLibSVM;
%rename(LibSVMOneClass) CLibSVMOneClass;
%rename(LinearMachine) CLinearMachine;
%rename(OnlineLinearMachine) COnlineLinearMachine;
%rename(LPBoost) CLPBoost;
%rename(LPM) CLPM;
%rename(MPDSVM) CMPDSVM;
%rename(OnlineSVMSGD) COnlineSVMSGD;
%rename(OnlineLibLinear) COnlineLibLinear;
%rename(Perceptron) CPerceptron;
%rename(AveragedPerceptron) CAveragedPerceptron;
%rename(NewtonSVM) CNewtonSVM;
#ifndef HAVE_PYTHON
%rename(SVM) CSVM;
#endif
%rename(SVMLin) CSVMLin;
%rename(SVMOcas) CSVMOcas;
%rename(SVMSGD) CSVMSGD;
%rename(SGDQN) CSGDQN;
%rename(WDSVMOcas) CWDSVMOcas;
%rename(PluginEstimate) CPluginEstimate;
%rename(MKL) CMKL;
%rename(MKLClassification) CMKLClassification;
%rename(MKLOneClass) CMKLOneClass;
%rename(VowpalWabbit) CVowpalWabbit;
#ifdef USE_SVMLIGHT
%rename(SVMLight) CSVMLight;
%rename(SVMLightOneClass) CSVMLightOneClass;
#endif //USE_SVMLIGHT
%rename(FeatureBlockLogisticRegression) CFeatureBlockLogisticRegression;
%rename(DirectorLinearMachine) CDirectorLinearMachine;
%rename(DirectorKernelMachine) CDirectorKernelMachine;
%rename(BaggingMachine) CBaggingMachine;

/* These functions return new Objects */
%newobject apply();
%newobject apply(CFeatures* data);
%newobject apply_locked(const SGVector<index_t>& indices);
%newobject classify();
%newobject classify(CFeatures* data);

/* Include Class Headers to make them visible from within the target language */
%include <machine/Machine.h>
%include <machine/KernelMachine.h>
%include <machine/DistanceMachine.h>
%include <classifier/svm/SVM.h>
%include <machine/LinearMachine.h>
%include <machine/OnlineLinearMachine.h>
%include <classifier/svm/GNPPSVM.h>
%include <classifier/svm/GPBTSVM.h>
%include <classifier/LDA.h>
%include <classifier/svm/LibLinear.h>
%include <classifier/svm/LibSVM.h>
%include <classifier/svm/LibSVMOneClass.h>
%include <classifier/LPBoost.h>
%include <classifier/LPM.h>
%include <classifier/svm/MPDSVM.h>
%include <classifier/svm/OnlineSVMSGD.h>
%include <classifier/svm/OnlineLibLinear.h>
%include <classifier/Perceptron.h>
%include <classifier/AveragedPerceptron.h>
%include <classifier/svm/SVMLin.h>
%include <classifier/svm/SVMOcas.h>
%include <classifier/svm/SVMSGD.h>
%include <classifier/svm/SGDQN.h>
%include <classifier/svm/WDSVMOcas.h>
%include <classifier/PluginEstimate.h>
%include <classifier/mkl/MKL.h>
%include <classifier/mkl/MKLClassification.h>
%include <classifier/mkl/MKLOneClass.h>
%include <classifier/vw/VowpalWabbit.h>
%include <classifier/svm/NewtonSVM.h>
%include <classifier/FeatureBlockLogisticRegression.h>
%include <machine/DirectorLinearMachine.h>
%include <machine/DirectorKernelMachine.h>
%include <machine/BaggingMachine.h>

#ifdef USE_SVMLIGHT

%ignore VERSION;
%ignore VERSION_DATE;
%ignore MAXSHRINK;
%ignore SHRINK_STATE;
%ignore MODEL;
%ignore LEARN_PARM;
%ignore TIMING;

%include <classifier/svm/SVMLight.h>
%include <classifier/svm/SVMLightOneClass.h>

#endif //USE_SVMLIGHT
