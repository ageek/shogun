#include <lib/SGMatrix.h>

#ifdef SHOGUN_HAVE_EIGEN3

/**
 * @brief function amari_index
 *
 * calculates the amari index for an estimated
 * mixing matrix and given mixing matrix.
 *
 * @param W the estimated mixing matrix
 * @param A the given mixing matrix
 * @param standardize flag indicating whether to standardize or not
 *
 */
float64_t amari_index(shogun::SGMatrix<float64_t> W, shogun::SGMatrix<float64_t> A, bool standardize);

#endif //SHOGUN_HAVE_EIGEN3
