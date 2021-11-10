#include "uz_dq_transformation_hw.h"
#include "../../uz/uz_HAL.h"
#include "uz_dq_transformation_hwAddresses.h"
#include "../../uz/uz_fixedpoint/uz_fixedpoint.h"


static void assert_that_fixpoint_is_in_range_32bit(float value, uint32_t integerBits, bool is_signed);

void uz_dqTransformation_hw_set_thetaOffset(uint32_t base_address, float thetaOffset)
{
    //sfix24_En20
    struct uz_fixedpoint_definition_t fixedpoint_definition={
        .fractional_bits=20,
        .integer_bits=3,
        .is_signed=true
    };
    uz_fixedpoint_axi_write(base_address+theta_offset_AXI_Data_Trans_123_dq_V12_ip,thetaOffset,fixedpoint_definition);

    //const uint32_t fractionalBits = 20;
    //const uint32_t integerBits = 3;
    //const bool is_signed = true;
    //assert_that_fixpoint_is_in_range_32bit(thetaOffset, integerBits, is_signed);
    //uz_assert_not_zero_uint32(base_address);
    //uint32_t thetaOffset_int = uz_convert_float_to_sfixed(thetaOffset, fractionalBits);
    //uz_axi_write_uint32(base_address + theta_offset_AXI_Data_Trans_123_dq_V12_ip, thetaOffset_int);
}

float uz_dqTransformation_hw_get_id(uint32_t base_address)
{
    const uint32_t fractionalBits = 11; // sfix18_En11
    
    float value_max = 64.0f;
    float value_min = -64.0f;

    uz_assert_not_zero_uint32(base_address);
    int32_t tmp = uz_axi_read_int32(base_address + id_AXI_Data_Trans_123_dq_V12_ip);
    float id = uz_convert_sfixed_to_float(tmp, fractionalBits);

    uz_assert(id < value_max);
    uz_assert(id > value_min);

    return id;
}

float uz_dqTransformation_hw_get_iq(uint32_t base_address)
{
    // sfix18_En11
    int fractionalBits = 11;
    float value_max = 64.0f;
    float value_min = -64.0f;

    uz_assert_not_zero_uint32(base_address);
    int32_t tmp = uz_axi_read_int32(base_address + iq_AXI_Data_Trans_123_dq_V12_ip);
    float iq = uz_convert_sfixed_to_float(tmp, fractionalBits);

    uz_assert(iq < value_max);
    uz_assert(iq > value_min);

    return iq;
}

float uz_dqTransformation_hw_get_i1(uint32_t base_address)
{
    int fractionalBits = 11; // sfix18_En11
    float value_max = 64.0f;
    float value_min = -64.0f;

    uz_assert_not_zero_uint32(base_address);
    int32_t tmp = uz_axi_read_int32(base_address + i1_AXI_Data_Trans_123_dq_V12_ip);
    float i1 = uz_convert_sfixed_to_float(tmp, fractionalBits);

    uz_assert(i1 < value_max);
    uz_assert(i1 > value_min);

    return i1;
}

float uz_dqTransformation_hw_get_i2(uint32_t base_address)
{
    int fractionalBits = 11; // sfix18_En11
    float value_max = 64.0f;
    float value_min = -64.0f;

    uz_assert_not_zero_uint32(base_address);
    int32_t tmp = uz_axi_read_int32(base_address + i2_AXI_Data_Trans_123_dq_V12_ip);
    float i2 = uz_convert_sfixed_to_float(tmp, fractionalBits);

    uz_assert(i2 < value_max);
    uz_assert(i2 > value_min);

    return i2;
}

float uz_dqTransformation_hw_get_i3(uint32_t base_address)
{
    int fractionalBits = 11; // sfix18_En11
    float value_max = 64.0f;
    float value_min = -64.0f;

    uz_assert_not_zero_uint32(base_address);
    int32_t tmp = uz_axi_read_int32(base_address + i3_AXI_Data_Trans_123_dq_V12_ip);
    float i3 = uz_convert_sfixed_to_float(tmp, fractionalBits);

    uz_assert(i3 < value_max);
    uz_assert(i3 > value_min);

    return i3;
}

static void assert_that_fixpoint_is_in_range_32bit(float value,uint32_t integerBits,bool is_signed)
{
    const float value_max = 1U<<integerBits;
    float value_min=0.0f;
    if(is_signed){
        value_min=(-1.0f)*value_max;
    }
    uz_assert(value < value_max);
    uz_assert(value > value_min);
}