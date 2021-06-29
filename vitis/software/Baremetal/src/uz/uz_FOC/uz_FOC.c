#include "uz_FOC.h"
#include "../uz_global_configuration.h"

struct uz_FOC_PI_Controller_variables {
	bool is_ready;
	float I_sum;
	float P_sum;
	bool int_clamping;
	float error;
	float Kp;
	float Ki;
	float referenceValue;
	float actualValue;
};

static size_t instances_counter_FOC_ActualValues = 0;
static size_t instances_counter_FOC_PI_Controller_variables = 0;
static size_t instances_counter_FOC_VoltageReference = 0;

static uz_FOC_ActualValues instances_FOC_ActualValues[UZ_FOC_ACTUALVALUES_MAX_INSTANCES] = { 0 };
static uz_FOC_VoltageReference instances_FOC_VoltageReference[UZ_FOC_VOLTAGEREFERENCE_MAX_INSTANCES] = { 0 };
static uz_FOC_PI_Controller_variables instances_FOC_PI_Controller_variables[UZ_FOC_PI_CONTROLLER_VARIABLES_MAX_INSTANCES] = { 0 };

static uz_FOC_ActualValues* uz_FOC_ActualValues_allocation(void) {
	uz_assert(instances_counter_FOC_ActualValues < UZ_FOC_ACTUALVALUES_MAX_INSTANCES);
	uz_FOC_ActualValues* self = &instances_FOC_ActualValues[instances_counter_FOC_ActualValues];
	uz_assert(self->is_ready == false);
	instances_counter_FOC_ActualValues++;
	self->is_ready = true;
	return (self);
}

static uz_FOC_VoltageReference* uz_FOC_VoltageReference_allocation(void) {
	uz_assert(instances_counter_FOC_VoltageReference < UZ_FOC_VOLTAGEREFERENCE_MAX_INSTANCES);
	uz_FOC_VoltageReference* self = &instances_FOC_VoltageReference[instances_counter_FOC_VoltageReference];
	uz_assert(self->is_ready == false);
	instances_counter_FOC_VoltageReference++;
	self->is_ready = true;
	return (self);
}

static uz_FOC_PI_Controller_variables* uz_FOC_PI_Controller_variables_allocation(void) {
	uz_assert(instances_counter_FOC_PI_Controller_variables < UZ_FOC_PI_CONTROLLER_VARIABLES_MAX_INSTANCES);
	uz_FOC_PI_Controller_variables* self = &instances_FOC_PI_Controller_variables[instances_counter_FOC_PI_Controller_variables];
	uz_assert(self->is_ready == false);
	instances_counter_FOC_PI_Controller_variables++;
	self->is_ready = true;
	return (self);
}

uz_FOC_ActualValues* uz_FOC_ActualValues_init(void) {
	uz_FOC_ActualValues* self = uz_FOC_ActualValues_allocation();
	return (self);
}

uz_FOC_VoltageReference* uz_FOC_VoltageReference_init(void) {
	uz_FOC_VoltageReference* self = uz_FOC_VoltageReference_allocation();
	return (self);
}

uz_FOC_PI_Controller_variables* uz_FOC_PI_ID_Controller_variables_init(uz_FOC_config config, uz_FOC_ActualValues* values) {
	uz_FOC_PI_Controller_variables* self = uz_FOC_PI_Controller_variables_allocation();
	self->referenceValue = config.id_ref_Ampere;
	self->actualValue = values->i_d_Ampere;
	self->Kp = config.Kp_id;
	self->Ki = config.Ki_id;
	return (self);
}

uz_FOC_PI_Controller_variables* uz_FOC_PI_IQ_Controller_variables_init(uz_FOC_config config, uz_FOC_ActualValues* values) {
	uz_FOC_PI_Controller_variables* self = uz_FOC_PI_Controller_variables_allocation();
	self->referenceValue = config.iq_ref_Ampere;
	self->actualValue = values->i_q_Ampere;
	self->Kp = config.Kp_iq;
	self->Ki = config.Ki_iq;
	return (self);
}

uz_FOC_PI_Controller_variables* uz_FOC_PI_N_Controller_variables_init(uz_FOC_config config, uz_FOC_ActualValues* values) {
	uz_FOC_PI_Controller_variables* self = uz_FOC_PI_Controller_variables_allocation();
	self->referenceValue = config.n_ref_rpm / 60.0f * (2.0f * M_PI + config.polePairs);
	self->actualValue = values->omega_el_rad_per_sec;
	self->Kp = config.Kp_n;
	self->Ki = config.Ki_n;
	return (self);
}

uz_FOC_PI_Controller_variables* uz_FOC_update_PI_ID_Controller_variables(uz_FOC_PI_Controller_variables* self, uz_FOC_config config, uz_FOC_ActualValues* values){
	uz_assert_not_NULL(self);
	uz_assert_not_NULL(values);
	self->referenceValue = config.id_ref_Ampere;
	self->actualValue = values->i_d_Ampere;
	self->Kp = config.Kp_id;
	self->Ki = config.Ki_id;
	return(self);
}

uz_FOC_PI_Controller_variables* uz_FOC_update_PI_IQ_Controller_variables(uz_FOC_PI_Controller_variables* self, uz_FOC_config config, uz_FOC_ActualValues* values){
	uz_assert_not_NULL(self);
	uz_assert_not_NULL(values);
	self->referenceValue = config.iq_ref_Ampere;
	self->actualValue = values->i_q_Ampere;
	self->Kp = config.Kp_iq;
	self->Ki = config.Ki_iq;
	return(self);
}

uz_FOC_PI_Controller_variables* uz_FOC_update_PI_N_Controller_variables(uz_FOC_PI_Controller_variables* self, uz_FOC_config config, uz_FOC_ActualValues* values){
	uz_assert_not_NULL(self);
	uz_assert_not_NULL(values);	
	self->referenceValue = config.n_ref_rpm / 60.0f * (2.0f * M_PI + config.polePairs);
	self->actualValue = values->omega_el_rad_per_sec;
	self->Kp = config.Kp_n;
	self->Ki = config.Ki_n;
	return(self);
}

float uz_FOC_Dead_Zone(float input, uz_FOC_config config) {
	float output;
	uz_assert(config.d_y_max>config.d_y_min);
	if (input >= config.d_y_min && input <= config.d_y_max) {
		output = 0.0f;
	}
	else if (input > config.d_y_max)
	{
		output = input - config.d_y_max;
	}
        else {
		output = input - config.d_y_min;
	}
	return (output);
}

int uz_FOC_get_sign_of_value(float input) {
	int sign;
	if (input < 0)
		sign = -1;
	else if (input > 0) {
		sign = 1;
	} else {
		sign = 0;
	}
	return (sign);
}

bool uz_FOC_Clamping_Circuit(float preIntegrator, float preSat, uz_FOC_config config) {
	bool output = false;
	float value_after_deadzone = uz_FOC_Dead_Zone(preSat, config);
	int sign_after_deadzone = uz_FOC_get_sign_of_value(value_after_deadzone);
	int sign_preIntegrator = uz_FOC_get_sign_of_value(preIntegrator);
	if (0 != value_after_deadzone && sign_after_deadzone == sign_preIntegrator) {
		output = true;
	} else {
		output = false;
	}
	return (output);
}

float uz_FOC_PI_Controller(uz_FOC_PI_Controller_variables* variables, uz_FOC_config config, bool ext_clamping){
	uz_assert_not_NULL(variables);
	uz_assert(config.d_y_max > config.d_y_min);
	float preSat = 0.0f;
	float output = 0.0f;
	if (ext_clamping == true || variables->int_clamping == true) {
		variables->I_sum += 0.0f;
	} else {
		variables->I_sum += variables->error * variables->Ki * config.SamplingTime_sec;
	}
	variables->error = variables->referenceValue - variables->actualValue;
	variables->P_sum = variables->error * variables->Kp;
	if (config.Reset == true) {
		variables->I_sum = 0.0f;
		variables->P_sum = 0.0f;
	}
	preSat = variables->I_sum + variables->P_sum;
	variables->int_clamping = uz_FOC_Clamping_Circuit(variables->I_sum,preSat,config);
	output = preSat;
	return(output);
}
