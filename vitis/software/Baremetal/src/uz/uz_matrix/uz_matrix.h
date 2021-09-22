#ifndef UZ_MATRIX_H
#define UZ_MATRIX_H
#include <stddef.h>
#include <stdbool.h>

/**
 * @brief Standard macro to get the size of supplied matrix data at compile time.
 *        See:
 *        - https://github.com/chromium/chromium/blob/HEAD/third_party/protobuf/php/ext/google/protobuf/php-upb.c
 *        - https://stackoverflow.com/questions/1598773/is-there-a-standard-function-in-c-that-would-return-the-length-of-an-array/1598827#1598827
 */
#define UZ_MATRIX_SIZE(x) \
    ((sizeof(x)/sizeof(0[x])) / ((size_t)(!(sizeof(x) % sizeof(0[x])))))

/**
 * @brief Object data type definition of the uz_matrix
 * 
 */
typedef struct uz_matrix_t uz_matrix_t;

/**
 * @brief Initializes one matrix and allocates memory for it from the static allocator.
 * 
 * @param data Pointer to array with length rows*colums.
 * @param length_of_data Length of data calculated with UZ_MATRIX_SIZE macro
 * @param rows Number of rows of the matrix
 * @param columns Number of columns of the matrix
 * @return Pointer to the allocated matrix instance 
 */
uz_matrix_t* uz_matrix_init(float* data,size_t length_of_data, size_t rows, size_t columns);

/**
 * @brief Returns the number of rows of the given uz_matrix
 * 
 * @param self 
 * @return size_t 
 */
size_t uz_matrix_get_number_of_rows(uz_matrix_t const*const self);

/**
 * @brief Returns the number of columns of the given uz_matrix
 * 
 * @param self 
 * @return size_t 
 */
size_t uz_matrix_get_number_of_columns(uz_matrix_t const*const self);

/**
 * @brief Set all elements of the matrix A to zero
 * 
 * @param A Matrix object, has to be ready.
 */
void uz_matrix_set_zero(uz_matrix_t * const A);

/**
 * @brief Get the element row x column of matrix A with zero based indexing.
 * 
 * @param A Matrix object, hast to be ready.
 * @param row Row of element
 * @param column Column of element
 * @return float 
 */
float uz_matrix_get_element_zero_based(uz_matrix_t const*const A,size_t row, size_t column);

void uz_matrix_set_element_zero_based(uz_matrix_t *const A,float x,size_t row, size_t column);
/**
 * @brief Calculates the "real" matrix multiplication C_out=A * B
 * 
 * @param A 
 * @param B 
 * @param C_out Result of the multiplication is written to C_out
 */
void uz_matrix_multiply(uz_matrix_t const*const A, uz_matrix_t const*const B, uz_matrix_t* const C_out);

/**
 * @brief Calculates the elementwise product C_out= A .* B of all elements of the matrix A and B (also called Hadamard-Product)
 * 
 * @param A 
 * @param B 
 * @param C_out Result of the elementwise product is written to C_out
 */
void uz_matrix_elementwise_product(uz_matrix_t const*const A, uz_matrix_t const*const B, uz_matrix_t* const C_out);

/**
 * @brief Calculates the dot product (scalar product) of the vectors A and B.
 *        A and B can be row or column vectors, but one dimension of A and B has to be 1.
 * 
 * @param A Column or row vector
 * @param B Column or row vector
 * @return float 
 */
float uz_matrix_dot_product(uz_matrix_t const*const A, uz_matrix_t const*const B);

/**
 * @brief Calculates C_out = A + B
 * 
 * @param A 
 * @param B 
 * @param C_out Sum of A and B is written to C_out
 */
void uz_matrix_sum(uz_matrix_t const*const A, uz_matrix_t const*const B, uz_matrix_t *const C_out);

/**
 * @brief Calculates C_out += A
 * 
 * @param A 
 * @param C_out Adds the values of A to C_out
 */
void uz_matrix_add(uz_matrix_t const*const A, uz_matrix_t *const C_out);

#endif // UZ_MATRIX_H
