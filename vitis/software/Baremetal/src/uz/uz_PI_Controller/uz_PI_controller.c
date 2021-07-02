#include "uz_PI_controller.h"
#include "../uz_global_configuration.h"

struct uz_PI_Controller {
	bool is_ready;
	float I_sum;
    float P_sum;
	float error;
	float Kp;
	float Ki;
	float d_y_max;
	float d_y_min;
	float samplingTime_sec;
	bool int_clamping;
};
static size_t instances_counter_PI_Controller = 0;

static uz_PI_Controller instances_PI_Controller[UZ_FOC_PI_CONTROLLER_MAX_INSTANCES] = { 0 };

/**
 * @brief Memory allocation of the PI-Controller object
 *
 * @return Pointer to PI-Controller instance
 */
static uz_PI_Controller* uz_PI_Controller_allocation(void);

static uz_PI_Controller* uz_PI_Controller_allocation(void) {
	uz_assert(instances_counter_PI_Controller < UZ_FOC_PI_CONTROLLER_MAX_INSTANCES);
	uz_PI_Controller* self = &instances_PI_Controller[instances_counter_PI_Controller];
	uz_assert(self->is_ready == false);
	instances_counter_PI_Controller++;
	self->is_ready = true;
	return (self);
}

uz_PI_Controller* uz_PI_Controller_init(uz_PI_Controller_config config) {
	uz_PI_Controller* self = uz_PI_Controller_allocation();
    uz_assert(config.Ki > 0.0f);
    uz_assert(config.Kp > 0.0f);
    uz_assert(config.samplingTime_sec > 0.0f);
    uz_assert(config.d_y_max > config.d_y_min);
	self->Ki = config.Ki;
	self->Kp = config.Kp;
	self->samplingTime_sec = config.samplingTime_sec;
	self->d_y_max = config.d_y_max;
	self->d_y_min = config.d_y_min;
	return (self);
}

float uz_PI_Controller_Dead_Zone(float input, float d_y_max, float d_y_min) {
	float output;
	if (input >= d_y_min && input <= d_y_max) {
		output = 0.0f;
	} else if (input > d_y_max) {
		output = input - d_y_max;
	} else {
		output = input - d_y_min;
	}
	return (output);
}

int uz_PI_Controller_get_sign_of_value(float input) {
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

bool uz_PI_Controller_Clamping_Circuit(float preIntegrator, float preSat, float d_y_max, float d_y_min) {
	bool output = false;
	float value_after_deadzone = uz_PI_Controller_Dead_Zone(preSat, d_y_max, d_y_min);
	int sign_after_deadzone = uz_PI_Controller_get_sign_of_value(value_after_deadzone);
	int sign_preIntegrator = uz_PI_Controller_get_sign_of_value(preIntegrator);
	if (0 != value_after_deadzone && sign_after_deadzone == sign_preIntegrator) {
		output = true;
	} else {
		output = false;
	}
	return (output);
}


float uz_PI_Controller_sample(uz_PI_Controller* self, float referenceValue, float actualValue, bool ext_clamping) {
	uz_assert_not_NULL(self);
	float preSat = 0.0f;
	float preIntegrator = 0.0f;
	float output = 0.0f;
	float P_sum = 0.0f;

	preIntegrator = self->error * self->Ki;
	if (ext_clamping == true || self->int_clamping == true) {
		self->I_sum += 0.0f;
	} else {
		self->I_sum += preIntegrator * self->samplingTime_sec;
	}
	self->error = referenceValue - actualValue;
	self->P_sum = self->error * self->Kp;
	preSat = self->I_sum + self->P_sum;
	self->int_clamping = uz_PI_Controller_Clamping_Circuit(preIntegrator, preSat, self->d_y_max, self->d_y_min);
	output = preSat;
	return (output);
}
