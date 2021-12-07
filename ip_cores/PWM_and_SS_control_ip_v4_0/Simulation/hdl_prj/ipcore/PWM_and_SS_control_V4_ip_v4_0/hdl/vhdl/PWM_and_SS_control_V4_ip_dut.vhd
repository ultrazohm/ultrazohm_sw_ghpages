-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\PWM_and_SS_control_V4_ip_dut.vhd
-- Created: 2021-09-29 14:48:15
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_and_SS_control_V4_ip_dut
-- Source Path: PWM_and_SS_control_V4_ip/PWM_and_SS_control_V4_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_and_SS_control_V4_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        PWM_en_AXI                        :   IN    std_logic;  -- ufix1
        Mode_AXI                          :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        Scal_f_carrier_AXI                :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
        Scal_T_carrier_AXI                :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
        PWM_min_pulse_width_AXI           :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        m_u1_norm                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        m_u2_norm                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        m_u3_norm                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        m_u1_norm_AXI                     :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        m_u2_norm_AXI                     :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        m_u3_norm_AXI                     :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        SS0_IN_External                   :   IN    std_logic;  -- ufix1
        SS1_IN_External                   :   IN    std_logic;  -- ufix1
        SS2_IN_External                   :   IN    std_logic;  -- ufix1
        SS3_IN_External                   :   IN    std_logic;  -- ufix1
        SS4_IN_External                   :   IN    std_logic;  -- ufix1
        SS5_IN_External                   :   IN    std_logic;  -- ufix1
        TriState_HB1_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        TriState_HB2_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        TriState_HB3_AXI                  :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        count_in                          :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        count_src_ext_AXI                 :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        SS0_OUT                           :   OUT   std_logic;  -- ufix1
        SS1_OUT                           :   OUT   std_logic;  -- ufix1
        SS2_OUT                           :   OUT   std_logic;  -- ufix1
        SS3_OUT                           :   OUT   std_logic;  -- ufix1
        SS4_OUT                           :   OUT   std_logic;  -- ufix1
        SS5_OUT                           :   OUT   std_logic;  -- ufix1
        PWM_en_rd_AXI                     :   OUT   std_logic;  -- ufix1
        PWM_f_carrier_kHz_rd_AXI          :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
        PWM_T_carrier_us_rd_AXI           :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
        PWM_min_pulse_width_rd_AXI        :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        PWM_enb_out                       :   OUT   std_logic;  -- ufix1
        Mode_rd_AXI                       :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        Triangular_Max                    :   OUT   std_logic;  -- ufix1
        Triangular_Min                    :   OUT   std_logic;  -- ufix1
        count_out                         :   OUT   std_logic_vector(19 DOWNTO 0);  -- ufix20
        dir_out                           :   OUT   std_logic  -- ufix1
        );
END PWM_and_SS_control_V4_ip_dut;


ARCHITECTURE rtl OF PWM_and_SS_control_V4_ip_dut IS

  -- Component Declarations
  COMPONENT PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          PWM_en_AXI                      :   IN    std_logic;  -- ufix1
          Mode_AXI                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          Scal_f_carrier_AXI              :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          Scal_T_carrier_AXI              :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          PWM_min_pulse_width_AXI         :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          m_u1_norm                       :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u2_norm                       :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u3_norm                       :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u1_norm_AXI                   :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u2_norm_AXI                   :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          m_u3_norm_AXI                   :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          SS0_IN_External                 :   IN    std_logic;  -- ufix1
          SS1_IN_External                 :   IN    std_logic;  -- ufix1
          SS2_IN_External                 :   IN    std_logic;  -- ufix1
          SS3_IN_External                 :   IN    std_logic;  -- ufix1
          SS4_IN_External                 :   IN    std_logic;  -- ufix1
          SS5_IN_External                 :   IN    std_logic;  -- ufix1
          TriState_HB1_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          TriState_HB2_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          TriState_HB3_AXI                :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          count_in                        :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
          count_src_ext_AXI               :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          SS0_OUT                         :   OUT   std_logic;  -- ufix1
          SS1_OUT                         :   OUT   std_logic;  -- ufix1
          SS2_OUT                         :   OUT   std_logic;  -- ufix1
          SS3_OUT                         :   OUT   std_logic;  -- ufix1
          SS4_OUT                         :   OUT   std_logic;  -- ufix1
          SS5_OUT                         :   OUT   std_logic;  -- ufix1
          PWM_en_rd_AXI                   :   OUT   std_logic;  -- ufix1
          PWM_f_carrier_kHz_rd_AXI        :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25_En26
          PWM_T_carrier_us_rd_AXI         :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          PWM_min_pulse_width_rd_AXI      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          PWM_enb_out                     :   OUT   std_logic;  -- ufix1
          Mode_rd_AXI                     :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          Triangular_Max                  :   OUT   std_logic;  -- ufix1
          Triangular_Min                  :   OUT   std_logic;  -- ufix1
          count_out                       :   OUT   std_logic_vector(19 DOWNTO 0);  -- ufix20
          dir_out                         :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control
    USE ENTITY work.PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL PWM_en_AXI_sig                   : std_logic;  -- ufix1
  SIGNAL SS0_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS1_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS2_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS3_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS4_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS5_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL count_src_ext_AXI_sig            : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL SS0_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS1_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS2_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS3_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS4_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS5_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL PWM_en_rd_AXI_sig                : std_logic;  -- ufix1
  SIGNAL PWM_f_carrier_kHz_rd_AXI_sig     : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL PWM_T_carrier_us_rd_AXI_sig      : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL PWM_min_pulse_width_rd_AXI_sig   : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PWM_enb_out_sig                  : std_logic;  -- ufix1
  SIGNAL Mode_rd_AXI_sig                  : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL Triangular_Max_sig               : std_logic;  -- ufix1
  SIGNAL Triangular_Min_sig               : std_logic;  -- ufix1
  SIGNAL count_out_sig                    : std_logic_vector(19 DOWNTO 0);  -- ufix20
  SIGNAL dir_out_sig                      : std_logic;  -- ufix1

BEGIN
  u_PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control : PWM_and_SS_control_V4_ip_src_PWM_and_Switching_Signal_Control
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              PWM_en_AXI => PWM_en_AXI_sig,  -- ufix1
              Mode_AXI => Mode_AXI,  -- ufix2
              Scal_f_carrier_AXI => Scal_f_carrier_AXI,  -- ufix25_En26
              Scal_T_carrier_AXI => Scal_T_carrier_AXI,  -- ufix25
              PWM_min_pulse_width_AXI => PWM_min_pulse_width_AXI,  -- sfix18_En16
              m_u1_norm => m_u1_norm,  -- sfix14_En12
              m_u2_norm => m_u2_norm,  -- sfix14_En12
              m_u3_norm => m_u3_norm,  -- sfix14_En12
              m_u1_norm_AXI => m_u1_norm_AXI,  -- sfix14_En12
              m_u2_norm_AXI => m_u2_norm_AXI,  -- sfix14_En12
              m_u3_norm_AXI => m_u3_norm_AXI,  -- sfix14_En12
              SS0_IN_External => SS0_IN_External_sig,  -- ufix1
              SS1_IN_External => SS1_IN_External_sig,  -- ufix1
              SS2_IN_External => SS2_IN_External_sig,  -- ufix1
              SS3_IN_External => SS3_IN_External_sig,  -- ufix1
              SS4_IN_External => SS4_IN_External_sig,  -- ufix1
              SS5_IN_External => SS5_IN_External_sig,  -- ufix1
              TriState_HB1_AXI => TriState_HB1_AXI,  -- ufix2
              TriState_HB2_AXI => TriState_HB2_AXI,  -- ufix2
              TriState_HB3_AXI => TriState_HB3_AXI,  -- ufix2
              count_in => count_in,  -- ufix20
              count_src_ext_AXI => count_src_ext_AXI_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              SS0_OUT => SS0_OUT_sig,  -- ufix1
              SS1_OUT => SS1_OUT_sig,  -- ufix1
              SS2_OUT => SS2_OUT_sig,  -- ufix1
              SS3_OUT => SS3_OUT_sig,  -- ufix1
              SS4_OUT => SS4_OUT_sig,  -- ufix1
              SS5_OUT => SS5_OUT_sig,  -- ufix1
              PWM_en_rd_AXI => PWM_en_rd_AXI_sig,  -- ufix1
              PWM_f_carrier_kHz_rd_AXI => PWM_f_carrier_kHz_rd_AXI_sig,  -- ufix25_En26
              PWM_T_carrier_us_rd_AXI => PWM_T_carrier_us_rd_AXI_sig,  -- ufix25
              PWM_min_pulse_width_rd_AXI => PWM_min_pulse_width_rd_AXI_sig,  -- sfix18_En16
              PWM_enb_out => PWM_enb_out_sig,  -- ufix1
              Mode_rd_AXI => Mode_rd_AXI_sig,  -- ufix2
              Triangular_Max => Triangular_Max_sig,  -- ufix1
              Triangular_Min => Triangular_Min_sig,  -- ufix1
              count_out => count_out_sig,  -- ufix20
              dir_out => dir_out_sig  -- ufix1
              );

  PWM_en_AXI_sig <= PWM_en_AXI;

  SS0_IN_External_sig <= SS0_IN_External;

  SS1_IN_External_sig <= SS1_IN_External;

  SS2_IN_External_sig <= SS2_IN_External;

  SS3_IN_External_sig <= SS3_IN_External;

  SS4_IN_External_sig <= SS4_IN_External;

  SS5_IN_External_sig <= SS5_IN_External;

  count_src_ext_AXI_sig <= count_src_ext_AXI;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  SS0_OUT <= SS0_OUT_sig;

  SS1_OUT <= SS1_OUT_sig;

  SS2_OUT <= SS2_OUT_sig;

  SS3_OUT <= SS3_OUT_sig;

  SS4_OUT <= SS4_OUT_sig;

  SS5_OUT <= SS5_OUT_sig;

  PWM_en_rd_AXI <= PWM_en_rd_AXI_sig;

  PWM_f_carrier_kHz_rd_AXI <= PWM_f_carrier_kHz_rd_AXI_sig;

  PWM_T_carrier_us_rd_AXI <= PWM_T_carrier_us_rd_AXI_sig;

  PWM_min_pulse_width_rd_AXI <= PWM_min_pulse_width_rd_AXI_sig;

  PWM_enb_out <= PWM_enb_out_sig;

  Mode_rd_AXI <= Mode_rd_AXI_sig;

  Triangular_Max <= Triangular_Max_sig;

  Triangular_Min <= Triangular_Min_sig;

  count_out <= count_out_sig;

  dir_out <= dir_out_sig;

END rtl;

