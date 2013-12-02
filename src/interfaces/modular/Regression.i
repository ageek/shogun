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

/* Remove C Prefix */
%rename(Regression) CRegression;
%rename(KernelRidgeRegression) CKernelRidgeRegression;
%rename(LinearRidgeRegression) CLinearRidgeRegression;
%rename(LeastSquaresRegression) CLeastSquaresRegression;
%rename(LeastAngleRegression) CLeastAngleRegression;
%rename(LibSVR) CLibSVR;
%rename(LibLinearRegression) CLibLinearRegression;
%rename(MKL) CMKL;
%rename(MKLRegression) CMKLRegression;

#ifdef SHOGUN_USE_SVMLIGHT
%rename(SVRLight) CSVRLight;
#endif // SHOGUN_USE_SVMLIGHT


/* Include Class Headers to make them visible from within the target language */
%include <regression/Regression.h>
%include <regression/KernelRidgeRegression.h>
%include <regression/LinearRidgeRegression.h>
%include <regression/LeastSquaresRegression.h>
%include <regression/LeastAngleRegression.h>
%include <regression/svr/LibSVR.h>
%include <regression/svr/LibLinearRegression.h>
%include <classifier/mkl/MKL.h>
%include <regression/svr/MKLRegression.h>
#ifdef SHOGUN_USE_SVMLIGHT
%include <regression/svr/SVRLight.h>
#endif // SHOGUN_USE_SVMLIGHT
