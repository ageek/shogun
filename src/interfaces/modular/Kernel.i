/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2009 Soeren Sonnenburg
 * Copyright (C) 2009 Fraunhofer Institute FIRST and Max-Planck-Society
 */
#ifdef HAVE_PYTHON
%feature("autodoc", "get_kernel_matrix(self) -> numpy 2dim array of float") get_kernel_matrix;
%feature("autodoc", "get_POIM2(self) -> [] of float") get_POIM2;
#endif

%ignore CWeightedDegreePositionStringKernel::set_position_weights(float64_t*);

#if defined(USE_SWIG_DIRECTORS) && defined(SWIGPYTHON)
%feature("director") shogun::CDirectorKernel;
%feature("director:except") {
    if ($error != NULL) {
        throw Swig::DirectorMethodException();
    }
}
#endif

#ifndef SWIGPYTHON
#define PROTOCOLS_CUSTOMKERNEL(class_name, type_name, format_str, typecode)
#define EXTEND_CUSTOMKERNEL(class_name, type_name, typecode)
#endif

/* Remove C Prefix */
%rename(Kernel) CKernel;
%rename(KernelNormalizer) CKernelNormalizer;
%rename(PyramidChi2) CPyramidChi2;
%rename(ANOVAKernel) CANOVAKernel;
%rename(AUCKernel) CAUCKernel;
%rename(AvgDiagKernelNormalizer) CAvgDiagKernelNormalizer;
%rename(RidgeKernelNormalizer) CRidgeKernelNormalizer;
%rename(CircularKernel) CCircularKernel;
%rename(Chi2Kernel) CChi2Kernel;
%rename(CombinedKernel) CCombinedKernel;
%rename(ProductKernel) CProductKernel;
%rename(CommUlongStringKernel) CCommUlongStringKernel;
%rename(CommWordStringKernel) CCommWordStringKernel;
%rename(ConstKernel) CConstKernel;

PROTOCOLS_CUSTOMKERNEL(CustomKernel, float32_t, "f\0", NPY_FLOAT32)
%rename(CustomKernel) CCustomKernel;

%rename(DiagKernel) CDiagKernel;
%rename(DistantSegmentsKernel) CDistantSegmentsKernel;
%rename(WaveKernel) CWaveKernel;
%rename(CauchyKernel) CCauchyKernel;
%rename(DiceKernelNormalizer) CDiceKernelNormalizer;
%rename(ExponentialKernel) CExponentialKernel;
%rename(ScatterKernelNormalizer) CScatterKernelNormalizer;
%rename(VarianceKernelNormalizer) CVarianceKernelNormalizer;
%rename(DistanceKernel) CDistanceKernel;
%rename(FixedDegreeStringKernel) CFixedDegreeStringKernel;
%rename(GaussianKernel) CGaussianKernel;
%rename(DirectorKernel) CDirectorKernel;
%rename(WaveletKernel) CWaveletKernel;
%rename(GaussianShiftKernel) CGaussianShiftKernel;
%rename(GaussianShortRealKernel) CGaussianShortRealKernel;
%rename(HistogramIntersectionKernel) CHistogramIntersectionKernel;
%rename(HistogramWordStringKernel) CHistogramWordStringKernel;
%rename(IdentityKernelNormalizer) CIdentityKernelNormalizer;
%rename(InverseMultiQuadricKernel) CInverseMultiQuadricKernel;
%rename(LinearKernel) CLinearKernel;
%rename(LinearStringKernel) CLinearStringKernel;
%rename(SparseSpatialSampleStringKernel) CSparseSpatialSampleStringKernel;
%rename(SplineKernel) CSplineKernel;
%rename(LocalAlignmentStringKernel) CLocalAlignmentStringKernel;
%rename(LocalityImprovedStringKernel) CLocalityImprovedStringKernel;
%rename(MatchWordStringKernel) CMatchWordStringKernel;
%rename(OligoStringKernel) COligoStringKernel;
%rename(PolyKernel) CPolyKernel;
%rename(PolyMatchStringKernel) CPolyMatchStringKernel;
%rename(PowerKernel) CPowerKernel;
%rename(LogKernel) CLogKernel;
%rename(GaussianMatchStringKernel) CGaussianMatchStringKernel;
%rename(SNPStringKernel) CSNPStringKernel;
%rename(RegulatoryModulesStringKernel) CRegulatoryModulesStringKernel;
%rename(PolyMatchWordStringKernel) CPolyMatchWordStringKernel;
%rename(SalzbergWordStringKernel) CSalzbergWordStringKernel;
%rename(SigmoidKernel) CSigmoidKernel;
%rename(SphericalKernel) CSphericalKernel;
%rename(SimpleLocalityImprovedStringKernel) CSimpleLocalityImprovedStringKernel;
%rename(SqrtDiagKernelNormalizer) CSqrtDiagKernelNormalizer;
%rename(TanimotoKernelNormalizer) CTanimotoKernelNormalizer;
%rename(TensorProductPairKernel) CTensorProductPairKernel;
%rename(TStudentKernel) CTStudentKernel;
%rename(WeightedCommWordStringKernel) CWeightedCommWordStringKernel;
%rename(WeightedDegreePositionStringKernel) CWeightedDegreePositionStringKernel;
%rename(WeightedDegreeStringKernel) CWeightedDegreeStringKernel;
%rename(WeightedDegreeRBFKernel) CWeightedDegreeRBFKernel;
%rename(SpectrumMismatchRBFKernel) CSpectrumMismatchRBFKernel;
%rename(ZeroMeanCenterKernelNormalizer) CZeroMeanCenterKernelNormalizer;
%rename(DotKernel) CDotKernel;
%rename(RationalQuadraticKernel) CRationalQuadraticKernel;
%rename(MultiquadricKernel) CMultiquadricKernel;
%rename(JensenShannonKernel) CJensenShannonKernel;
%rename(LinearARDKernel) CLinearARDKernel;
%rename(GaussianARDKernel) CGaussianARDKernel;

/* Include Class Headers to make them visible from within the target language */
%include <kernel/Kernel.h>

%include <kernel/DotKernel.h>

/* Templated Class SparseKernel */
%include <kernel/SparseKernel.h>
namespace shogun
{
#ifdef USE_FLOAT64
    %template(SparseRealKernel) CSparseKernel<float64_t>;
#endif
#ifdef USE_UINT16
    %template(SparseWordKernel) CSparseKernel<uint16_t>;
#endif
}

/* Templated Class StringKernel */
%include <kernel/string/StringKernel.h>
namespace shogun
{
#ifdef USE_FLOAT64
    %template(StringRealKernel) CStringKernel<float64_t>;
#endif
#ifdef USE_UINT16
    %template(StringWordKernel) CStringKernel<uint16_t>;
#endif
#ifdef USE_CHAR
    %template(StringCharKernel) CStringKernel<char>;
#endif
#ifdef USE_UINT32
    %template(StringIntKernel) CStringKernel<int32_t>;
#endif
#ifdef USE_UINT64
    %template(StringUlongKernel) CStringKernel<uint64_t>;
#endif
#ifdef USE_UINT16
    %template(StringShortKernel) CStringKernel<int16_t>;
#endif
#ifdef USE_UINT8
    %template(StringByteKernel) CStringKernel<uint8_t>;
#endif
}

%include <kernel/normalizer/KernelNormalizer.h>
%include <kernel/normalizer/AvgDiagKernelNormalizer.h>
%include <kernel/normalizer/RidgeKernelNormalizer.h>
%include <kernel/normalizer/DiceKernelNormalizer.h>
%include <kernel/normalizer/ScatterKernelNormalizer.h>
%include <kernel/normalizer/VarianceKernelNormalizer.h>
%include <kernel/normalizer/IdentityKernelNormalizer.h>
%include <kernel/normalizer/SqrtDiagKernelNormalizer.h>
%include <kernel/normalizer/TanimotoKernelNormalizer.h>
%include <kernel/normalizer/ZeroMeanCenterKernelNormalizer.h>

%include <kernel/PyramidChi2.h>
%include <kernel/ANOVAKernel.h>
%include <kernel/AUCKernel.h>
%include <kernel/CauchyKernel.h>
%include <kernel/CircularKernel.h>
%include <kernel/Chi2Kernel.h>
%include <kernel/CombinedKernel.h>
%include <kernel/ProductKernel.h>
%include <kernel/string/CommUlongStringKernel.h>
%include <kernel/string/CommWordStringKernel.h>
%include <kernel/ConstKernel.h>
%include <kernel/CustomKernel.h>
%include <kernel/DiagKernel.h>
%include <kernel/DistanceKernel.h>
%include <kernel/string/DistantSegmentsKernel.h>
%include <kernel/ExponentialKernel.h>
%include <kernel/string/FixedDegreeStringKernel.h>
%include <kernel/GaussianKernel.h>
%include <kernel/DirectorKernel.h>
%include <kernel/GaussianShiftKernel.h>
%include <kernel/GaussianShortRealKernel.h>
%include <kernel/HistogramIntersectionKernel.h>
%include <kernel/string/HistogramWordStringKernel.h>
%include <kernel/InverseMultiQuadricKernel.h>
%include <kernel/LinearKernel.h>
%include <kernel/string/LinearStringKernel.h>
%include <kernel/string/SparseSpatialSampleStringKernel.h>
%include <kernel/string/LocalAlignmentStringKernel.h>
%include <kernel/string/LocalityImprovedStringKernel.h>
%include <kernel/string/MatchWordStringKernel.h>
%include <kernel/string/OligoStringKernel.h>
%include <kernel/PolyKernel.h>
%include <kernel/string/PolyMatchStringKernel.h>
%include <kernel/PowerKernel.h>
%include <kernel/LogKernel.h>
%include <kernel/string/GaussianMatchStringKernel.h>
%include <kernel/string/SNPStringKernel.h>
%include <kernel/string/RegulatoryModulesStringKernel.h>
%include <kernel/string/PolyMatchWordStringKernel.h>
%include <kernel/string/SalzbergWordStringKernel.h>
%include <kernel/SigmoidKernel.h>
%include <kernel/string/SimpleLocalityImprovedStringKernel.h>
%include <kernel/SphericalKernel.h>
%include <kernel/SplineKernel.h>
%include <kernel/TensorProductPairKernel.h>
%include <kernel/TStudentKernel.h>
%include <kernel/WaveKernel.h>
%include <kernel/WaveletKernel.h>
%include <kernel/string/WeightedCommWordStringKernel.h>
%include <kernel/string/WeightedDegreePositionStringKernel.h>
%include <kernel/string/WeightedDegreeStringKernel.h>
%include <kernel/WeightedDegreeRBFKernel.h>
%include <kernel/string/SpectrumMismatchRBFKernel.h>
%include <kernel/MultiquadricKernel.h>
%include <kernel/RationalQuadraticKernel.h>
%include <kernel/JensenShannonKernel.h>
%include <kernel/LinearARDKernel.h>
%include <kernel/GaussianARDKernel.h>

EXTEND_CUSTOMKERNEL(CustomKernel, float32_t, NPY_FLOAT32)
