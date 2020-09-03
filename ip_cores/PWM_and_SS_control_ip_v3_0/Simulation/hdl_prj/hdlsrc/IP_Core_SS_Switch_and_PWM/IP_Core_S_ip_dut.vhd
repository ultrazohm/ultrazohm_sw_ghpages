-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\IP_Core_SS_Switch_and_PWM\IP_Core_S_ip_dut.vhd
-- Created: 2018-10-01 12:51:05
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IP_Core_S_ip_dut
-- Source Path: IP_Core_S_ip/IP_Core_S_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IP_Core_S_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        PWM_en_AXI                        :   IN    std_logic;  -- ufix1
        Mode_AXI                          :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        PWM_f_carrier_kHz_AXI             :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        PWM_min_pulse_wiidth_AXI          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
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
        ce_out                            :   OUT   std_logic;  -- ufix1
        SS0_OUT                           :   OUT   std_logic;  -- ufix1
        SS1_OUT                           :   OUT   std_logic;  -- ufix1
        SS2_OUT                           :   OUT   std_logic;  -- ufix1
        SS3_OUT                           :   OUT   std_logic;  -- ufix1
        SS4_OUT                           :   OUT   std_logic;  -- ufix1
        SS5_OUT                           :   OUT   std_logic;  -- ufix1
        PWM_en_rd_AXI                     :   OUT   std_logic;  -- ufix1
        PWM_f_carrier_kHz_rd_AXI          :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        PWM_min_pulse_width_rd_AXI        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        PWM_enb_out                       :   OUT   std_logic;  -- ufix1
        Mode_rd_AXI                       :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END IP_Core_S_ip_dut;


ARCHITECTURE rtl OF IP_Core_S_ip_dut IS

  -- Component Declarations
  COMPONENT IP_Core_S_ip_src_PWM_and_Switching_Signal_Control
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          PWM_en_AXI                      :   IN    std_logic;  -- ufix1
          Mode_AXI                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          PWM_f_carrier_kHz_AXI           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          PWM_min_pulse_wiidth_AXI        :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
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
          ce_out                          :   OUT   std_logic;  -- ufix1
          SS0_OUT                         :   OUT   std_logic;  -- ufix1
          SS1_OUT                         :   OUT   std_logic;  -- ufix1
          SS2_OUT                         :   OUT   std_logic;  -- ufix1
          SS3_OUT                         :   OUT   std_logic;  -- ufix1
          SS4_OUT                         :   OUT   std_logic;  -- ufix1
          SS5_OUT                         :   OUT   std_logic;  -- ufix1
          PWM_en_rd_AXI                   :   OUT   std_logic;  -- ufix1
          PWM_f_carrier_kHz_rd_AXI        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          PWM_min_pulse_width_rd_AXI      :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          PWM_enb_out                     :   OUT   std_logic;  -- ufix1
          Mode_rd_AXI                     :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IP_Core_S_ip_src_PWM_and_Switching_Signal_Control
    USE ENTITY work.IP_Core_S_ip_src_PWM_and_Switching_Signal_Control(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL PWM_en_AXI_sig                   : std_logic;  -- ufix1
  SIGNAL SS0_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS1_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS2_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS3_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS4_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL SS5_IN_External_sig              : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL SS0_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS1_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS2_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS3_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS4_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL SS5_OUT_sig                      : std_logic;  -- ufix1
  SIGNAL PWM_en_rd_AXI_sig                : std_logic;  -- ufix1
  SIGNAL PWM_f_carrier_kHz_rd_AXI_sig     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL PWM_min_pulse_width_rd_AXI_sig   : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL PWM_enb_out_sig                  : std_logic;  -- ufix1
  SIGNAL Mode_rd_AXI_sig                  : std_logic_vector(1 DOWNTO 0);  -- ufix2

BEGIN
  u_IP_Core_S_ip_src_PWM_and_Switching_Signal_Control : IP_Core_S_ip_src_PWM_and_Switching_Signal_Control
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              PWM_en_AXI => PWM_en_AXI_sig,  -- ufix1
              Mode_AXI => Mode_AXI,  -- ufix2
              PWM_f_carrier_kHz_AXI => PWM_f_carrier_kHz_AXI,  -- ufix8
              PWM_min_pulse_wiidth_AXI => PWM_min_pulse_wiidth_AXI,  -- ufix8
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
              ce_out => ce_out_sig,  -- ufix1
              SS0_OUT => SS0_OUT_sig,  -- ufix1
              SS1_OUT => SS1_OUT_sig,  -- ufix1
              SS2_OUT => SS2_OUT_sig,  -- ufix1
              SS3_OUT => SS3_OUT_sig,  -- ufix1
              SS4_OUT => SS4_OUT_sig,  -- ufix1
              SS5_OUT => SS5_OUT_sig,  -- ufix1
              PWM_en_rd_AXI => PWM_en_rd_AXI_sig,  -- ufix1
              PWM_f_carrier_kHz_rd_AXI => PWM_f_carrier_kHz_rd_AXI_sig,  -- ufix8
              PWM_min_pulse_width_rd_AXI => PWM_min_pulse_width_rd_AXI_sig,  -- ufix8
              PWM_enb_out => PWM_enb_out_sig,  -- ufix1
              Mode_rd_AXI => Mode_rd_AXI_sig  -- ufix2
              );

  PWM_en_AXI_sig <= PWM_en_AXI;

  SS0_IN_External_sig <= SS0_IN_External;

  SS1_IN_External_sig <= SS1_IN_External;

  SS2_IN_External_sig <= SS2_IN_External;

  SS3_IN_External_sig <= SS3_IN_External;

  SS4_IN_External_sig <= SS4_IN_External;

  SS5_IN_External_sig <= SS5_IN_External;

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

  PWM_min_pulse_width_rd_AXI <= PWM_min_pulse_width_rd_AXI_sig;

  PWM_enb_out <= PWM_enb_out_sig;

  Mode_rd_AXI <= Mode_rd_AXI_sig;

END rtl;

