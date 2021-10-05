#ifdef TEST

#include "unity.h"
#include "test_assert_with_exception.h"
#include "uz_matrix.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_uz_matrix_init_1d_vector(void)
{
    int rows=1;
    int columns=3;
    float test_vector[3]={1,2,3};
    uz_matrix_init(test_vector,UZ_MATRIX_SIZE(test_vector),rows, columns );
}

void test_uz_matrix_init_wrong_data_dimension(void){
    int rows=3;
    int columns=3;
    float mat[6]={0}; // Mat needs to be of length 9, thus a assertion fires in the test
    TEST_ASSERT_FAIL_ASSERT(uz_matrix_init(mat,UZ_MATRIX_SIZE(mat), rows,columns));
}

void test_uz_matrix_init_zero_rows(void){
    int rows=0;
    int columns=3;
    float mat[5]={0};
    TEST_ASSERT_FAIL_ASSERT(uz_matrix_init(mat,UZ_MATRIX_SIZE(mat), rows,columns));
}

void test_uz_matrix_init_zero_columns(void){
    int rows=3;
    int columns=0;
    float mat[5]={0};
    TEST_ASSERT_FAIL_ASSERT(uz_matrix_init(mat,UZ_MATRIX_SIZE(mat), rows,columns));
}

void test_uz_matrix_init_3_times_3_matrix(void){
    int rows=3;
    int columns=3;
    float mat[9]={1,2,3,4,5,6,7,8,9};
    uz_matrix_init(mat,UZ_MATRIX_SIZE(mat),rows,columns);
    
}

void test_uz_matrix_get_number_of_rows_and_columns(void){
    int rows=3;
    int columns=2;
    float mat[6]={1,2,3,4,5,6};
    uz_matrix_t* matrix=uz_matrix_init(mat,UZ_MATRIX_SIZE(mat),rows,columns);
    size_t number_of_rows=uz_matrix_get_number_of_rows(matrix);
    size_t number_of_columns=uz_matrix_get_number_of_columns(matrix);
    TEST_ASSERT_EQUAL_INT(rows, number_of_rows);
    TEST_ASSERT_EQUAL_INT(columns, number_of_columns);
}

void test_uz_matrix_add_scalar(void){
    int rows=3;
    int columns=3;
    float mat[9]={1,2,3,4,5,6,7,8,9};
    uz_matrix_t* matrix=uz_matrix_init(mat,UZ_MATRIX_SIZE(mat),rows,columns);
    float scalar=1.1f;
    uz_matrix_add_scalar(matrix,scalar);
    float expect[9]={2.1,3.1,4.1,5.1,6.1,7.1,8.1,9.1,10.1};
    TEST_ASSERT_EQUAL_FLOAT_ARRAY(expect,mat,UZ_MATRIX_SIZE(mat));
}

void test_uz_matrix_multiply_by_scalar(void){
    int rows=3;
    int columns=3;
    float mat[9]={1,2,3,4,5,6,7,8,9};
    uz_matrix_t* matrix=uz_matrix_init(mat,UZ_MATRIX_SIZE(mat),rows,columns);
    float scalar=1.1f;
    uz_matrix_multiply_by_scalar(matrix,scalar);
    float expect[9]={1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8,9.9};
    TEST_ASSERT_EQUAL_FLOAT_ARRAY(expect,mat,UZ_MATRIX_SIZE(mat));
}


#endif // TEST