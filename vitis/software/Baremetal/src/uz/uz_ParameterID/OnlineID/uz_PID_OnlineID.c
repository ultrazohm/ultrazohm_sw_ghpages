/******************************************************************************
 * Copyright 2021 Dennis Hufnagel
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
#include "../../uz_global_configuration.h"
#if UZ_PARAMETERID_MAX_INSTANCES > 0U
#include "uz_PID_OnlineID.h"

static uint32_t instances_counter_PID_OnlineID = 0;

static uz_PID_OnlineID_t instances_PID_OnlineID[UZ_PARAMETERID_MAX_INSTANCES] = { 0 };

static uz_PID_OnlineID_t* uz_PID_OnlineID_allocation(void);

static uz_PID_OnlineID_t* uz_PID_OnlineID_allocation(void) {
	uz_assert(instances_counter_PID_OnlineID < UZ_PARAMETERID_MAX_INSTANCES);
	uz_PID_OnlineID_t* self = &instances_PID_OnlineID[instances_counter_PID_OnlineID];
	instances_counter_PID_OnlineID++;
	return (self);
}
uz_PID_OnlineID_t* uz_OnlineID_init(void) {
	uz_PID_OnlineID_t* self = uz_PID_OnlineID_allocation();
	self->PtrToModelData = &self->modelData;
	self->PtrToModelData->dwork = &self->rtDW;
	self->PtrToModelData->inputs = &self->input;
	self->PtrToModelData->outputs = &self->output;
	self->CleanPsiArray = uz_CleanPsiArray_init();
	self->InterpMeshGrid = uz_InterpMeshGrid_init();
	self->AutoRefCurrents = uz_AutoRefCurrents_init();
	OnlineID_initialize(self->PtrToModelData);
	return (self);
}

void uz_OnlineID_step(uz_PID_OnlineID_t *self) {
	uz_assert_not_NULL(self);
	OnlineID_step(self->PtrToModelData);
}

void uz_OnlineID_CleanPsiArray(uz_PID_OnlineID_t* self) {
	uz_assert_not_NULL(self);
	uz_CleanPsiArray(self->CleanPsiArray);
}

void uz_OnlineID_CalcFluxMaps(uz_PID_OnlineID_t* self) {
	uz_assert_not_NULL(self);
	uz_InterpMeshGrid(self->InterpMeshGrid);
}

void uz_OnlineID_AutoRefCurrents_step(uz_PID_OnlineID_t* self) {
	uz_assert_not_NULL(self);
	uz_AutoRefCurrents_step(self->AutoRefCurrents);
}

#endif
