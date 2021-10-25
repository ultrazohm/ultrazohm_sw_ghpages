#include "../../uz/uz_global_configuration.h"
#if UZ_DQ_TRANSFORMATION_MAX_INSTANCES > 0U
#include <stdbool.h> 
#include "../../uz/uz_HAL.h"
#include "uz_dq_transformation.h" 
#include "uz_dq_transformation_hw.h" 
struct uz_dq_transformation_t {
    bool is_ready;
    struct uz_dq_transformation_config_t config;
};

static size_t instance_counter = 0U;
static uz_dq_transformation_t instances[UZ_DQ_TRANSFORMATION_MAX_INSTANCES] = { 0 };

static uz_dq_transformation_t* uz_dq_transformation_allocation(void);

static uz_dq_transformation_t* uz_dq_transformation_allocation(void){
    uz_assert(instance_counter < UZ_DQ_TRANSFORMATION_MAX_INSTANCES);
    uz_dq_transformation_t* self = &instances[instance_counter];
    uz_assert_false(self->is_ready);
    instance_counter++;
    self->is_ready = true;
    return (self);
}


uz_dq_transformation_t* uz_dq_transformation_init(struct uz_dq_transformation_config_t config){
    uz_dq_transformation_t* self = uz_dq_transformation_allocation();

    uz_assert_not_zero_uint32(config.base_address);
    uz_assert_not_zero_uint32(config.ip_clk_frequency_Hz);
    self->config = config;
    uz_dqTransformation_hw_set_thetaOffset(self->config.base_address, self->config.theta_offset);

    return (self);
}

struct uz_dq_t uz_dqTransformation_get_id_iq(uz_dq_transformation_t* self){
    
    struct uz_dq_t currents = {0}; 

    currents.d = uz_dqTransformation_hw_get_id(self->config.base_address);
    currents.q = uz_dqTransformation_hw_get_iq(self->config.base_address);

    return currents;
}

struct uz_UVW_t uz_dqTransformation_get_i_uvw(uz_dq_transformation_t* self){
    
    uz_assert_not_NULL(self);
    struct uz_UVW_t currents = {0}; 

    currents.U = uz_dqTransformation_hw_get_i1(self->config.base_address);
    currents.V = uz_dqTransformation_hw_get_i2(self->config.base_address);
    currents.W = uz_dqTransformation_hw_get_i3(self->config.base_address);
      
    return currents;
}

#endif