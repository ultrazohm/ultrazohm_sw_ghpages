#ifndef UZ_RESONANTCONTROLLER_H
#define UZ_RESONANTCONTROLLER_H

#include "Resonant_Controller_ert_rtw/Resonant_Controller.h"

/*
 * @brief Struct for Resonant-Controller
 *
 */
typedef struct{
	ExtU_Resonant_Controller_T input;	/**< Input struct of the resonant controller*/
	ExtY_Resonant_Controller_T output;	/**< Output struct of the resonant controller*/
	DW_Resonant_Controller_T dwork;
	RT_MODEL_Resonant_Controller_T modelData;
	RT_MODEL_Resonant_Controller_T *PtrToModelData;
}uz_resonantController;

/*
 * @brief init function for the resonant controller
 *
 * @param uz_resonant_controller* pointer to the resonant controller
 * @return void
 */
void uz_resonantController_init(uz_resonantController *self);

/*
 * @brief step function of the resonant controller
 *
 * @param uz_resonant_controller* pointer to the resonant controller
 * @return void
 */
void uz_resonantController_step(uz_resonantController *self);

/*
 * @brief reset function of the resonant controller
 *
 * @param uz_resonant_controller* pointer to the resonant controller
 * @return void
 */
void uz_resonantController_reset(uz_resonantController *self);


#endif //UZ_RESONANTCONTROLLER_H
