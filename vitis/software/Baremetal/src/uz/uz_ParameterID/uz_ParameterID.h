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
#ifndef UZ_PARAMETERID_H
#define UZ_PARAMETERID_H

#include <math.h>
#include "../uz_HAL.h"
#include <stdbool.h>
#include "uz_PID_ControlState/uz_PID_ControlState.h"
#include "uz_PID_ElectricalID/uz_PID_ElectricalID.h"
#include "uz_PID_FluxMapID/uz_PID_FluxMapID.h"
#include "../uz_FOC/uz_FOC.h"
#include "../uz_SpeedControl/uz_speedcontrol.h"


typedef struct uz_ParameterID_Data_t {
	uz_PID_ActualValues_t PID_ActualValues;
	uz_PID_ControlFlags_t PID_ControlFlags;
	uz_PID_GlobalConfig_t PID_GlobalConfig;
	uz_PID_ElectricalIDConfig_t PID_ElectricalID_Config;
	uz_PID_FluxMapIDConfig_t PID_FluxMapID_Config;
	uz_PID_ElectricalID_output_t PID_ElectricalID_Output;
	uz_PID_FluxMapID_output_t PID_FluxMapID_Output;
	uz_PID_Controller_Parameters_output_t PID_Controller_Parameters;
} uz_ParameterID_Data_t;

void uz_ParameterID_init(uz_PID_ControlState_t* ControlState, uz_PID_ElectricalID_t *ElectricalID, uz_PID_FluxMapID_t* FluxMapID);

void uz_ParameterID_step(uz_PID_ControlState_t* ControlState, uz_PID_ElectricalID_t *ElectricalID, uz_PID_FluxMapID_t* FluxMapID, uz_ParameterID_Data_t* Data);

//struct uz_DutyCycle_t uz_ParameterID_Controller(uz_ParameterID_Data_t* Data, uz_FOC* FOC_instance, uz_PI_Controller* Speed_instance);
struct uz_dq_t uz_ParameterID_Controller(uz_ParameterID_Data_t* Data, uz_FOC* FOC_instance, uz_PI_Controller* Speed_instance);

void uz_ParameterID_initialize_data_structs(uz_ParameterID_Data_t *Data);






#endif // UZ_PARAMETERID_H
