/*
 * File Name:         hdl_prj/ipcore/uz_pmsm_model_v1_0/include/uz_pmsm_model_addr.h
 * Description:       C Header File
 * Created:           2021-06-22 09:44:05
*/

#ifndef UZ_PMSM_MODEL_H_
#define UZ_PMSM_MODEL_H_

#define  IPCore_Reset_uz_pmsm_model               0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_uz_pmsm_model              0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_uz_pmsm_model           0x8  //contains unique IP timestamp (yymmddHHMM): 2106220944
#define  u_d_Data_uz_pmsm_model                   0x100  //data register for Inport u_d
#define  u_q_Data_uz_pmsm_model                   0x104  //data register for Inport u_q
#define  mu_Data_uz_pmsm_model                    0x108  //data register for Inport mu
#define  i_d_Data_uz_pmsm_model                   0x10C  //data register for Outport i_d
#define  M_n0_Data_uz_pmsm_model                  0x110  //data register for Inport M_n0
#define  reset_integrators_Data_uz_pmsm_model     0x114  //data register for Inport reset_integrators
#define  R1_Data_uz_pmsm_model                    0x118  //data register for Inport R1
#define  i_q_Data_uz_pmsm_model                   0x11C  //data register for Outport i_q
#define  polepairs_Data_uz_pmsm_model             0x120  //data register for Inport polepairs
#define  psi_pm_Data_uz_pmsm_model                0x124  //data register for Inport psi_pm
#define  recirprocal_L_d_Data_uz_pmsm_model       0x128  //data register for Inport recirprocal_L_d
#define  reciprocal_L_q_Data_uz_pmsm_model        0x12C  //data register for Inport reciprocal_L_q
#define  omega_mech_Data_uz_pmsm_model            0x130  //data register for Outport omega_mech
#define  in_omega_mech_Data_uz_pmsm_model         0x134  //data register for Inport in_omega_mech
#define  simulate_mechanical_Data_uz_pmsm_model   0x138  //data register for Inport simulate_mechanical
#define  load_torque_Data_uz_pmsm_model           0x13C  //data register for Inport load_torque
#define  torque_Data_uz_pmsm_model                0x144  //data register for Outport torque
#define  reciprocal_J_Data_uz_pmsm_model          0x150  //data register for Inport reciprocal_J

#endif /* UZ_PMSM_MODEL_H_ */
