#pragma once
#include <stdbool.h>

typedef struct uz_wavegen uz_wavegen;

struct uz_wavegen {
	bool is_ready;
	float elapsed_time_since_start;
	float amplitude;
	float start_frequency_Hz;
	float end_frequency_Hz;
	float duration_Sec;
	float initial_delay_Sec;
	float initial_global_time_Sec;
	float transition_angle;
};

float uz_wavegen_sine(float amplitude, float frequency_Hz);
float uz_wavegen_sine_with_offset(float amplitude, float frequency_Hz, float offset);
float uz_wavegen_sawtooth(float amplitude, float frequency_Hz);
float uz_wavegen_sawtooth_with_offset(float amplitude, float frequency_Hz, float offset);
float uz_wavegen_pulse(float amplitude, float frequency_Hz, float duty_cycle);
float uz_wavegen_square(float amplitude, float frequency_Hz);
float uz_wavegen_triangle(float amplitude, float frequency_Hz);
float uz_wavegen_triangle_with_offset(float amplitude, float frequency_Hz, float offset);
float uz_wavegen_saturation(float signal, float upper_limit, float lower_limit);

// Wave generation with state
float uz_wavegen_chirp_init(uz_wavegen* self);
float uz_wavegen_chirp(uz_wavegen* self);
