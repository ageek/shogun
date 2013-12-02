/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2012 Sergey Lisitsyn
 * Copyright (C) 2012 Sergey Lisitsyn
 */

%rename(EmbeddingConverter) CEmbeddingConverter;
%rename(LocallyLinearEmbedding) CLocallyLinearEmbedding;
%rename(NeighborhoodPreservingEmbedding) CNeighborhoodPreservingEmbedding;
%rename(LocalTangentSpaceAlignment) CLocalTangentSpaceAlignment;
%rename(LinearLocalTangentSpaceAlignment) CLinearLocalTangentSpaceAlignment;
%rename(HessianLocallyLinearEmbedding) CHessianLocallyLinearEmbedding;
%rename(KernelLocallyLinearEmbedding) CKernelLocallyLinearEmbedding;
%rename(DiffusionMaps) CDiffusionMaps;
%rename(LaplacianEigenmaps) CLaplacianEigenmaps;
%rename(LocalityPreservingProjections) CLocalityPreservingProjections;
%rename(MultidimensionalScaling) CMultidimensionalScaling;
%rename(Isomap) CIsomap;
%rename(StochasticProximityEmbedding) CStochasticProximityEmbedding;
%rename(FactorAnalysis) CFactorAnalysis;
%rename(TDistributedStochasticNeighborEmbedding) CTDistributedStochasticNeighborEmbedding;
%rename(ManifoldSculpting) CManifoldSculpting;
%rename(HashedDocConverter) CHashedDocConverter;
%rename(ICAConverter) CICAConverter;
%rename(Jade) CJade;
%rename(SOBI) CSOBI;
%rename(FFSep) CFFSep;
%rename(JediSep) CJediSep;
%rename(UWedgeSep) CUWedgeSep;
%rename(FastICA) CFastICA;

%newobject shogun::CEmbeddingConverter::apply;
%newobject shogun::*::embed_kernel;
%newobject shogun::*::embed_distance;

%include <converter/Converter.h>
%include <converter/EmbeddingConverter.h>
%include <converter/LocallyLinearEmbedding.h>
%include <converter/NeighborhoodPreservingEmbedding.h>
%include <converter/LocalTangentSpaceAlignment.h>
%include <converter/LinearLocalTangentSpaceAlignment.h>
%include <converter/HessianLocallyLinearEmbedding.h>
%include <converter/KernelLocallyLinearEmbedding.h>
%include <converter/DiffusionMaps.h>
%include <converter/LaplacianEigenmaps.h>
%include <converter/LocalityPreservingProjections.h>
%include <converter/MultidimensionalScaling.h>
%include <converter/Isomap.h>
%include <converter/StochasticProximityEmbedding.h>
%include <converter/FactorAnalysis.h>
%include <converter/TDistributedStochasticNeighborEmbedding.h>
%include <converter/ManifoldSculpting.h>
%include <converter/HashedDocConverter.h>
%include <converter/ica/ICAConverter.h>
%include <converter/ica/Jade.h>
%include <converter/ica/SOBI.h>
%include <converter/ica/FFSep.h>
%include <converter/ica/JediSep.h>
%include <converter/ica/UWedgeSep.h>
%include <converter/ica/FastICA.h>
