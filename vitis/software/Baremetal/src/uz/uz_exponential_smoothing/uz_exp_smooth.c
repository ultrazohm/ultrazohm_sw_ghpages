/******************************************************************************
 * Copyright Contributors to the UltraZohm project.
 * Copyright 2022 Florian Rosner
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
#include "uz_exp_smooth.h"
#include "../uz_global_configuration.h"
#include "../uz_HAL.h"
#include "../uz_math_constants.h"
#include <stdbool.h> 
#if UZ_EXP_SMOOTH_MAX_INSTANCES > 0U


typedef struct UZ_EXP_SMOOTH_t {
    bool is_ready;
    float alpha;
    float old_sample;
    float actual_sample;
    bool first_step;
} UZ_EXP_SMOOTH_t;

static size_t instance_counter = 0U;
static UZ_EXP_SMOOTH_t instances[UZ_EXP_SMOOTH_MAX_INSTANCES] = { 0 };

static UZ_EXP_SMOOTH_t* UZ_EXP_SMOOTH_allocation(void);

static UZ_EXP_SMOOTH_t* UZ_EXP_SMOOTH_allocation(void){
    uz_assert(instance_counter < UZ_EXP_SMOOTH_MAX_INSTANCES);
    UZ_EXP_SMOOTH_t* self = &instances[instance_counter];
    uz_assert_false(self->is_ready);
    instance_counter++;
    self->is_ready = true;
    return (self);
}

UZ_EXP_SMOOTH_t* UZ_EXP_SMOOTH_init(float alpha) {
    UZ_EXP_SMOOTH_t *self = UZ_EXP_SMOOTH_allocation();
    self->first_step = true;
    self->alpha = alpha;
     // Call after the init is the first call
    return (self);
}

float uz_EXP_SMOOTH_sample(UZ_EXP_SMOOTH_t *self, float input)
{
    uz_assert_not_NULL(self);
    uz_assert(self->is_ready);
    float output = 0.0f;
    // There are no old steps if it's the first step, thus filter is not calculated but only "old" values are set
    if (self->first_step)
    {
        self->actual_sample = input;
        self->old_sample = input;
        self->first_step = false;
        output = input;
    }
    else
    {
        self->actual_sample = input;
        output = self->alpha * self->actual_sample + (1.0f - self->alpha) * self->old_sample;
        self->old_sample = self->actual_sample;
    }
    return (output);
}

#endif