#ifdef TEST

#include "unity.h"
#include "uz_myIP2.h"
#include "mock_uz_myIP2_hw.h"
#include "uz_myIP2_staticAllocator.h"
#include "xparameters.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_uz_myIP2_staticAllocator_return_pointer_to_instance_and_multiply_a_times_b(void)
{
    uz_myIP2* test_instance = uz_myIP2_allocate_instance_one();
    int a=10;
    uz_myIP2_hw_write_A_Expect(XPAR_UZ_AXI_TESTIP_0_BASEADDR,a);
    int b=-10;
    uz_myIP2_hw_write_B_Expect(XPAR_UZ_AXI_TESTIP_0_BASEADDR,b);
    uz_myIP2_hw_read_C_ExpectAndReturn(XPAR_UZ_AXI_TESTIP_0_BASEADDR,-100);
    int c=uz_myIP2_multiply(test_instance,a,b);
    TEST_ASSERT_EQUAL_INT32(a*b,c);
}

#endif // TEST
