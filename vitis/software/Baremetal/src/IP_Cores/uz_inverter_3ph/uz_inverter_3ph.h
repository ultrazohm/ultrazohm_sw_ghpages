#ifndef uz_inverter_3ph_H
#define uz_inverter_3ph_H

#include <stdint.h>
#include <stdbool.h>
#include "../../uz/uz_Transformation/uz_Transformation.h"

/**
 * @brief Object data type definition of the inverter model IP-Core driver
 * 
 */
typedef struct uz_inverter_3ph_t uz_inverter_3ph_t;

/**
 * @brief Configuration struct for the Inverter model IP-Core driver
 * 
 */
struct uz_inverter_3ph_config_t
{
    uint32_t base_address;          /**< Base address of the IP-Core instance to which the driver is coupled */
    uint32_t ip_core_frequency_Hz;  /**< Clock frequency of IP-Core */
    bool switch_pspl_abc;           /**< True: use currents from PS, False: use currents from PL */
    bool switch_pspl_gate;          /**< True: use gate signals from PS, False: use gate signals from PL */
    float udc;                      /**< Value of DC bus voltage */
};

/**
 * @brief Struct to be used to pass gate signals to the inverter Model
 * 
 */
struct uz_inverter_3ph_gate_ps_t{
    float gate1; /**< Gate 1 signal for inverter circuit */
    float gate2; /**< Gate 2 signal for inverter circuit */
    float gate3; /**< Gate 3 signal for inverter circuit */
    float gate4; /**< Gate 4 signal for inverter circuit */
    float gate5; /**< Gate 5 signal for inverter circuit */
    float gate6; /**< Gate 6 signal for inverter circuit */
};

/**
 * @brief Initialize an instance of the driver
 * 
 * @param config Config struct
 * @return uz_inverter_3ph_t* Pointer to an initialized instance of the driver
 */
uz_inverter_3ph_t *uz_inverter_3ph_init(struct uz_inverter_3ph_config_t config);

/**
 * @brief Returns outputs 
 * 
 * @param self Pointer to driver instance
 * @return uz_inverter_3ph_Uabc_t Output values
 */
uz_3ph_abc_t uz_inverter_3ph_get_u_abc_ps(uz_inverter_3ph_t *self);

/**
 * @brief Set inputs of the model and write them to the Inverter model IP-Core
 * 
 * @param self Pointer to driver instance
 * @param Iabc Inputs to be written to IP-Core
 */
void uz_inverter_3ph_set_i_abc_ps(uz_inverter_3ph_t *self, uz_3ph_abc_t Iabc);

/**
 * @brief Set inputs of the model and write them to the Inverter model IP-Core
 * 
 * @param self Pointer to driver instance
 * @param G Inputs to be written to IP-Core
 */
void uz_inverter_3ph_set_gate_ps(uz_inverter_3ph_t *self,struct uz_inverter_3ph_gate_ps_t G);

/**
 * @brief Takes the values of the AXI shadow register and pass them to the actual output.
 * 
 * @param self 
 */
void uz_inverter_3ph_trigger_u_abc_ps_strobe(uz_inverter_3ph_t *self);

/**
 * @brief Takes the values of the AXI shadow register and pass them to the actual input.
 * 
 * @param self 
 */
void uz_inverter_3ph_trigger_i_abc_ps_strobe(uz_inverter_3ph_t *self);

/**
 * @brief Takes the values of the AXI shadow register and pass them to the actual input.
 * 
 * @param self 
 */
void uz_inverter_3ph_trigger_gate_ps_strobe(uz_inverter_3ph_t *self);

#endif // uz_inverter_3ph_H
