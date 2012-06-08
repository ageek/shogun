/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2012 Fernando José Iglesias García
 * Written (W) 2010,2012 Soeren Sonnenburg
 * Copyright (C) 2010 Berlin Institute of Technology
 * Copyright (C) 2012 Soeren Sonnenburg
 */
#include <shogun/lib/config.h>
#include <shogun/mathematics/Math.h>
#include <shogun/lib/SGVector.h>
#include <shogun/lib/SGReferencedData.h>
#include <shogun/mathematics/lapack.h>

namespace shogun {

template<class T> SGVector<T>::SGVector() : SGReferencedData(false)
{
	init_data();
}

template<class T> SGVector<T>::SGVector(T* v, index_t len, bool ref_counting)
: SGReferencedData(ref_counting), vector(v), vlen(len)
{
}

template<class T> SGVector<T>::SGVector(index_t len, bool ref_counting)
: SGReferencedData(ref_counting), vlen(len)
{
	vector=SG_MALLOC(T, len);
}

template<class T> SGVector<T>::SGVector(const SGVector &orig) : SGReferencedData(orig)
{
	copy_data(orig);
}

template<class T> SGVector<T>::~SGVector()
{
	unref();
}

template<class T> void SGVector<T>::zero()
{
	if (vector && vlen)
		set_const(0);
}

template<class T> void SGVector<T>::set_const(T const_elem)
{
	for (index_t i=0; i<vlen; i++)
		vector[i]=const_elem ;
}

template<class T> void SGVector<T>::range_fill(T start)
{
	range_fill_vector(vector, vlen, start);
}

template<class T> void SGVector<T>::random(T min_value, T max_value)
{
	random_vector(vector, vlen, min_value, max_value);
}

template<class T> void SGVector<T>::randperm()
{
	/* this does not work. Heiko Strathmann */
	SG_SNOTIMPLEMENTED;
	randperm(vector, vlen);
}

template<class T> SGVector<T> SGVector<T>::clone() const
{
	return SGVector<T>(clone_vector(vector, vlen), vlen);
}

template<class T> const T& SGVector<T>::get_element(index_t index)
{
	ASSERT(vector && (index>=0) && (index<vlen));
	return vector[index];
}

template<class T> void SGVector<T>::set_element(const T& p_element, index_t index)
{
	ASSERT(vector && (index>=0) && (index<vlen));
	vector[index]=p_element;
}

template<class T> void SGVector<T>::resize_vector(int32_t n)
{
	vector=SG_REALLOC(T, vector, n);

	if (n > vlen)
		memset(&vector[vlen], 0, (n-vlen)*sizeof(T));
	vlen=n;
}

template<class T> void SGVector<T>::add(const SGVector<T> x)
{
	ASSERT(x.vector && vector);
	ASSERT(x.vlen == vlen);

	for (int32_t i=0; i<vlen; i++)
		vector[i]+=x.vector[i];
}

template<class T> void SGVector<T>::display_size() const
{
	SG_SPRINT("SGVector '%p' of size: %d\n", vector, vlen);
}

template<class T> void SGVector<T>::copy_data(const SGReferencedData &orig)
{
	vector=((SGVector*)(&orig))->vector;
	vlen=((SGVector*)(&orig))->vlen;
}

template<class T> void SGVector<T>::init_data()
{
	vector=NULL;
	vlen=0;
}

template<class T> void SGVector<T>::free_data()
{
	SG_FREE(vector);
	vector=NULL;
	vlen=0;
}

template<class T> void SGVector<T>::display_vector(const char* name) const
{
	display_size();
	display_vector(vector, vlen, name);
}

template <class T>
void SGVector<T>::display_vector(const SGVector<T> vector, const char* name,
		const char* prefix)
{
	vector.display_vector();
}

template <>
void SGVector<bool>::display_vector(const bool* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i] ? 1 : 0, i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<char>::display_vector(const char* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%c%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<uint8_t>::display_vector(const uint8_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<int8_t>::display_vector(const int8_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<uint16_t>::display_vector(const uint16_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<int16_t>::display_vector(const int16_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<int32_t>::display_vector(const int32_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<uint32_t>::display_vector(const uint32_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%d%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}


template <>
void SGVector<int64_t>::display_vector(const int64_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%lld%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<uint64_t>::display_vector(const uint64_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%llu%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<float32_t>::display_vector(const float32_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%g%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<float64_t>::display_vector(const float64_t* vector, int32_t n, const char* name,
		const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
		SG_SPRINT("%s%.18g%s", prefix, vector[i], i==n-1? "" : ",");
	SG_SPRINT("%s]\n", prefix);
}

template <>
void SGVector<floatmax_t>::display_vector(const floatmax_t* vector, int32_t n,
		const char* name, const char* prefix)
{
	ASSERT(n>=0);
	SG_SPRINT("%s%s=[", prefix, name);
	for (int32_t i=0; i<n; i++)
	{
		SG_SPRINT("%s%.36Lg%s", prefix, (long double) vector[i],
				i==n-1? "" : ",");
	}
	SG_SPRINT("%s]\n", prefix);
}

template <class T>
float64_t SGVector<T>::dot(const float64_t* v1, const float64_t* v2, int32_t n)
{
	float64_t r=0;
#ifdef HAVE_LAPACK
	int32_t skip=1;
	r = cblas_ddot(n, v1, skip, v2, skip);
#else
	for (int32_t i=0; i<n; i++)
		r+=v1[i]*v2[i];
#endif
	return r;
}

template <class T>
float32_t SGVector<T>::dot(const float32_t* v1, const float32_t* v2, int32_t n)
{
	float32_t r=0;
#ifdef HAVE_LAPACK
	int32_t skip=1;
	r = cblas_sdot(n, v1, skip, v2, skip);
#else
	for (int32_t i=0; i<n; i++)
		r+=v1[i]*v2[i];
#endif
	return r;
}

template <class T>
float64_t SGVector<T>::twonorm(const float64_t* v, int32_t n)
{
	float64_t norm = 0.0;
#ifdef HAVE_LAPACK
	norm = cblas_dnrm2(n, v, 1);
#else
	norm = CMath::sqrt(SGVector::dot(v, v, n));
#endif
	return norm;
}

/** random vector */
template <class T>
	void SGVector<T>::random_vector(T* vec, int32_t len, T min_value, T max_value)
	{
		for (int32_t i=0; i<len; i++)
			vec[i]=CMath::random(min_value, max_value);
	}

/** random permatutaion */
template <class T>
void SGVector<T>::randperm(T* perm, int32_t n)
{
	for (int32_t i = 0; i < n; i++)
		perm[i] = i;
	permute(perm,n);
}

/** permute */
template <class T>
void SGVector<T>::permute(T* vec, int32_t n)
{
	for (int32_t i = 0; i < n; i++)
		CMath::swap(vec[i], vec[CMath::random(i, n-1)]);
}

template <class T>
void SGVector<T>::permute_vector(SGVector<T> vec)
{
	for (index_t i=0; i<vec.vlen; ++i)
	{
		CMath::swap(vec.vector[i],
				vec.vector[CMath::random(i, vec.vlen-1)]);
	}
}

/// || x ||_2
template <class T>
T SGVector<T>::twonorm(T* x, int32_t len)
{
	float64_t result=0;
	for (int32_t i=0; i<len; i++)
		result+=x[i]*x[i];

	return CMath::sqrt(result);
}

template <class T>
float64_t SGVector<T>::onenorm(T* x, int32_t len)
{
	float64_t result=0;
	for (int32_t i=0;i<len; ++i)
		result+=CMath::abs(x[i]);

	return result;
}

/// || x ||_q^q
template <class T>
T SGVector<T>::qsq(T* x, int32_t len, float64_t q)
{
	float64_t result=0;
	for (int32_t i=0; i<len; i++)
		result+=CMath::pow(fabs(x[i]), q);

	return result;
}

/// || x ||_q
template <class T>
T SGVector<T>::qnorm(T* x, int32_t len, float64_t q)
{
	ASSERT(q!=0);
	return CMath::pow((float64_t) qsq(x, len, q), 1.0/q);
}

/** @return min(vec) */
template <class T>
	T SGVector<T>::min(T* vec, int32_t len)
	{
		ASSERT(len>0);
		T minv=vec[0];

		for (int32_t i=1; i<len; i++)
			minv=CMath::min(vec[i], minv);

		return minv;
	}

/** @return max(vec) */
template <class T>
	T SGVector<T>::max(T* vec, int32_t len)
	{
		ASSERT(len>0);
		T maxv=vec[0];

		for (int32_t i=1; i<len; i++)
			maxv=CMath::max(vec[i], maxv);

		return maxv;
	}

/// return sum(abs(vec))
template <class T>
T SGVector<T>::sum_abs(T* vec, int32_t len)
{
	T result=0;
	for (int32_t i=0; i<len; i++)
		result+=CMath::abs(vec[i]);

	return result;
}

/// return sum(abs(vec))
template <class T>
bool SGVector<T>::fequal(T x, T y, float64_t precision)
{
	return CMath::abs(x-y)<precision;
}

template <class T>
int32_t SGVector<T>::unique(T* output, int32_t size)
{
	CMath::qsort(output, size);
	int32_t j=0;

	for (int32_t i=0; i<size; i++)
	{
		if (i==0 || output[i]!=output[i-1])
			output[j++]=output[i];
	}
	return j;
}


template class SGVector<bool>;
template class SGVector<char>;
template class SGVector<int8_t>;
template class SGVector<uint8_t>;
template class SGVector<int16_t>;
template class SGVector<uint16_t>;
template class SGVector<int32_t>;
template class SGVector<uint32_t>;
template class SGVector<int64_t>;
template class SGVector<uint64_t>;
template class SGVector<float32_t>;
template class SGVector<float64_t>;
template class SGVector<floatmax_t>;
}