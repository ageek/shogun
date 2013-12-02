/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2009 Soeren Sonnenburg
 * Copyright (C) 2009 Fraunhofer Institute FIRST and Max-Planck-Society
 */

#ifdef SHOGUN_HAVE_PYTHON
%feature("autodoc", "get_distance_matrix(self) -> numpy 2dim array of float") get_distance_matrix;
#endif

#if defined(SHOGUN_USE_SWIG_DIRECTORS) && defined(SWIGPYTHON)
%feature("director") shogun::CDirectorDistance;
%feature("director:except") {
    if ($error != NULL) {
        throw Swig::DirectorMethodException();
    }
}
#endif

/* Remove C Prefix */
%rename(Distance) CDistance;
%rename(CustomDistance) CCustomDistance;
%rename(KernelDistance) CKernelDistance;
%rename(RealDistance) CRealDistance;
%rename(CanberraMetric) CCanberraMetric;
%rename(ChebyshewMetric) CChebyshewMetric;
%rename(GeodesicMetric) CGeodesicMetric;
%rename(JensenMetric) CJensenMetric;
%rename(ManhattanMetric) CManhattanMetric;
%rename(MinkowskiMetric) CMinkowskiMetric;
%rename(HammingWordDistance) CHammingWordDistance;
%rename(ManhattanWordDistance) CManhattanWordDistance;
%rename(CanberraWordDistance) CCanberraWordDistance;
%rename(EuclideanDistance) CEuclideanDistance;
%rename(SparseEuclideanDistance) CSparseEuclideanDistance;
%rename(BrayCurtisDistance) CBrayCurtisDistance;
%rename(ChiSquareDistance) CChiSquareDistance;
%rename(CosineDistance) CCosineDistance;
%rename(TanimotoDistance) CTanimotoDistance;
%rename(MahalanobisDistance) CMahalanobisDistance;
%rename(DirectorDistance) CDirectorDistance;
%rename(CustomMahalanobisDistance) CCustomMahalanobisDistance;

/* Include Class Headers to make them visible from within the target language */
%include <distance/Distance.h>
%include <distance/CustomDistance.h>
%include <distance/KernelDistance.h>

/* Templates Class DenseDistance*/
%include <distance/DenseDistance.h>
namespace shogun
{
#ifdef SHOGUN_USE_CHAR
    %template(DenseCharDistance) CDenseDistance<char>;
#endif
#ifdef SHOGUN_USE_UINT16
    %template(DenseWordDistance) CDenseDistance<uint16_t>;
#endif
#ifdef SHOGUN_USE_INT32
    %template(DenseIntDistance) CDenseDistance<int32_t>;
#endif
#ifdef SHOGUN_USE_FLOAT64
    %template(DenseRealDistance) CDenseDistance<float64_t>;
#endif

}

/* Templates Class SparseDistance*/
%include <distance/SparseDistance.h>
namespace shogun
{
#ifdef SHOGUN_USE_CHAR
    %template(SparseCharDistance) CSparseDistance<char>;
#endif
#ifdef SHOGUN_USE_UINT16
    %template(SparseWordDistance) CSparseDistance<uint16_t>;
#endif
#ifdef SHOGUN_USE_INT32
    %template(SparseIntDistance) CSparseDistance<int32_t>;
#endif
#ifdef SHOGUN_USE_FLOAT64
    %template(SparseRealDistance) CSparseDistance<float64_t>;
#endif
}

/* Templates Class StringDistance*/
%include <distance/StringDistance.h>
namespace shogun
{
#ifdef SHOGUN_USE_CHAR
    %template(StringCharDistance) CStringDistance<char>;
#endif
#ifdef SHOGUN_USE_UINT16
    %template(StringWordDistance) CStringDistance<uint16_t>;
#endif
#ifdef SHOGUN_USE_INT32
    %template(StringIntDistance) CStringDistance<int32_t>;
#endif
#ifdef SHOGUN_USE_UINT64
    %template(StringUlongDistance) CStringDistance<uint64_t>;
#endif
#ifdef SHOGUN_USE_FLOAT64
    %template(StringRealDistance) CStringDistance<float64_t>;
#endif
}

%include <distance/RealDistance.h>
%include <distance/CanberraMetric.h>
%include <distance/ChebyshewMetric.h>
%include <distance/GeodesicMetric.h>
%include <distance/JensenMetric.h>
%include <distance/ManhattanMetric.h>
%include <distance/MinkowskiMetric.h>
%include <distance/HammingWordDistance.h>
%include <distance/ManhattanWordDistance.h>
%include <distance/CanberraWordDistance.h>
%include <distance/EuclideanDistance.h>
%include <distance/SparseEuclideanDistance.h>
%include <distance/BrayCurtisDistance.h>
%include <distance/ChiSquareDistance.h>
%include <distance/CosineDistance.h>
%include <distance/TanimotoDistance.h>
%include <distance/MahalanobisDistance.h>
%include <distance/DirectorDistance.h>
%include <distance/CustomMahalanobisDistance.h>
