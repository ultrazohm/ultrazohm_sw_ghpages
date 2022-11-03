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

#include "uz_movingAverageFilter.h"
#include "../uz_global_configuration.h"
#include "../uz_HAL.h"
#include <stdlib.h>


typedef struct uz_movingAverageFilter_t{
	bool is_ready;
	uz_array_float_t circularBuffer2;
	uint32_t bufferindex;						//index in circularBuffer where to put new samples
	uint32_t filterLength;
	uint32_t MAX_LENGTH;
	uint32_t old_filterLength;
	float old_value;
	float sum;
}uz_movingAverageFilter_t;

static uint32_t instance_movingAverageFilter_counter = 0U;

static uz_movingAverageFilter_t instances_movingAverageFilter[UZ_MOVINGAVERAGEFILTER_MAX_INSTANCES] = { 0 };

static uz_movingAverageFilter_t* uz_movingAverageFilter_allocation(void);


static uz_movingAverageFilter_t* uz_movingAverageFilter_allocation(void){
 	uz_assert(instance_movingAverageFilter_counter < UZ_MOVINGAVERAGEFILTER_MAX_INSTANCES);
 	uz_movingAverageFilter_t* self = &instances_movingAverageFilter[instance_movingAverageFilter_counter];
  	instance_movingAverageFilter_counter = instance_movingAverageFilter_counter + 1;
 	uz_assert_false(self->is_ready);
 	self->is_ready = true;
 	return (self);
}

uz_movingAverageFilter_t* uz_movingAverageFilter_init(struct uz_movingAverageFilter_config config, uz_array_float_t circularBuffer){
	uz_movingAverageFilter_t* self = uz_movingAverageFilter_allocation();
	self->bufferindex = 0U;
	self->MAX_LENGTH = circularBuffer.length;
	uz_assert(config.filterLength <= self->MAX_LENGTH);
	self->filterLength = config.filterLength;
 	self->circularBuffer2.data = circularBuffer.data;
    return(self);
}


float uz_movingAverageFilter_sample_variable_length(uz_movingAverageFilter_t* self, float sample){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);

	//add new sample to circular buffer
	self->circularBuffer2.data[self->bufferindex] = sample;
	uint32_t index = 0;
	float output = 0.0f;

	if(self->filterLength == self->old_filterLength){
		uint32_t firstsample = 0U;
		//Only add newest value and delete oldest one
		if(self->filterLength == self->MAX_LENGTH) {
			output = self->sum + self->circularBuffer2.data[self->bufferindex] - self->old_value;
		} else {
			firstsample = ((self->bufferindex - self->filterLength) + self->MAX_LENGTH) % self->MAX_LENGTH;
			output = self->sum + self->circularBuffer2.data[self->bufferindex] - self->circularBuffer2.data[firstsample];
		}

	//Only use different calculation, if it results in less loop-iterations
	} else if((self->filterLength + self->old_filterLength) <= (self->filterLength + self->filterLength)) {
		//Increasing filter length
		if(self->filterLength > self->old_filterLength) {
			output = self->sum;
			if(self->filterLength - self->old_filterLength == 1) {
				output = output + self->circularBuffer2.data[self->bufferindex];
			} else {
				output = output + self->circularBuffer2.data[self->bufferindex];
				uint32_t start = (((self->bufferindex - self->filterLength)+1 + self->MAX_LENGTH) % self->MAX_LENGTH);
				uint32_t end = (start - 2 + (self->filterLength - self->old_filterLength) + self->MAX_LENGTH) % self->MAX_LENGTH;
				if (start > end) {
					//Because the for-loop would wrap around around the max_length, for loop has to be split up
					for(uint32_t i = start; i < self->MAX_LENGTH; i++){
						index = (i + self->MAX_LENGTH) % self->MAX_LENGTH;
						output = output + self->circularBuffer2.data[index];
					}
					for(uint32_t i = 0; i <= end; i++){
						index = (i + self->MAX_LENGTH) % self->MAX_LENGTH;
						output = output + self->circularBuffer2.data[index];
					}
				} else {
					for(uint32_t i = start; i <= end; i++){
						index = (i + self->MAX_LENGTH) % self->MAX_LENGTH;
						output = output + self->circularBuffer2.data[index];
					}
				}
			}
		//Decreasing filter length
		} else if((self->filterLength < self->old_filterLength)) {
			output = self->sum;
			//Add newest value to avarage
			output = output + self->circularBuffer2.data[self->bufferindex];
			//Delete oldest values, which are not part of the average anymore
			uint32_t end = (((self->bufferindex - self->filterLength) + self->MAX_LENGTH) % self->MAX_LENGTH);
			uint32_t start = (end - (self->old_filterLength - self->filterLength) + self->MAX_LENGTH) % self->MAX_LENGTH;
			if (start > end) {
				//Because the for-loop would wrap around the max_length, for loop has to be split up
				for(uint32_t i = start; i < self->MAX_LENGTH; i++){
					index = (i + self->MAX_LENGTH) % self->MAX_LENGTH;
					output = output - self->circularBuffer2.data[index];
				}
				for(uint32_t i = 0; i <= end; i++){
					index = (i + self->MAX_LENGTH) % self->MAX_LENGTH;
					output = output - self->circularBuffer2.data[index];
				}
			} else {
				for(uint32_t i = start; i <= end; i++){
					index = (i + self->MAX_LENGTH) % self->MAX_LENGTH;
					output = output - self->circularBuffer2.data[index];
				}
			}
		}
	} else {
		//Traditional looping, if the other cases result in no faster calculation
		output = 0.0f;
		for(uint32_t i = 0; i < self->filterLength; i++){
			index = (self->bufferindex - i + self->MAX_LENGTH) % self->MAX_LENGTH;
			output = output + self->circularBuffer2.data[index];
		}
	}

	self->sum = output;
	self->old_filterLength = self->filterLength;
	output = output/((float)self->filterLength);
	//modulo-increment of buffer-index
	self->bufferindex = (self->bufferindex + 1U) % self->MAX_LENGTH;
	//Safe "old" value at new bufferindex. Needed, when the filterlenght==self->MAX_LENGTH
	self->old_value= self->circularBuffer2.data[self->bufferindex];

	return(output);

}


float uz_movingAverageFilter_sample(uz_movingAverageFilter_t* self, float sample){
	uz_assert_not_NULL(self);
	float output = 0.0f;
	// add sample to buffer
	
	self->circularBuffer2.data[self->bufferindex] = sample/((float)self->filterLength);
	// find oldest sample in current sum

	uint32_t firstsample = ((self->bufferindex - self->filterLength) + self->MAX_LENGTH) % self->MAX_LENGTH;
	
	self->sum = self->sum + self->circularBuffer2.data[self->bufferindex] - self->circularBuffer2.data[firstsample];
	// add new input to sum, subtract oldest sample from sum
	output = self->sum;

	//modulo-increment of buffer-index
	self->bufferindex = (self->bufferindex + 1U) % self->MAX_LENGTH;

	return output;
}


void uz_movingAverageFilter_reset(uz_movingAverageFilter_t* self){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	for(uint32_t i = 0; i < self->MAX_LENGTH; i++){
		self->circularBuffer2.data[i] = 0.0f;
	}
	self->bufferindex = 0U;
	self->old_filterLength = 0U;
	self->sum = 0.0f;

}

void uz_movingAverageFilter_set_filterLength(uz_movingAverageFilter_t* self, uint32_t new_filterLength){
	uz_assert_not_NULL(self);
	uz_assert(self->is_ready);
	if(new_filterLength > self->MAX_LENGTH){
		new_filterLength = self->MAX_LENGTH;
	}
	self->filterLength = new_filterLength;
}
