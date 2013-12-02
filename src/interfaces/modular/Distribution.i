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
%feature("autodoc", "get_log_likelihood(self) -> numpy 1dim array of float") get_log_likelihood;
%feature("autodoc", "get_histogram(self) -> numpy 1dim array of float") get_histogram;
%feature("autodoc", "get_log_transition_probs(self) -> numpy 1dim array of %float") get_log_transition_probs;
%feature("autodoc", "get_transition_probs(self) -> numpy 1dim array of %float") get_transition_probs;
#endif

/* Remove C Prefix */
%rename(Distribution) CDistribution;
%rename(Histogram) CHistogram;
%rename(HMM) CHMM;
%rename(GHMM) CGHMM;
%rename(LinearHMM) CLinearHMM;
%rename(PositionalPWM) CPositionalPWM;
%rename(Gaussian) CGaussian;
%rename(GMM) CGMM;
#ifdef SHOGUN_HAVE_EIGEN3
%rename(GaussianDistribution) CGaussianDistribution;
#endif // SHOGUN_HAVE_EIGEN3

/* Include Class Headers to make them visible from within the target language */
%include <distributions/Distribution.h>
%include <distributions/Histogram.h>
%include <distributions/HMM.h>
%include <distributions/GHMM.h>
%include <distributions/LinearHMM.h>
%include <distributions/PositionalPWM.h>
%include <distributions/Gaussian.h>
%include <clustering/GMM.h>
#ifdef SHOGUN_HAVE_EIGEN3
%include <distributions/classical/ProbabilityDistribution.h>
%include <distributions/classical/GaussianDistribution.h>
#endif // SHOGUN_HAVE_EIGEN3
