-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\uz_d_inverter_adapter\uz_d_inverter_adapter_dut.vhd
-- Created: 2022-05-31 17:55:12
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_d_inverter_adapter_dut
-- Source Path: uz_d_inverter_adapter/uz_d_inverter_adapter_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_d_inverter_adapter_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        Temp                              :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        FAULT                             :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        OC                                :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        I_DIAG                            :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI_PWM_Enable                    :   IN    std_logic;  -- ufix1
        AXI_en_in                         :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        AXI_Temp_1_period                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_1_hightime               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_1_lowtime                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_1_dutycyc                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        AXI_Temp_2_period                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_2_hightime               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_2_lowtime                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_2_dutycyc                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        AXI_Temp_3_period                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_3_hightime               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_3_lowtime                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_3_dutycyc                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        AXI_Temp_4_period                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_4_hightime               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_4_lowtime                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_4_dutycyc                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        AXI_Temp_5_period                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_5_hightime               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_5_lowtime                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_5_dutycyc                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        AXI_Temp_6_period                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_6_hightime               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_6_lowtime                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Temp_6_dutycyc                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
        AXI_FAULT                         :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
        AXI_OC                            :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
        AXI_I_DIAG                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        PWM_EN                            :   OUT   std_logic  -- ufix1
        );
END uz_d_inverter_adapter_dut;


ARCHITECTURE rtl OF uz_d_inverter_adapter_dut IS

  -- Component Declarations
  COMPONENT uz_d_inverter_adapter_src_uz_d_inverter_adapter
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          Temp                            :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          FAULT                           :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          OC                              :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          I_DIAG                          :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI_PWM_Enable                  :   IN    std_logic;  -- ufix1
          AXI_en_in                       :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          AXI_Temp_1_period               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_1_hightime             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_1_lowtime              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_1_dutycyc              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
          AXI_Temp_2_period               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_2_hightime             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_2_lowtime              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_2_dutycyc              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
          AXI_Temp_3_period               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_3_hightime             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_3_lowtime              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_3_dutycyc              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
          AXI_Temp_4_period               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_4_hightime             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_4_lowtime              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_4_dutycyc              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
          AXI_Temp_5_period               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_5_hightime             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_5_lowtime              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_5_dutycyc              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
          AXI_Temp_6_period               :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_6_hightime             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_6_lowtime              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Temp_6_dutycyc              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En31
          AXI_FAULT                       :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
          AXI_OC                          :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
          AXI_I_DIAG                      :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          PWM_EN                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_d_inverter_adapter_src_uz_d_inverter_adapter
    USE ENTITY work.uz_d_inverter_adapter_src_uz_d_inverter_adapter(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL AXI_PWM_Enable_sig               : std_logic;  -- ufix1
  SIGNAL AXI_en_in_sig                    : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL AXI_Temp_1_period_sig            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_1_hightime_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_1_lowtime_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_1_dutycyc_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_2_period_sig            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_2_hightime_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_2_lowtime_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_2_dutycyc_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_3_period_sig            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_3_hightime_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_3_lowtime_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_3_dutycyc_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_4_period_sig            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_4_hightime_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_4_lowtime_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_4_dutycyc_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_5_period_sig            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_5_hightime_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_5_lowtime_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_5_dutycyc_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_6_period_sig            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_6_hightime_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_6_lowtime_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Temp_6_dutycyc_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_FAULT_sig                    : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL AXI_OC_sig                       : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL AXI_I_DIAG_sig                   : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL PWM_EN_sig                       : std_logic;  -- ufix1

BEGIN
  u_uz_d_inverter_adapter_src_uz_d_inverter_adapter : uz_d_inverter_adapter_src_uz_d_inverter_adapter
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              Temp => Temp,  -- ufix6
              FAULT => FAULT,  -- ufix6
              OC => OC,  -- ufix6
              I_DIAG => I_DIAG,  -- ufix4
              AXI_PWM_Enable => AXI_PWM_Enable_sig,  -- ufix1
              AXI_en_in => AXI_en_in_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              AXI_Temp_1_period => AXI_Temp_1_period_sig,  -- ufix32
              AXI_Temp_1_hightime => AXI_Temp_1_hightime_sig,  -- ufix32
              AXI_Temp_1_lowtime => AXI_Temp_1_lowtime_sig,  -- ufix32
              AXI_Temp_1_dutycyc => AXI_Temp_1_dutycyc_sig,  -- ufix32_En31
              AXI_Temp_2_period => AXI_Temp_2_period_sig,  -- ufix32
              AXI_Temp_2_hightime => AXI_Temp_2_hightime_sig,  -- ufix32
              AXI_Temp_2_lowtime => AXI_Temp_2_lowtime_sig,  -- ufix32
              AXI_Temp_2_dutycyc => AXI_Temp_2_dutycyc_sig,  -- ufix32_En31
              AXI_Temp_3_period => AXI_Temp_3_period_sig,  -- ufix32
              AXI_Temp_3_hightime => AXI_Temp_3_hightime_sig,  -- ufix32
              AXI_Temp_3_lowtime => AXI_Temp_3_lowtime_sig,  -- ufix32
              AXI_Temp_3_dutycyc => AXI_Temp_3_dutycyc_sig,  -- ufix32_En31
              AXI_Temp_4_period => AXI_Temp_4_period_sig,  -- ufix32
              AXI_Temp_4_hightime => AXI_Temp_4_hightime_sig,  -- ufix32
              AXI_Temp_4_lowtime => AXI_Temp_4_lowtime_sig,  -- ufix32
              AXI_Temp_4_dutycyc => AXI_Temp_4_dutycyc_sig,  -- ufix32_En31
              AXI_Temp_5_period => AXI_Temp_5_period_sig,  -- ufix32
              AXI_Temp_5_hightime => AXI_Temp_5_hightime_sig,  -- ufix32
              AXI_Temp_5_lowtime => AXI_Temp_5_lowtime_sig,  -- ufix32
              AXI_Temp_5_dutycyc => AXI_Temp_5_dutycyc_sig,  -- ufix32_En31
              AXI_Temp_6_period => AXI_Temp_6_period_sig,  -- ufix32
              AXI_Temp_6_hightime => AXI_Temp_6_hightime_sig,  -- ufix32
              AXI_Temp_6_lowtime => AXI_Temp_6_lowtime_sig,  -- ufix32
              AXI_Temp_6_dutycyc => AXI_Temp_6_dutycyc_sig,  -- ufix32_En31
              AXI_FAULT => AXI_FAULT_sig,  -- ufix6
              AXI_OC => AXI_OC_sig,  -- ufix6
              AXI_I_DIAG => AXI_I_DIAG_sig,  -- ufix4
              PWM_EN => PWM_EN_sig  -- ufix1
              );

  AXI_PWM_Enable_sig <= AXI_PWM_Enable;

  AXI_en_in_sig <= AXI_en_in;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  AXI_Temp_1_period <= AXI_Temp_1_period_sig;

  AXI_Temp_1_hightime <= AXI_Temp_1_hightime_sig;

  AXI_Temp_1_lowtime <= AXI_Temp_1_lowtime_sig;

  AXI_Temp_1_dutycyc <= AXI_Temp_1_dutycyc_sig;

  AXI_Temp_2_period <= AXI_Temp_2_period_sig;

  AXI_Temp_2_hightime <= AXI_Temp_2_hightime_sig;

  AXI_Temp_2_lowtime <= AXI_Temp_2_lowtime_sig;

  AXI_Temp_2_dutycyc <= AXI_Temp_2_dutycyc_sig;

  AXI_Temp_3_period <= AXI_Temp_3_period_sig;

  AXI_Temp_3_hightime <= AXI_Temp_3_hightime_sig;

  AXI_Temp_3_lowtime <= AXI_Temp_3_lowtime_sig;

  AXI_Temp_3_dutycyc <= AXI_Temp_3_dutycyc_sig;

  AXI_Temp_4_period <= AXI_Temp_4_period_sig;

  AXI_Temp_4_hightime <= AXI_Temp_4_hightime_sig;

  AXI_Temp_4_lowtime <= AXI_Temp_4_lowtime_sig;

  AXI_Temp_4_dutycyc <= AXI_Temp_4_dutycyc_sig;

  AXI_Temp_5_period <= AXI_Temp_5_period_sig;

  AXI_Temp_5_hightime <= AXI_Temp_5_hightime_sig;

  AXI_Temp_5_lowtime <= AXI_Temp_5_lowtime_sig;

  AXI_Temp_5_dutycyc <= AXI_Temp_5_dutycyc_sig;

  AXI_Temp_6_period <= AXI_Temp_6_period_sig;

  AXI_Temp_6_hightime <= AXI_Temp_6_hightime_sig;

  AXI_Temp_6_lowtime <= AXI_Temp_6_lowtime_sig;

  AXI_Temp_6_dutycyc <= AXI_Temp_6_dutycyc_sig;

  AXI_FAULT <= AXI_FAULT_sig;

  AXI_OC <= AXI_OC_sig;

  AXI_I_DIAG <= AXI_I_DIAG_sig;

  PWM_EN <= PWM_EN_sig;

END rtl;
