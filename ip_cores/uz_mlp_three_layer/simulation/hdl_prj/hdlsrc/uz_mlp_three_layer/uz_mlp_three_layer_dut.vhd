-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_dut.vhd
-- Created: 2021-03-17 16:47:18
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_dut
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        enable_nn                         :   IN    std_logic;  -- ufix1
        axi_enable_nn                     :   IN    std_logic;  -- ufix1
        x1                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x2                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x3                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x4                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x5                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x6                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x7                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x8                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x9                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x10                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x11                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x12                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x13                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x14                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x15                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        x16                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_bias                          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_weight                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_bias_addr                     :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_weight_addr                   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_wrEnBias                      :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        axi_wrEnWeights                   :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        axi_layerNr                       :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        use_axi_input                     :   IN    std_logic;  -- ufix1
        axi_x_input_0                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_1                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_2                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_3                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_4                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_5                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_6                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_7                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_8                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_9                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_10                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_11                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_12                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_13                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_14                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_x_input_15                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_number_of_inputs              :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_output_number_configuration   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        disable_pl_trigger                :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        finished                          :   OUT   std_logic;  -- ufix1
        out_rsvd                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out2                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out4                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out5                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out6                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        out7                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        biasData                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        biasWriteAddr                     :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        biasWriteEnable                   :   OUT   std_logic;  -- ufix1
        valid_output                      :   OUT   std_logic;  -- ufix1
        axi_nn_output_0                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_1                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_2                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_3                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_4                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_5                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_6                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_7                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_valid_output                  :   OUT   std_logic  -- ufix1
        );
END uz_mlp_three_layer_dut;


ARCHITECTURE rtl OF uz_mlp_three_layer_dut IS

  -- Component Declarations
  COMPONENT uz_mlp_three_layer_src_uz_mlp_three_layer
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          enable_nn                       :   IN    std_logic;  -- ufix1
          axi_enable_nn                   :   IN    std_logic;  -- ufix1
          x1                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x2                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x3                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x4                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x5                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x6                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x7                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x8                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x9                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x10                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x11                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x12                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x13                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x14                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x15                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          x16                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_bias                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_weight                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_bias_addr                   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_weight_addr                 :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_wrEnBias                    :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          axi_wrEnWeights                 :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          axi_layerNr                     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          use_axi_input                   :   IN    std_logic;  -- ufix1
          axi_x_input_0                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_1                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_2                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_3                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_4                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_5                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_6                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_7                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_8                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_9                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_10                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_11                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_12                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_13                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_14                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_x_input_15                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_number_of_inputs            :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_output_number_configuration :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          disable_pl_trigger              :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          finished                        :   OUT   std_logic;  -- ufix1
          out_rsvd                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out1                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out2                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out3                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out4                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out5                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out6                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out7                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasData                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasWriteAddr                   :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          biasWriteEnable                 :   OUT   std_logic;  -- ufix1
          valid_output                    :   OUT   std_logic;  -- ufix1
          axi_nn_output_0                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_1                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_2                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_3                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_4                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_5                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_6                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_nn_output_7                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_valid_output                :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_mlp_three_layer_src_uz_mlp_three_layer
    USE ENTITY work.uz_mlp_three_layer_src_uz_mlp_three_layer(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL enable_nn_sig                    : std_logic;  -- ufix1
  SIGNAL axi_enable_nn_sig                : std_logic;  -- ufix1
  SIGNAL use_axi_input_sig                : std_logic;  -- ufix1
  SIGNAL disable_pl_trigger_sig           : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL finished_sig                     : std_logic;  -- ufix1
  SIGNAL out_rsvd_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out1_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out2_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out3_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out4_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out5_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out6_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out7_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL biasData_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL biasWriteAddr_sig                : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL biasWriteEnable_sig              : std_logic;  -- ufix1
  SIGNAL valid_output_sig                 : std_logic;  -- ufix1
  SIGNAL axi_nn_output_0_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_1_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_2_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_3_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_4_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_5_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_6_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_nn_output_7_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_valid_output_sig             : std_logic;  -- ufix1

BEGIN
  u_uz_mlp_three_layer_src_uz_mlp_three_layer : uz_mlp_three_layer_src_uz_mlp_three_layer
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              enable_nn => enable_nn_sig,  -- ufix1
              axi_enable_nn => axi_enable_nn_sig,  -- ufix1
              x1 => x1,  -- sfix32_En14
              x2 => x2,  -- sfix32_En14
              x3 => x3,  -- sfix32_En14
              x4 => x4,  -- sfix32_En14
              x5 => x5,  -- sfix32_En14
              x6 => x6,  -- sfix32_En14
              x7 => x7,  -- sfix32_En14
              x8 => x8,  -- sfix32_En14
              x9 => x9,  -- sfix32_En14
              x10 => x10,  -- sfix32_En14
              x11 => x11,  -- sfix32_En14
              x12 => x12,  -- sfix32_En14
              x13 => x13,  -- sfix32_En14
              x14 => x14,  -- sfix32_En14
              x15 => x15,  -- sfix32_En14
              x16 => x16,  -- sfix32_En14
              axi_bias => axi_bias,  -- sfix32_En14
              axi_weight => axi_weight,  -- sfix32_En14
              axi_bias_addr => axi_bias_addr,  -- ufix10
              axi_weight_addr => axi_weight_addr,  -- ufix10
              axi_wrEnBias => axi_wrEnBias,  -- ufix8
              axi_wrEnWeights => axi_wrEnWeights,  -- ufix8
              axi_layerNr => axi_layerNr,  -- ufix8
              use_axi_input => use_axi_input_sig,  -- ufix1
              axi_x_input_0 => axi_x_input_0,  -- sfix32_En14
              axi_x_input_1 => axi_x_input_1,  -- sfix32_En14
              axi_x_input_2 => axi_x_input_2,  -- sfix32_En14
              axi_x_input_3 => axi_x_input_3,  -- sfix32_En14
              axi_x_input_4 => axi_x_input_4,  -- sfix32_En14
              axi_x_input_5 => axi_x_input_5,  -- sfix32_En14
              axi_x_input_6 => axi_x_input_6,  -- sfix32_En14
              axi_x_input_7 => axi_x_input_7,  -- sfix32_En14
              axi_x_input_8 => axi_x_input_8,  -- sfix32_En14
              axi_x_input_9 => axi_x_input_9,  -- sfix32_En14
              axi_x_input_10 => axi_x_input_10,  -- sfix32_En14
              axi_x_input_11 => axi_x_input_11,  -- sfix32_En14
              axi_x_input_12 => axi_x_input_12,  -- sfix32_En14
              axi_x_input_13 => axi_x_input_13,  -- sfix32_En14
              axi_x_input_14 => axi_x_input_14,  -- sfix32_En14
              axi_x_input_15 => axi_x_input_15,  -- sfix32_En14
              axi_number_of_inputs => axi_number_of_inputs,  -- ufix10
              axi_output_number_configuration => axi_output_number_configuration,  -- ufix10
              disable_pl_trigger => disable_pl_trigger_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              finished => finished_sig,  -- ufix1
              out_rsvd => out_rsvd_sig,  -- sfix32_En14
              out1 => out1_sig,  -- sfix32_En14
              out2 => out2_sig,  -- sfix32_En14
              out3 => out3_sig,  -- sfix32_En14
              out4 => out4_sig,  -- sfix32_En14
              out5 => out5_sig,  -- sfix32_En14
              out6 => out6_sig,  -- sfix32_En14
              out7 => out7_sig,  -- sfix32_En14
              biasData => biasData_sig,  -- sfix32_En14
              biasWriteAddr => biasWriteAddr_sig,  -- ufix10
              biasWriteEnable => biasWriteEnable_sig,  -- ufix1
              valid_output => valid_output_sig,  -- ufix1
              axi_nn_output_0 => axi_nn_output_0_sig,  -- sfix32_En14
              axi_nn_output_1 => axi_nn_output_1_sig,  -- sfix32_En14
              axi_nn_output_2 => axi_nn_output_2_sig,  -- sfix32_En14
              axi_nn_output_3 => axi_nn_output_3_sig,  -- sfix32_En14
              axi_nn_output_4 => axi_nn_output_4_sig,  -- sfix32_En14
              axi_nn_output_5 => axi_nn_output_5_sig,  -- sfix32_En14
              axi_nn_output_6 => axi_nn_output_6_sig,  -- sfix32_En14
              axi_nn_output_7 => axi_nn_output_7_sig,  -- sfix32_En14
              axi_valid_output => axi_valid_output_sig  -- ufix1
              );

  enable_nn_sig <= enable_nn;

  axi_enable_nn_sig <= axi_enable_nn;

  use_axi_input_sig <= use_axi_input;

  disable_pl_trigger_sig <= disable_pl_trigger;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  finished <= finished_sig;

  out_rsvd <= out_rsvd_sig;

  out1 <= out1_sig;

  out2 <= out2_sig;

  out3 <= out3_sig;

  out4 <= out4_sig;

  out5 <= out5_sig;

  out6 <= out6_sig;

  out7 <= out7_sig;

  biasData <= biasData_sig;

  biasWriteAddr <= biasWriteAddr_sig;

  biasWriteEnable <= biasWriteEnable_sig;

  valid_output <= valid_output_sig;

  axi_nn_output_0 <= axi_nn_output_0_sig;

  axi_nn_output_1 <= axi_nn_output_1_sig;

  axi_nn_output_2 <= axi_nn_output_2_sig;

  axi_nn_output_3 <= axi_nn_output_3_sig;

  axi_nn_output_4 <= axi_nn_output_4_sig;

  axi_nn_output_5 <= axi_nn_output_5_sig;

  axi_nn_output_6 <= axi_nn_output_6_sig;

  axi_nn_output_7 <= axi_nn_output_7_sig;

  axi_valid_output <= axi_valid_output_sig;

END rtl;

