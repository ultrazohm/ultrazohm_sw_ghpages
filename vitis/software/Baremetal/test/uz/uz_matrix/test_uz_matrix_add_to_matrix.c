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

void test_uz_matrix_add_to_matrix_column_vector(void){
    size_t rows=1;
    size_t columns=4;
    float A_data[4]={1,2,3,4};
    float C_data[4]={1,2,3,4};
    uz_matrix_t* A=uz_matrix_init(A_data,UZ_MATRIX_SIZE(A_data),rows, columns );
    uz_matrix_t* C=uz_matrix_init(C_data,UZ_MATRIX_SIZE(C_data),rows, columns );
    // C +=A
    uz_matrix_add(A,C);
    TEST_ASSERT_EQUAL_FLOAT(2,uz_matrix_get_element_zero_based(C,0,0));
    TEST_ASSERT_EQUAL_FLOAT(4,uz_matrix_get_element_zero_based(C,0,1));
    TEST_ASSERT_EQUAL_FLOAT(6,uz_matrix_get_element_zero_based(C,0,2));
    TEST_ASSERT_EQUAL_FLOAT(8,uz_matrix_get_element_zero_based(C,0,3));
}

void test_uz_matrix_add_to_matrix_row_vector(void){
    size_t rows=4;
    size_t columns=1;
    float A_data[4]={1,2,3,4};
    float C_data[4]={1,2,3,4};
    uz_matrix_t* A=uz_matrix_init(A_data,UZ_MATRIX_SIZE(A_data),rows, columns );
    uz_matrix_t* C=uz_matrix_init(C_data,UZ_MATRIX_SIZE(C_data),rows, columns );
    // C=A + B
    uz_matrix_add(A,C);
    TEST_ASSERT_EQUAL_FLOAT(2,uz_matrix_get_element_zero_based(C,0,0) );
    TEST_ASSERT_EQUAL_FLOAT(4,uz_matrix_get_element_zero_based(C,1,0) );
    TEST_ASSERT_EQUAL_FLOAT(6,uz_matrix_get_element_zero_based(C,2,0) );
    TEST_ASSERT_EQUAL_FLOAT(8,uz_matrix_get_element_zero_based(C,3,0) );
}

void test_uz_matrix_add_to_matrix_2_times2(void){
    size_t rows=2;
    size_t columns=2;
    float A_data[4]={1,2,3,4};
    float C_data[4]={1,2,3,4};
    uz_matrix_t* A=uz_matrix_init(A_data,UZ_MATRIX_SIZE(A_data),rows, columns );
    uz_matrix_t* C=uz_matrix_init(C_data,UZ_MATRIX_SIZE(C_data),rows, columns );
    // C=A + B
    uz_matrix_add(A,C);
    TEST_ASSERT_EQUAL_FLOAT(2,uz_matrix_get_element_zero_based(C,0,0) );
    TEST_ASSERT_EQUAL_FLOAT(4,uz_matrix_get_element_zero_based(C,0,1) );
    TEST_ASSERT_EQUAL_FLOAT(6,uz_matrix_get_element_zero_based(C,1,0) );
    TEST_ASSERT_EQUAL_FLOAT(8,uz_matrix_get_element_zero_based(C,1,1) );
}

#endif // TEST
