#ifndef UZ_FOC_H
#define UZ_FOC_H

#pragma once
#include "../uz_HAL.h"
#include "../uz_piController/uz_piController.h"
#include "../uz_signals/uz_signals.h"
#include "../uz_Transformation/uz_Transformation.h"
#include "uz_linear_decoupling.h"
#include "uz_space_vector_limitation.h"
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>

/**
 * @brief Configuration struct for FOC. Accessible by the user
 */
typedef struct uz_FOC_config {
	float iq_ref_Ampere;
	float id_ref_Ampere;
	float n_ref_rpm;
	unsigned int FOC_Select; //1=CurrentControl 2=SpeedControl
	float polePairs;
} uz_FOC_config;

/**
 * @brief Struct for measured parameters, which are needed for the FOC. Accessible by the user
 *
 */
typedef struct uz_FOC_ActualValues {
	struct uz_dq_t i_dq_meas_Ampere;
	float omega_el_rad_per_sec;
	float theta_el_rad;
	float U_zk_Volts;
} uz_FOC_ActualValues;

/**
 * @brief Object definition for FOC
 *
 */
typedef struct uz_FOC uz_FOC;

/**
 * @brief Initialization of the uz_FOC object
 *
 * @param config_FOC configuration struct for FOC
 * @param config_id configuration struct for id-PI-Controller
 * @param config_iq configuration struct for iq-PI-Controller
 * @param config_n configuration struct for n-PI-Controller
 * @param config_lin_Decoup configuration struct for linear decoupling
 * @return uz_FOC* Pointer to uz_FOC instance
 */
uz_FOC* uz_FOC_init(uz_FOC_config config_FOC, uz_PI_Controller_config config_id, uz_PI_Controller_config config_iq, uz_PI_Controller_config config_n, uz_lin_decoupling_config config_lin_Decoup);

/**
 * @brief calculates last sample for dq-reference voltages
 *
 * @param self uz_FOC instance
 * @param values uz_FOC_ActualValues struct with the actual measurement values
 * @return struct uz_dq_t Output dq-reference voltage struct
 */
struct uz_dq_t uz_FOC_sample(uz_FOC* self, uz_FOC_ActualValues values);

/**
 * @brief Resets the FOC and the integrators of the PI-Controllers
 *
 * @param self uz_FOC instance
 */
void uz_FOC_reset(uz_FOC* self);

/**
 * @brief Function to change the Kp-value of the n-PI-Controller during runtime
 *
 * @param self uz_FOC instance
 * @param Kp_n new Kp_n value. Must be greater or equal than 0.0f
 */
void uz_FOC_set_Kp_n(uz_FOC* self, float Kp_n);

/**
 * @brief Function to change the Ki-value of the n-PI-Controller during runtime
 *
 * @param self uz_FOC instance
 * @param Ki_n new Ki_n value. Must be greater or equal than 0.0f
 */
void uz_FOC_set_Ki_n(uz_FOC* self, float Ki_n);

/**
 * @brief Function to change the Kp-value of the id-PI-Controller during runtime
 *
 * @param self uz_FOC instance
 * @param Kp_n new Kp_id value. Must be greater or equal than 0.0f
 */
void uz_FOC_set_Kp_id(uz_FOC* self, float Kp_id);

/**
 * @brief Function to change the Ki-value of the id-PI-Controller during runtime
 *
 * @param self uz_FOC instance
 * @param Kp_n new Ki_id value. Must be greater or equal than 0.0f
 */
void uz_FOC_set_Ki_id(uz_FOC* self, float Ki_id);

/**
 * @brief Function to change the Kp-value of the iq-PI-Controller during runtime
 *
 * @param self uz_FOC instance
 * @param Kp_n new Kp_iq value. Must be greater or equal than 0.0f
 */
void uz_FOC_set_Kp_iq(uz_FOC* self, float Kp_iq);

/**
 * @brief Function to change the Ki-value of the iq-PI-Controller during runtime
 *
 * @param self uz_FOC instance
 * @param Kp_n new Ki_iq value. Must be greater or equal than 0.0f
 */
void uz_FOC_set_Ki_iq(uz_FOC* self, float Ki_iq);

/**
 * @brief Function to change the d-reference current during runtime
 *
 * @param self uz_FOC instance
 * @param id_ref new id_ref value.
 */
void uz_FOC_set_id_ref(uz_FOC* self, float id_ref);

/**
 * @brief Function to change the q-reference current during runtime
 *
 * @param self uz_FOC instance
 * @param id_ref new iq_ref value.
 */
void uz_FOC_set_iq_ref(uz_FOC* self, float iq_ref);

/**
 * @brief 
 * 
 * @param self 
 * @param config_FOC 
 * @param config_id 
 * @param config_iq 
 * @param config_n 
 * @param config_lin_Decoup 
 * @return uz_FOC* 
 */
uz_FOC* uz_FOC_set_control_Method(uz_FOC* self, uz_FOC_config config_FOC, uz_PI_Controller_config config_id, uz_PI_Controller_config config_iq, uz_PI_Controller_config config_n, uz_lin_decoupling_config config_lin_Decoup);

/**
 * @brief Function to change the polePairs during runtime
 *
 * @param polePairs new value for polePairs. Must be greater than 0.0f
 */
void uz_FOC_set_polePairs(uz_FOC* self, float polePairs);
#endif // UZ_FOC_H
