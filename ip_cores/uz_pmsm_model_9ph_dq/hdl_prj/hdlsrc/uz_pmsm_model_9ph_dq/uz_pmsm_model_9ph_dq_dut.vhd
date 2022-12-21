-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj123\hdlsrc\uz_pmsm_model_9ph_dq\uz_pmsm_model_9ph_dq_dut.vhd
-- Created: 2022-07-04 09:50:42
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_pmsm_model_9ph_dq_dut
-- Source Path: uz_pmsm_model_9ph_dq/uz_pmsm_model_9ph_dq_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_pmsm_model_9ph_dq_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        reset_integrators                 :   IN    std_logic;  -- ufix1
        use_axi_input                     :   IN    std_logic;  -- ufix1
        simulate_mechanical               :   IN    std_logic;  -- ufix1
        load_torque                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        omega_mech                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_1_J           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_mu            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_M_R0          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_1_L_d         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_1_L_q         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_R_1           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_polepair      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_psi_pm        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_x1          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_y1          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_x2          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_y2          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_x3          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_y3          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        physical_parameters_L_zero        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_0            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_1            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_2            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_3            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_4            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_5            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_6            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_7            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_axi_8            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_0                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_1                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_2                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_3                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_4                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_5                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_6                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_7                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        voltage_input_dq_8                :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        ce_out                            :   OUT   std_logic;  -- ufix1
        theta_el_out_axi                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        theta_el_out                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En14
        M_Mi_out_axi                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        omega_mech_out_axi                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_0             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_1             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_2             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_3             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_4             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_5             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_6             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_7             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_axi_8             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        currents_dq_out_0                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_1                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_2                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_3                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_4                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_5                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_6                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_7                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        currents_dq_out_8                 :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
        voltage_input_dq_out_axi_fb_0     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_1     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_2     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_3     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_4     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_5     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_6     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_7     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        voltage_input_dq_out_axi_fb_8     :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END uz_pmsm_model_9ph_dq_dut;


ARCHITECTURE rtl OF uz_pmsm_model_9ph_dq_dut IS

  -- Component Declarations
  COMPONENT uz_pmsm_model_9ph_dq_src_uz_pmsm_model_9ph_dq
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          reset_integrators               :   IN    std_logic;  -- ufix1
          use_axi_input                   :   IN    std_logic;  -- ufix1
          simulate_mechanical             :   IN    std_logic;  -- ufix1
          load_torque                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          omega_mech                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_1_J         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_mu          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_M_R0        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_1_L_d       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_1_L_q       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_R_1         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_polepair    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_psi_pm      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_x1        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_y1        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_x2        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_y2        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_x3        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_y3        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          physical_parameters_L_zero      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_0          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_1          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_2          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_3          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_4          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_5          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_6          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_7          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_axi_8          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_0              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_1              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_2              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_3              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_4              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_5              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_6              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_7              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          voltage_input_dq_8              :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
          ce_out                          :   OUT   std_logic;  -- ufix1
          theta_el_out_axi                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          theta_el_out                    :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En14
          M_Mi_out_axi                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          omega_mech_out_axi              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_0           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_1           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_2           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_3           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_4           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_5           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_6           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_7           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_axi_8           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          currents_dq_out_0               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_1               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_2               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_3               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_4               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_5               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_6               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_7               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          currents_dq_out_8               :   OUT   std_logic_vector(26 DOWNTO 0);  -- sfix27_En18
          voltage_input_dq_out_axi_fb_0   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_1   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_2   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_3   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_4   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_5   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_6   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_7   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          voltage_input_dq_out_axi_fb_8   :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_pmsm_model_9ph_dq_src_uz_pmsm_model_9ph_dq
    USE ENTITY work.uz_pmsm_model_9ph_dq_src_uz_pmsm_model_9ph_dq(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL theta_el_out_axi_sig             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL theta_el_out_sig                 : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL M_Mi_out_axi_sig                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL omega_mech_out_axi_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_0_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_1_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_2_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_3_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_4_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_5_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_6_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_7_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_axi_8_sig        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL currents_dq_out_0_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_1_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_2_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_3_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_4_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_5_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_6_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_7_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL currents_dq_out_8_sig            : std_logic_vector(26 DOWNTO 0);  -- ufix27
  SIGNAL voltage_input_dq_out_axi_fb_0_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_1_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_2_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_3_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_4_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_5_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_6_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_7_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL voltage_input_dq_out_axi_fb_8_sig : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_uz_pmsm_model_9ph_dq_src_uz_pmsm_model_9ph_dq : uz_pmsm_model_9ph_dq_src_uz_pmsm_model_9ph_dq
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              reset_integrators => reset_integrators,  -- ufix1
              use_axi_input => use_axi_input,  -- ufix1
              simulate_mechanical => simulate_mechanical,  -- ufix1
              load_torque => load_torque,  -- ufix32
              omega_mech => omega_mech,  -- ufix32
              physical_parameters_1_J => physical_parameters_1_J,  -- ufix32
              physical_parameters_mu => physical_parameters_mu,  -- ufix32
              physical_parameters_M_R0 => physical_parameters_M_R0,  -- ufix32
              physical_parameters_1_L_d => physical_parameters_1_L_d,  -- ufix32
              physical_parameters_1_L_q => physical_parameters_1_L_q,  -- ufix32
              physical_parameters_R_1 => physical_parameters_R_1,  -- ufix32
              physical_parameters_polepair => physical_parameters_polepair,  -- ufix32
              physical_parameters_psi_pm => physical_parameters_psi_pm,  -- ufix32
              physical_parameters_L_x1 => physical_parameters_L_x1,  -- ufix32
              physical_parameters_L_y1 => physical_parameters_L_y1,  -- ufix32
              physical_parameters_L_x2 => physical_parameters_L_x2,  -- ufix32
              physical_parameters_L_y2 => physical_parameters_L_y2,  -- ufix32
              physical_parameters_L_x3 => physical_parameters_L_x3,  -- ufix32
              physical_parameters_L_y3 => physical_parameters_L_y3,  -- ufix32
              physical_parameters_L_zero => physical_parameters_L_zero,  -- ufix32
              voltage_input_dq_axi_0 => voltage_input_dq_axi_0,  -- ufix32
              voltage_input_dq_axi_1 => voltage_input_dq_axi_1,  -- ufix32
              voltage_input_dq_axi_2 => voltage_input_dq_axi_2,  -- ufix32
              voltage_input_dq_axi_3 => voltage_input_dq_axi_3,  -- ufix32
              voltage_input_dq_axi_4 => voltage_input_dq_axi_4,  -- ufix32
              voltage_input_dq_axi_5 => voltage_input_dq_axi_5,  -- ufix32
              voltage_input_dq_axi_6 => voltage_input_dq_axi_6,  -- ufix32
              voltage_input_dq_axi_7 => voltage_input_dq_axi_7,  -- ufix32
              voltage_input_dq_axi_8 => voltage_input_dq_axi_8,  -- ufix32
              voltage_input_dq_0 => voltage_input_dq_0,  -- sfix27_En16
              voltage_input_dq_1 => voltage_input_dq_1,  -- sfix27_En16
              voltage_input_dq_2 => voltage_input_dq_2,  -- sfix27_En16
              voltage_input_dq_3 => voltage_input_dq_3,  -- sfix27_En16
              voltage_input_dq_4 => voltage_input_dq_4,  -- sfix27_En16
              voltage_input_dq_5 => voltage_input_dq_5,  -- sfix27_En16
              voltage_input_dq_6 => voltage_input_dq_6,  -- sfix27_En16
              voltage_input_dq_7 => voltage_input_dq_7,  -- sfix27_En16
              voltage_input_dq_8 => voltage_input_dq_8,  -- sfix27_En16
              ce_out => ce_out_sig,  -- ufix1
              theta_el_out_axi => theta_el_out_axi_sig,  -- ufix32
              theta_el_out => theta_el_out_sig,  -- sfix18_En14
              M_Mi_out_axi => M_Mi_out_axi_sig,  -- ufix32
              omega_mech_out_axi => omega_mech_out_axi_sig,  -- ufix32
              currents_dq_out_axi_0 => currents_dq_out_axi_0_sig,  -- ufix32
              currents_dq_out_axi_1 => currents_dq_out_axi_1_sig,  -- ufix32
              currents_dq_out_axi_2 => currents_dq_out_axi_2_sig,  -- ufix32
              currents_dq_out_axi_3 => currents_dq_out_axi_3_sig,  -- ufix32
              currents_dq_out_axi_4 => currents_dq_out_axi_4_sig,  -- ufix32
              currents_dq_out_axi_5 => currents_dq_out_axi_5_sig,  -- ufix32
              currents_dq_out_axi_6 => currents_dq_out_axi_6_sig,  -- ufix32
              currents_dq_out_axi_7 => currents_dq_out_axi_7_sig,  -- ufix32
              currents_dq_out_axi_8 => currents_dq_out_axi_8_sig,  -- ufix32
              currents_dq_out_0 => currents_dq_out_0_sig,  -- sfix27_En18
              currents_dq_out_1 => currents_dq_out_1_sig,  -- sfix27_En18
              currents_dq_out_2 => currents_dq_out_2_sig,  -- sfix27_En18
              currents_dq_out_3 => currents_dq_out_3_sig,  -- sfix27_En18
              currents_dq_out_4 => currents_dq_out_4_sig,  -- sfix27_En18
              currents_dq_out_5 => currents_dq_out_5_sig,  -- sfix27_En18
              currents_dq_out_6 => currents_dq_out_6_sig,  -- sfix27_En18
              currents_dq_out_7 => currents_dq_out_7_sig,  -- sfix27_En18
              currents_dq_out_8 => currents_dq_out_8_sig,  -- sfix27_En18
              voltage_input_dq_out_axi_fb_0 => voltage_input_dq_out_axi_fb_0_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_1 => voltage_input_dq_out_axi_fb_1_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_2 => voltage_input_dq_out_axi_fb_2_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_3 => voltage_input_dq_out_axi_fb_3_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_4 => voltage_input_dq_out_axi_fb_4_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_5 => voltage_input_dq_out_axi_fb_5_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_6 => voltage_input_dq_out_axi_fb_6_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_7 => voltage_input_dq_out_axi_fb_7_sig,  -- ufix32
              voltage_input_dq_out_axi_fb_8 => voltage_input_dq_out_axi_fb_8_sig  -- ufix32
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  theta_el_out_axi <= theta_el_out_axi_sig;

  theta_el_out <= theta_el_out_sig;

  M_Mi_out_axi <= M_Mi_out_axi_sig;

  omega_mech_out_axi <= omega_mech_out_axi_sig;

  currents_dq_out_axi_0 <= currents_dq_out_axi_0_sig;

  currents_dq_out_axi_1 <= currents_dq_out_axi_1_sig;

  currents_dq_out_axi_2 <= currents_dq_out_axi_2_sig;

  currents_dq_out_axi_3 <= currents_dq_out_axi_3_sig;

  currents_dq_out_axi_4 <= currents_dq_out_axi_4_sig;

  currents_dq_out_axi_5 <= currents_dq_out_axi_5_sig;

  currents_dq_out_axi_6 <= currents_dq_out_axi_6_sig;

  currents_dq_out_axi_7 <= currents_dq_out_axi_7_sig;

  currents_dq_out_axi_8 <= currents_dq_out_axi_8_sig;

  currents_dq_out_0 <= currents_dq_out_0_sig;

  currents_dq_out_1 <= currents_dq_out_1_sig;

  currents_dq_out_2 <= currents_dq_out_2_sig;

  currents_dq_out_3 <= currents_dq_out_3_sig;

  currents_dq_out_4 <= currents_dq_out_4_sig;

  currents_dq_out_5 <= currents_dq_out_5_sig;

  currents_dq_out_6 <= currents_dq_out_6_sig;

  currents_dq_out_7 <= currents_dq_out_7_sig;

  currents_dq_out_8 <= currents_dq_out_8_sig;

  voltage_input_dq_out_axi_fb_0 <= voltage_input_dq_out_axi_fb_0_sig;

  voltage_input_dq_out_axi_fb_1 <= voltage_input_dq_out_axi_fb_1_sig;

  voltage_input_dq_out_axi_fb_2 <= voltage_input_dq_out_axi_fb_2_sig;

  voltage_input_dq_out_axi_fb_3 <= voltage_input_dq_out_axi_fb_3_sig;

  voltage_input_dq_out_axi_fb_4 <= voltage_input_dq_out_axi_fb_4_sig;

  voltage_input_dq_out_axi_fb_5 <= voltage_input_dq_out_axi_fb_5_sig;

  voltage_input_dq_out_axi_fb_6 <= voltage_input_dq_out_axi_fb_6_sig;

  voltage_input_dq_out_axi_fb_7 <= voltage_input_dq_out_axi_fb_7_sig;

  voltage_input_dq_out_axi_fb_8 <= voltage_input_dq_out_axi_fb_8_sig;

END rtl;

