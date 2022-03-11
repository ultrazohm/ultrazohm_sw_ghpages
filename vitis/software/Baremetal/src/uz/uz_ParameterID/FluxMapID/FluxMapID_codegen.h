/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: FluxMapID.h
 *
 * Code generated for Simulink model 'FluxMapID'.
 *
 * Model version                  : 2.134
 * Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
 * C/C++ source code generated on : Tue Nov 30 14:11:45 2021
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-R
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. Traceability
 * Validation result: Passed (9), Warnings (3), Error (0)
 */

#include "../../uz_global_configuration.h"
#if UZ_PARAMETERID_ACTIVE > 0U
#include "../../uz_Transformation/uz_Transformation.h"
#include "../../uz_PMSM_config/uz_PMSM_config.h"

#ifndef RTW_HEADER_FluxMapID_h_
#define RTW_HEADER_FluxMapID_h_
#include "../rtwtypes.h"
#include <math.h>
#include <string.h>
#ifndef FluxMapID_COMMON_INCLUDES_
#define FluxMapID_COMMON_INCLUDES_
#include "../rtwtypes.h"
#endif                                 /* FluxMapID_COMMON_INCLUDES_ */

/* Model Code Variants */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetRootDWork
#define rtmGetRootDWork(rtm)           ((rtm)->dwork)
#endif

#ifndef rtmSetRootDWork
#define rtmSetRootDWork(rtm, val)      ((rtm)->dwork = (val))
#endif

#ifndef rtmGetU
#define rtmGetU(rtm)                   ((rtm)->inputs)
#endif

#ifndef rtmSetU
#define rtmSetU(rtm, val)              ((rtm)->inputs = (val))
#endif

#ifndef rtmGetY
#define rtmGetY(rtm)                   ((rtm)->outputs)
#endif

#ifndef rtmSetY
#define rtmSetY(rtm, val)              ((rtm)->outputs = (val))
#endif

#define FluxMapID_M                    (rtFluxMapID_M)

/* Forward declaration for rtModel */
typedef struct tag_RTM_FluxMapID_t RT_MODEL_FluxMapID_t;

#ifndef DEFINED_TYPEDEF_FOR_uz_PID_FluxMapIDConfig_t_
#define DEFINED_TYPEDEF_FOR_uz_PID_FluxMapIDConfig_t_

/**
 * @brief configuration struct for FluxMapID specific settings
 * 
 */
typedef struct {
  real32_T AMMsampleTime; /**<settling time needed to collect all data in seconds */
  real32_T IDstart; /**< start point of the id-steps */
  real32_T IDstepsize; /**< stepsize of the id-steps */
  real32_T IDstop; /**< end point of the id-steps */
  real32_T IQstart; /**< start point of the iq-steps */
  real32_T IQstepsize; /**< stepsize of the iq-steps */
  real32_T IQstop; /**< end point of the iq-stops */
  real32_T R_s_ref; /**< reference resistance for online identification in Ohm*/
  real32_T Temp_ref; /**< reference temperature, at which the reference resistance was measured */
  boolean_T start_FM_ID; /**< flag to enable the automatic current control */
  boolean_T identR; /**< flag to enable online identification */
  real32_T identRAmp; /**< amplitude of the d-current injection signal for online identification of Rs in Amps */
} uz_PID_FluxMapIDConfig_t;

#endif

#ifndef DEFINED_TYPEDEF_FOR_uz_PID_ActualValues_t_
#define DEFINED_TYPEDEF_FOR_uz_PID_ActualValues_t_

typedef struct {
  uz_3ph_abc_t V_abc;
  uz_3ph_abc_t I_abc;
  uz_3ph_dq_t i_dq;
  uz_3ph_dq_t v_dq;
  real32_T omega_m;
  real32_T omega_el;
  real32_T theta_m;
  real32_T theta_el;
  real32_T V_DC;
} uz_PID_ActualValues_t;

#endif

#ifndef DEFINED_TYPEDEF_FOR_uz_PID_GlobalConfig_t_
#define DEFINED_TYPEDEF_FOR_uz_PID_GlobalConfig_t_

typedef struct {
  uz_PMSM_t PMSM_config;
  boolean_T enableParameterID;
  boolean_T Reset;
  real32_T Kp_id;
  real32_T Kp_iq;
  real32_T Kp_n;
  real32_T Ki_id;
  real32_T Ki_iq;
  real32_T Ki_n;
  boolean_T ElectricalID;
  boolean_T FrictionID;
  boolean_T TwoMassID;
  boolean_T FluxMapID;
  boolean_T OnlineID;
  boolean_T ACCEPT;
  real32_T sampleTimeISR;
  real32_T ratCurrent;
  real32_T ratSpeed;
  uz_3ph_dq_t i_dq_ref;
  real32_T n_ref;
} uz_PID_GlobalConfig_t;

#endif

#ifndef DEFINED_TYPEDEF_FOR_uz_PID_ControlFlags_t_
#define DEFINED_TYPEDEF_FOR_uz_PID_ControlFlags_t_

typedef struct {
  boolean_T startFrictionID;
  boolean_T startElectricalID;
  boolean_T startTwoMassID;
  boolean_T startFluxMapID;
  uint16_T transNr;
  boolean_T enableOnlineID;
  boolean_T finished_all_Offline_states;
} uz_PID_ControlFlags_t;

#endif

#ifndef DEFINED_TYPEDEF_FOR_uz_PID_Controller_Parameters_output_t_
#define DEFINED_TYPEDEF_FOR_uz_PID_Controller_Parameters_output_t_

typedef struct {
  uz_3ph_dq_t i_dq_ref;
  uint16_T activeState;
  real32_T n_ref_FOC;
  boolean_T enableFOC_speed;
  boolean_T enableFOC_current;
  boolean_T resetIntegrator;
  real32_T Kp_id_out;
  real32_T Kp_iq_out;
  real32_T Kp_n_out;
  real32_T Ki_id_out;
  real32_T Ki_iq_out;
  real32_T Ki_n_out;
} uz_PID_Controller_Parameters_output_t;

#endif

#ifndef DEFINED_TYPEDEF_FOR_uz_PID_FluxMapID_output_t_
#define DEFINED_TYPEDEF_FOR_uz_PID_FluxMapID_output_t_

/**
 * @brief output struct of FluxMapID
 * 
 */
typedef struct {
  boolean_T external_Measurement_Flag; /**< trigger to signal, when an external measurement equipment should measure */
  real32_T R_s; /**< identified online resistance in ohm */
  real32_T WindingTemp; /**< identified winding temperature of the stator */
} uz_PID_FluxMapID_output_t;

#endif

/* Block signals and states (default storage) for system '<Root>' */
typedef struct {
  real32_T R_s_array[50];              /* '<Root>/FluxMapID' */
  real32_T vd2_counter;                /* '<Root>/FluxMapID' */
  real32_T i_d_ref_AMM;                /* '<Root>/FluxMapID' */
  real32_T i_d_ref_AMM_loc;            /* '<Root>/FluxMapID' */
  real32_T i_q_ref_AMM;                /* '<Root>/FluxMapID' */
  real32_T i_q_ref_AMM_loc;            /* '<Root>/FluxMapID' */
  real32_T NumberOfIDpoints;           /* '<Root>/FluxMapID' */
  real32_T NumberOfPoints;             /* '<Root>/FluxMapID' */
  real32_T i_d_R_online;               /* '<Root>/FluxMapID' */
  real32_T id2_counter;                /* '<Root>/FluxMapID' */
  real32_T vd1_counter;                /* '<Root>/FluxMapID' */
  real32_T id1_counter;                /* '<Root>/FluxMapID' */
  real32_T IQstepsize_loc;             /* '<Root>/FluxMapID' */
  real32_T IDstepsize_loc;             /* '<Root>/FluxMapID' */
  uint32_T counter;                    /* '<Root>/FluxMapID' */
  uint32_T AMMj;                       /* '<Root>/FluxMapID' */
  uint32_T AMMn;                       /* '<Root>/FluxMapID' */
  uint32_T repetitionCounter;          /* '<Root>/FluxMapID' */
  uint32_T three_sec_transition_counter;/* '<Root>/FluxMapID' */
  uint32_T one_sec_transition_counter; /* '<Root>/FluxMapID' */
  uint32_T collection_transition_counter;/* '<Root>/FluxMapID' */
  uint8_T is_active_c16_FluxMapID;     /* '<Root>/FluxMapID' */
  uint8_T is_c16_FluxMapID;            /* '<Root>/FluxMapID' */
  uint8_T is_AMMstate;                 /* '<Root>/FluxMapID' */
} DW_FluxMapID_t;

/* External inputs (root inport signals with default storage) */
typedef struct {
  uz_PID_FluxMapIDConfig_t FluxMapIDConfig;/* '<Root>/FluxMapIDConfig' */
  uz_PID_ActualValues_t ActualValues;  /* '<Root>/ActualValues' */
  uz_PID_GlobalConfig_t GlobalConfig_out;/* '<Root>/GlobalConfig' */
  uz_PID_ControlFlags_t ControlFlags;  /* '<Root>/ControlFlags' */
} ExtU_FluxMapID_t;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  boolean_T finishedFluxMapID;         /* '<Root>/finishedFluxMapID' */
  boolean_T enteredFluxMapID;          /* '<Root>/enteredFluxMapID' */
  uz_PID_Controller_Parameters_output_t FluxMapID_FOC_output;/* '<Root>/FluxMapID_FOC_output' */
  uz_PID_FluxMapID_output_t FluxMapID_output;/* '<Root>/FluxMapID_output' */
} ExtY_FluxMapID_t;

/* Real-time Model Data Structure */
struct tag_RTM_FluxMapID_t {
  ExtU_FluxMapID_t *inputs;
  ExtY_FluxMapID_t *outputs;
  DW_FluxMapID_t *dwork;
};

/* Model entry point functions */
extern void FluxMapID_initialize(RT_MODEL_FluxMapID_t *const rtFluxMapID_M);
extern void FluxMapID_step(RT_MODEL_FluxMapID_t *const rtFluxMapID_M);

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('uz_ParameterID/FluxMapID')    - opens subsystem uz_ParameterID/FluxMapID
 * hilite_system('uz_ParameterID/FluxMapID/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'uz_ParameterID'
 * '<S1>'   : 'uz_ParameterID/FluxMapID'
 */

/*-
 * Requirements for '<Root>': FluxMapID
 */
#endif                                 /* RTW_HEADER_FluxMapID_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

#endif
