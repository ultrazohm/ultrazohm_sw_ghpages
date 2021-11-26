/******************************************************************************
* Copyright Contributors to the UltraZohm project.
* Copyright 2021 Dennis Hufnagel
* 
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* 
*     http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and limitations under the License.
******************************************************************************/

#include "uz_FOC.h"
#include "../uz_global_configuration.h"
#if UZ_FOC_MAX_INSTANCES > 0
typedef struct uz_FOC {
	bool is_ready;
	bool ext_clamping;
	struct uz_FOC_config config;
	struct uz_PI_Controller* Controller_id;
	struct uz_PI_Controller* Controller_iq;
}uz_FOC;

static uz_dq_t uz_FOC_CurrentControl(uz_FOC* self, uz_dq_t i_reference_Ampere, uz_dq_t i_actual_Ampere);
static uz_dq_t uz_FOC_decoupling(enum uz_FOC_decoupling_select decoupling_select, uz_PMSM_t pmsm, uz_dq_t actual_Ampere, float omega_el_rad_per_sec);
static size_t instances_counter_FOC = 0;

static uz_FOC instances_FOC[UZ_FOC_MAX_INSTANCES] = {0};


/**
 * @brief Memory allocation of the uz_FOC struct
 *
 * @return Pointer to uz_FOC instance
 */
static uz_FOC* uz_FOC_allocation(void);

static uz_FOC* uz_FOC_allocation(void) {
	uz_assert(instances_counter_FOC < UZ_FOC_MAX_INSTANCES);
	uz_FOC* self = &instances_FOC[instances_counter_FOC];
	uz_assert(self->is_ready == false);
	instances_counter_FOC++;
	self->is_ready = true;
	return (self);
}

uz_FOC* uz_FOC_init(struct uz_FOC_config config) {
	uz_FOC* self = uz_FOC_allocation();
	self->Controller_id = uz_PI_Controller_init(config.config_id);
	self->Controller_iq = uz_PI_Controller_init(config.config_iq);
	self->config = config;
	return (self);
}

uz_dq_t uz_FOC_sample(uz_FOC* self, uz_dq_t i_reference_Ampere, uz_dq_t i_actual_Ampere, float V_dc_volts, float omega_el_rad_per_sec) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(V_dc_volts > 0.0f);
	uz_dq_t u_pre_limit_Volts = uz_FOC_CurrentControl(self, i_reference_Ampere, i_actual_Ampere);
	uz_dq_t u_decoup_Volts = uz_FOC_decoupling(self->config.decoupling_select, self->config.config_PMSM, i_actual_Ampere, omega_el_rad_per_sec);
	u_pre_limit_Volts.d += u_decoup_Volts.d;
	u_pre_limit_Volts.q += u_decoup_Volts.q;
	uz_dq_t u_output_Volts = uz_FOC_SpaceVector_Limitation(u_pre_limit_Volts, V_dc_volts, omega_el_rad_per_sec, i_actual_Ampere, &self->ext_clamping);
	return (u_output_Volts);
}

uz_UVW_t uz_FOC_sample_UVW(uz_FOC* self, uz_dq_t i_reference_Ampere, uz_dq_t i_actual_Ampere, float V_dc_volts, float omega_el_rad_per_sec, float theta_el_rad) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_dq_t u_dq_Volts = uz_FOC_sample(self, i_reference_Ampere, i_actual_Ampere, V_dc_volts, omega_el_rad_per_sec);
	uz_UVW_t u_output_Volts = uz_dq_inverse_transformation(u_dq_Volts, theta_el_rad);
	return(u_output_Volts);
}

static uz_dq_t uz_FOC_CurrentControl(uz_FOC* self, uz_dq_t i_reference_Ampere, uz_dq_t i_actual_Ampere) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_dq_t u_output_Volts = { 0 };
	u_output_Volts.q = uz_PI_Controller_sample(self->Controller_iq, i_reference_Ampere.q, i_actual_Ampere.q, self->ext_clamping);
	u_output_Volts.d = uz_PI_Controller_sample(self->Controller_id, i_reference_Ampere.d, i_actual_Ampere.d, self->ext_clamping);
	return (u_output_Volts);

}

void uz_FOC_reset(uz_FOC* self){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_PI_Controller_reset(self->Controller_id);
	uz_PI_Controller_reset(self->Controller_iq);
	self->ext_clamping = false;
}

void uz_FOC_set_Kp_id(uz_FOC* self, float Kp_id){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Kp_id >= 0.0f);
	uz_PI_Controller_set_Kp(self->Controller_id, Kp_id);
}

void uz_FOC_set_Ki_id(uz_FOC* self, float Ki_id){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Ki_id >= 0.0f);
	uz_PI_Controller_set_Ki(self->Controller_id, Ki_id);
}

void uz_FOC_set_Kp_iq(uz_FOC* self, float Kp_iq){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Kp_iq >= 0.0f);
	uz_PI_Controller_set_Kp(self->Controller_iq, Kp_iq);
}

void uz_FOC_set_Ki_iq(uz_FOC* self, float Ki_iq){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Ki_iq >= 0.0f);
	uz_PI_Controller_set_Ki(self->Controller_iq, Ki_iq);
}

void uz_FOC_set_Ld(uz_FOC* self, float Ld_Henry){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Ld_Henry > 0.0f);
	self->config.config_PMSM.Ld_Henry = Ld_Henry;
}

void uz_FOC_set_Lq(uz_FOC* self, float Lq_Henry){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Lq_Henry > 0.0f);
	self->config.config_PMSM.Lq_Henry = Lq_Henry;
}

void uz_FOC_set_Psi_PM(uz_FOC* self, float Psi_PM_Vs){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Psi_PM_Vs >= 0.0f);
	self->config.config_PMSM.Psi_PM_Vs = Psi_PM_Vs;
}

void uz_FOC_set_decoupling_method(uz_FOC* self, enum uz_FOC_decoupling_select decoupling_select) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	self->config.decoupling_select=decoupling_select;
}

bool uz_FOC_get_ext_clamping(uz_FOC* self){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	return(self->ext_clamping);
}

static uz_dq_t uz_FOC_decoupling(enum uz_FOC_decoupling_select decoupling_select, uz_PMSM_t config_PMSM, uz_dq_t i_actual_Ampere, float omega_el_rad_per_sec){
	uz_dq_t decouple_voltage={0};
	switch (decoupling_select)
    {
    case no_decoupling:
        // do nothing since no decoupling
        break;
    case linear_decoupling:
        decouple_voltage=uz_FOC_linear_decoupling(config_PMSM, i_actual_Ampere, omega_el_rad_per_sec);
        break;
    default:
        break;
    }
	return (decouple_voltage);
}

struct uz_DutyCycle_t uz_FOC_generate_DutyCycles(uz_UVW_t input, float V_dc_volts) {
	//Uses continuous sinusoidal PWM (SPWM) 
	struct uz_DutyCycle_t output = {0};
	output.DutyCycle_U = ( (input.U / (0.5f * V_dc_volts) ) +1.0f) * 0.5f;
	output.DutyCycle_V = ( (input.V / (0.5f * V_dc_volts) ) +1.0f) * 0.5f;
	output.DutyCycle_W = ( (input.W / (0.5f * V_dc_volts) ) +1.0f) * 0.5f;
	output.DutyCycle_U = uz_signals_saturation(output.DutyCycle_U, 1.0f, 0.0f);
	output.DutyCycle_V = uz_signals_saturation(output.DutyCycle_V, 1.0f, 0.0f);
	output.DutyCycle_W = uz_signals_saturation(output.DutyCycle_W, 1.0f, 0.0f);
	return(output);
}


#endif
