/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2012-2013 Heiko Strathmann
 */

/* Remove C Prefix */
%rename(TestStatistic) CTestStatistic;
%rename(TwoDistributionsTestStatistic) CTwoDistributionsTestStatistic;
%rename(KernelTwoSampleTestStatistic) CKernelTwoSampleTestStatistic;
%rename(LinearTimeMMD) CLinearTimeMMD;
%rename(QuadraticTimeMMD) CQuadraticTimeMMD;
%rename(KernelIndependenceTestStatistic) CKernelIndependenceTestStatistic;
%rename(HSIC) CHSIC;
%rename(KernelMeanMatching) CKernelMeanMatching;
%rename(MMDKernelSelection) CMMDKernelSelection;
%rename(MMDKernelSelectionComb) CMMDKernelSelectionComb;
%rename(MMDKernelSelectionMedian) CMMDKernelSelectionMedian;
%rename(MMDKernelSelectionMax) CMMDKernelSelectionMax;
%rename(MMDKernelSelectionOpt) CMMDKernelSelectionOpt;
%rename(MMDKernelSelectionCombOpt) CMMDKernelSelectionCombOpt;
%rename(MMDKernelSelectionCombMaxL2) CMMDKernelSelectionCombMaxL2;


/* Include Class Headers to make them visible from within the target language */
%include <statistics/TestStatistic.h>
%include <statistics/TwoDistributionsTestStatistic.h>
%include <statistics/KernelTwoSampleTestStatistic.h>
%include <statistics/LinearTimeMMD.h>
%include <statistics/QuadraticTimeMMD.h>
%include <statistics/KernelIndependenceTestStatistic.h>
%include <statistics/HSIC.h>
%include <statistics/KernelMeanMatching.h>
%include <statistics/MMDKernelSelection.h>
%include <statistics/MMDKernelSelectionComb.h>
%include <statistics/MMDKernelSelectionMedian.h>
%include <statistics/MMDKernelSelectionMax.h>
%include <statistics/MMDKernelSelectionOpt.h>
%include <statistics/MMDKernelSelectionCombOpt.h>
%include <statistics/MMDKernelSelectionCombMaxL2.h>
