#include "uz_FOC.h"
#include "../uz_global_configuration.h"
typedef struct uz_FOC {
	bool is_ready;
	bool ext_clamping;
	struct uz_FOC_config config_FOC;
	struct uz_PI_Controller* Controller_id;
	struct uz_PI_Controller* Controller_iq;
}uz_FOC;

static struct uz_dq_t uz_FOC_CurrentControl(uz_FOC* self, struct uz_dq_t i_dq_meas_Ampere);
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

uz_FOC* uz_FOC_init(struct uz_FOC_config config_FOC) {
	uz_FOC* self = uz_FOC_allocation();
	uz_assert(config_FOC.polePairs > 0.0f);
	self->Controller_id = uz_PI_Controller_init(config_FOC.config_id);
	self->Controller_iq = uz_PI_Controller_init(config_FOC.config_iq);
	self->config_FOC = config_FOC;
	return (self);
}

struct uz_dq_t uz_FOC_sample(uz_FOC* self, struct uz_dq_t i_dq_meas_Ampere, float U_zk_Volts, float omega_el_rad_per_sec) {
	struct uz_dq_t u_dq_ref_Volts = uz_FOC_CurrentControl(self, i_dq_meas_Ampere);
	struct uz_dq_t u_dq_decoup_Volts = uz_FOC_linear_decoupling(self->config_FOC.config_lin_decoupling, i_dq_meas_Ampere, omega_el_rad_per_sec);
	u_dq_ref_Volts.d = u_dq_ref_Volts.d + u_dq_decoup_Volts.d;
	u_dq_ref_Volts.q = u_dq_ref_Volts.q + u_dq_decoup_Volts.q;
	struct uz_dq_t u_dq_limit_Volts = uz_FOC_SpaceVector_Limitation(u_dq_ref_Volts, U_zk_Volts, omega_el_rad_per_sec, i_dq_meas_Ampere, &self->ext_clamping);
	return (u_dq_limit_Volts);
}

static struct uz_dq_t uz_FOC_CurrentControl(uz_FOC* self, struct uz_dq_t i_dq_meas_Ampere) {
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	struct uz_dq_t u_dq_ref_Volts = { 0 };
	u_dq_ref_Volts.q = uz_PI_Controller_sample(self->Controller_iq, self->config_FOC.ref_current_Ampere.q, i_dq_meas_Ampere.q, self->ext_clamping);
	u_dq_ref_Volts.d = uz_PI_Controller_sample(self->Controller_id, self->config_FOC.ref_current_Ampere.d, i_dq_meas_Ampere.d, self->ext_clamping);
	return (u_dq_ref_Volts);

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

void uz_FOC_set_polePairs(uz_FOC* self, float polePairs){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(polePairs > 0.0f);
	uz_assert(fmodf(polePairs, 1.0f) == 0);
	self->config_FOC.polePairs = polePairs;
}

void uz_FOC_set_Ld(uz_FOC* self, float Ld_Henry){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Ld_Henry > 0.0f);
	self->config_FOC.config_lin_decoupling.Ld_Henry = Ld_Henry;
}

void uz_FOC_set_Lq(uz_FOC* self, float Lq_Henry){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Lq_Henry > 0.0f);
	self->config_FOC.config_lin_decoupling.Lq_Henry = Lq_Henry;
}

void uz_FOC_set_Psi_PM(uz_FOC* self, float Psi_PM_Vs){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	uz_assert(Psi_PM_Vs >= 0.0f);
	self->config_FOC.config_lin_decoupling.Psi_PM_Vs = Psi_PM_Vs;
}
