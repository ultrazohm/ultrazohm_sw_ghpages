#ifndef UZ_NN_H
#define UZ_NN_H

#define UZ_NN_MAX_LAYER 10U
#include "uz_nn_layer.h"

/**
 * @brief Object definition for one neural network
 * 
 */
typedef struct uz_nn_t uz_nn_t;


/**
 * @brief 
 * 
 * @param config 
 * @param number_of_layer 
 * @return uz_nn_t* 
 */
uz_nn_t* uz_nn_init(struct uz_nn_layer_config config[UZ_NN_MAX_LAYER], size_t number_of_layer);


void uz_nn_ff(uz_nn_t* self, uz_matrix_t const*const input);


uz_matrix_t *uz_nn_get_output_data(uz_nn_t const *const self);


#endif // UZ_NN_H
