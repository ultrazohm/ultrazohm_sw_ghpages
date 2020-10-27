//toolbox.c
//Toolbox for transformations, integrators, PI controllers, filters etc.

#include "../include/control_toolbox.h"

//Sinewave generator
//amplitude:			Amplitude of the output sinewave
//frequency:			Frequency of the output sinewave
//phase:				Initial phase angle [rad]
//sample:				Pointer to sample no.
//int_freq:				Interrupt frequency (i. e. frequency of the control algorithm)
//return value:			Sine output
float sinewave(float amplitude, float frequency, float phase, long* sample, float int_freq)
{
	//Variables
	float angle;

	//Go back to 1st sample if end of sinewave is reached
	if(*sample >= int_freq/frequency - 1)
		*sample = 0;

	//Calculate angle and increase sample
	angle = 2.0*M_PI*frequency/int_freq*((float)(*sample));
	angle += phase;
	*sample += 1;

	return(amplitude*sin(angle));
}

//Blockwave generator
float blockwave(float amp_p, float amp_n, float frequency, float phase, long* sample, float int_freq)
{
	float angle;

	if(*sample >= int_freq/frequency - 1)
		*sample = 0;

	angle = 2.0*M_PI*frequency/int_freq*((float)(*sample));
	angle += phase;
	*sample += 1;
	angle = sin(angle);

	if(angle > 0.0)
		angle = amp_p;
	else
		angle = amp_n;

	return(angle);
}

//Periodic Ramp generator
float rampwave(float amp_p, float amp_n, float frequency, float phase, long* sample, float int_freq)
{
	float angle;
	if(*sample >= int_freq/frequency - 1)
		*sample = 0;

	angle =M_PI*frequency/int_freq*((float)(*sample));
	angle += phase/2.0;
	*sample += 1;

	if (cos(angle) >= 0.0)
		angle = asin(sin(angle))/M_PI;
	else
		angle = -asin(sin(angle))/M_PI;

	angle *= (amp_p - amp_n);
	angle += (amp_p + amp_n)/2.0;

	return(angle);
}

//Pulse generator
float pulse(float amplitude, float duty, float frequency, float phase, long* sample, float int_freq)
{
	float sample_offset = phase/(2.0*M_PI*frequency)*int_freq;

	if(duty > 1.0)
		duty = 1.0;

	if(duty < 0.0)
		duty = 0.0;

	*sample += 1;

	if(*sample >= int_freq/frequency + sample_offset)
		*sample = sample_offset;

	if(*sample >= int_freq/frequency*duty + sample_offset)
		return 0.0;
	else
		return amplitude;
}

//Clarke transformation (abc to alpha beta)
//alpha:					Alpha "phase" after Clarke transformation
//beta:						Beta "phase" after Clarke transformation
//a:						Phase a before Clarke transformation
//b:						Phase b before Clarke transformation
//c:						Phase c before Clarke transformation
void Clarke(float* alpha, float* beta, float a, float b, float c)
{
	*alpha = 0.6667*(a - 0.5*b - 0.5*c);
	*beta = 0.5773*(b - c);
}

//Clarke transformation (abc to alpha beta) for a balanced system (a + b + c = 0)
//alpha:					Alpha "phase" after Clarke transformation
//beta:						Beta "phase" after Clarke transformation
//a:						Phase a before Clarke transformation
//b:						Phase b before Clarke transformation
void Clarke_balanced(float* alpha, float* beta, float a, float b)
{
	*alpha = a;
	*beta = 0.57735*a + 1.1547*b;
}

//Inverse Clarke transformation (ab to abc)
//alpha:					Alpha "phase" before inverse Clarke transformation
//beta:						Beta "phase" before inverse Clarke transformation
//a:						Phase a after inverse Clarke transformation
//b:						Phase b after inverse Clarke transformation
//c:						Phase c after inverse Clarke transformation
void Clarke_inv(float alpha, float beta, float* a, float* b, float* c)
{
	*a = alpha;
	*b = -0.5*alpha + 0.866*beta;
	*c = -0.5*alpha - 0.866*beta;
}

//Park transformation (alpha beta to dq)
//alpha:					Alpha "phase" before Park transformation
//beta:						Beta "phase" before Park transformation
//d:						d "phase" after Park transformation
//q:						q "phase" after Park transformation
//phi:						Flux angle for Park transformation (0...2*pi)
void Park(float alpha, float beta, float* d, float* q, float phi)
{
	//Variables
	float sinphi = 0.0, cosphi = 0.0;

	//Calculate cos and sin of flux angle only once to save calculation time
	sinphi = sin(phi);
	cosphi = cos(phi);

	*d =  alpha*cosphi + beta*sinphi;
	*q = -alpha*sinphi + beta*cosphi;
}

//Inverse Park transformation (dq to alpha beta)
//alpha:					Alpha "phase" before inverse Park transformation
//beta:						Beta "phase" before inverse Park transformation
//d:						d "phase" after inverse Park transformation
//q:						q "phase" after inverse Park transformation
//phi:						Flux angle for inverse Park transformation (0...2*pi)
void Park_inv(float* alpha, float* beta, float d, float q, float phi)
{
	//Inverse Park transformation is just the same as the "normal" Park transformation
	//BUT: phi for inverse Park transformation is the negative angle compared to the "normal" Park transformation

	//Variables
	float sinphi, cosphi;

	//Calculate cos and sin of flux angle only once to save calculation time
	sinphi = sin(phi);
	cosphi = cos(phi);

	*alpha = d*cosphi - q*sinphi;
	*beta  = d*sinphi + q*cosphi;
}

//PI controller with anti windup and output limitation
//error:			Control error (reference - actual value)
//error_sum:		Pointer to storage variable for the summed error
//anti_windup:		Pointer anti-windup flag: 0: no output saturation and anti-windup; 1: output saturation and anti-windup
//Kp:				Proportional gain of the controller
//Ki:				Integral gain of the controller
//output_limit:		Output limit for the controller (if in output saturation then anti-windup for integral part)
//Tsampling:		Sampling time of the PI controller in seconds
//return value:		PI controller output
float PI_Controller(float error, float* error_sum, int* anti_windup, float Kp, float Ki, float output_limit, float TSampling)
{
	//Variables
	float out = 0.0;

	//Sum control deviation (only if the anti-windup flag is not set)
	if(*anti_windup == 0)
		*error_sum += error;

	//Controller output
	out = Kp*error + Ki*TSampling*(*error_sum);

	//Output limitation (if yes, anti-windup has to be activated)
	if(out > output_limit)
	{
		out = output_limit;
		*anti_windup = 1;
	}
	else if(out < -output_limit)
	{
		out = -output_limit;
		*anti_windup = 1;
	}
	else	//No output limitation => set back anti-windup flag
		*anti_windup = 0;

	return out;
}

//Get magnitude and angle of a 2D vector
void karth_polar(float *magn, float *angle, float x, float y)
{
	//Magnitude
	*magn = sqrt(x*x+y*y);

	//Angle
	*angle = atan2(y, x);
}

/* 1st order Low Pass Filter */
//input:			signal that you want to be filtered
//in_mem:			Pointer to storage variable
//out_mem:			Pointer to storage variable
//Fs:				sampling frequency of the low-pass filter
//Fc:				crossover frequency of the low-pass filter
//return value:		filtered signal
float LPF1(float input,float* in_mem,float* out_mem, float Fs, float Fc)
{
	float P1;
	float K1;
	float K2;
	float output;

	P1 =M_PI*Fc/Fs;
	K1 = P1/(P1+1);
	K2 = (P1-1)/(P1+1);

	output = (*out_mem)*(-K2);
	output += K1*(input + *in_mem);
	*in_mem = input;
	*out_mem = output;

	return output;
}

/* 1st order Low Pass Filter */
//input:			signal that you want to be filtered
//in_mem:			Pointer to storage variable
//out_mem:			Pointer to storage variable
//Fs:				sampling frequency of the low-pass filter
//Fc:				crossover frequency of the low-pass filter
//return value:		filtered signal
float HPF1(float input,float* in_mem,float* out_mem, float Fs, float Fc)
{
	float P1;
	float K1;
	float K2;
	float output;

	P1 =M_PI*Fc/Fs;
	K1 = P1/(P1+1);
	K2 = (P1-1)/(P1+1);

	output = (*out_mem)*(-K2);
	output += K1*(input + *in_mem);
	*in_mem = input;
	*out_mem = output;

	output = input-output;

	return output;
}
