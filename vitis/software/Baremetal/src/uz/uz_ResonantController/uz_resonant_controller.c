/******************************************************************************
* Copyright Contributors to the UltraZohm project.
* Copyright 2022 Josef Knoblach
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


#include "../uz_global_configuration.h"

#if UZ_RESONANT_CONTROLLER_MAX_INSTANCES > 0U
#include <stdbool.h> 
#include "uz_resonant_controller.h"
#include "../uz_HAL.h"


static uint32_t instances_counter_ResonantController = 0;

static uz_resonantController_t instances_ResonantController[UZ_RESONANT_CONTROLLER_MAX_INSTANCES] = { 0 };

static uz_resonantController_t* uz_ResonantController_allocation(void);


static uz_resonantController_t* uz_ResonantController_allocation(void) {
	uz_assert(instances_counter_ResonantController < UZ_RESONANT_CONTROLLER_MAX_INSTANCES);
	uz_resonantController_t* self = &instances_ResonantController[instances_counter_ResonantController];
	instances_counter_ResonantController++;
	return (self);
}


uz_resonantController_t* uz_resonantController_init(struct uz_resonantController_config config) {
	uz_resonantController_t* self = uz_ResonantController_allocation();
	self->PtrToModelData=&self->modelData;
	self->PtrToModelData->dwork=&self->dwork;
	self->PtrToModelData->inputs=&self->input;
	self->PtrToModelData->outputs=&self->output;
	Resonant_Controller_initialize(self->PtrToModelData);


  	uz_assert(config.T_sw >= 0.0f);
    uz_assert(config.upper_limit > config.lower_limit);
	uz_assert(config.lower_limit < config.upper_limit);

	self->input.T_sw = config.T_sw;
	self->input.VR = config.VR;
	self->input.h = config.h;
	self->input.omega_el = config.omega_el;
	self->input.lower_limit = config.lower_limit;
	self->input.upper_limit = config.upper_limit;
	self->input.Klim = config.Klim;
	self->input.in_ref = config.in_ref;
	self->input.in_m = config.in_m;
	self->input.Reset = config.Reset;
	return (self);
}


void uz_resonantController_step(uz_resonantController_t *self) {
	uz_assert_not_NULL(self);
	Resonant_Controller_step(self->PtrToModelData);
}


void uz_resonantController_reset(uz_resonantController_t *self){
	uz_assert_not_NULL(self);
	self->PtrToModelData->inputs->Reset = 1.0;
	self->PtrToModelData->inputs->in_m = 0.0;
	self->PtrToModelData->inputs->in_ref = 0.0;
	Resonant_Controller_step(self->PtrToModelData);
	self->PtrToModelData->inputs->Reset = 0.0;
}

float uz_resonantController_get_output(uz_resonantController_t *self){
	uz_assert_not_NULL(self);
	return self->output.out;
}


void uz_resonantController_set_input(uz_resonantController_t *self, float _in_ref, float _in_m, float _omega_el){
	uz_assert_not_NULL(self);
	self->input.in_ref = _in_ref;
	self->input.in_m = _in_m;
	self->input.omega_el = _omega_el;
}



void uz_resonantController_set_config(uz_resonantController_t *self, struct uz_resonantController_config config){
	uz_assert(config.T_sw >= 0.0f);
    uz_assert(config.upper_limit > config.lower_limit);
	uz_assert(config.lower_limit < config.upper_limit);

	self->input.T_sw = config.T_sw;
	self->input.VR = config.VR;
	self->input.h = config.h;
	self->input.omega_el = config.omega_el;
	self->input.lower_limit = config.lower_limit;
	self->input.upper_limit = config.upper_limit;
	self->input.Klim = config.Klim;
	self->input.in_ref = config.in_ref;
	self->input.in_m = config.in_m;
	self->input.Reset = config.Reset;
}



#endif
