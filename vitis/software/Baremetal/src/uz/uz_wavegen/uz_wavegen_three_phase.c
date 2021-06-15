#include "uz_wavegen.h"
#include <math.h>
#include "../uz_HAL.h"
#include "../uz_SystemTime/uz_SystemTime.h"
#define UZ_WAVEGEN_THREE_PHASE_MAX_INSTANCES 2u

#ifdef TEST
	#undef UZ_WAVEGEN_THREE_PHASE_MAX_INSTANCES
	#define UZ_WAVEGEN_THREE_PHASE_MAX_INSTANCES 5u
#endif

struct uz_wavegen_three_phase {
	bool is_ready;
	float phase_U;
	float phase_V;
	float phase_W;
	struct uz_wavegen_three_phase_config config;
};

static size_t counter_three_phase = 0u;
static uz_wavegen_three_phase instances_three_phase[UZ_WAVEGEN_THREE_PHASE_MAX_INSTANCES] = { 0 };

uz_wavegen_three_phase* uz_wavegen_three_phase_init(struct uz_wavegen_three_phase_config config) {
	uz_assert(counter_three_phase < UZ_WAVEGEN_THREE_PHASE_MAX_INSTANCES);
	uz_wavegen_three_phase* self = &instances_three_phase[counter_three_phase];
	uz_assert(self->is_ready == false);
	counter_three_phase++;
	self->is_ready = true;
	uz_assert(config.frequency_Hz > 0.0f);
	uz_assert(config.amplitude != 0.0f);
	self->config = config;
	return (self);
}

void uz_wavegen_three_phase_sample(uz_wavegen_three_phase* self) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	float t_Sec = uz_SystemTime_GetGlobalTimeInSec();
	float angle = 2.0f * M_PI * t_Sec * self->config.frequency_Hz;
	self->phase_U = self->config.amplitude * sinf(angle) + self->config.offset;
	self->phase_V = self->config.amplitude * sinf(angle + (2.0f * M_PI / 3.0f)) + self->config.offset;
	self->phase_W = self->config.amplitude * sinf(angle + (4.0f * M_PI / 3.0f)) + self->config.offset;
}

float uz_wavegen_three_phase_get_phaseU(uz_wavegen_three_phase* self) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	return (self->phase_U);
}

float uz_wavegen_three_phase_get_phaseV(uz_wavegen_three_phase* self) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	return (self->phase_V);
}

float uz_wavegen_three_phase_get_phaseW(uz_wavegen_three_phase* self) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	return (self->phase_W);
}
