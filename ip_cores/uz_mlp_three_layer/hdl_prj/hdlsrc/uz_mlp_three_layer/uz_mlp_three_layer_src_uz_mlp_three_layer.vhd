-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_uz_mlp_three_layer.vhd
-- Created: 2021-02-12 15:30:24
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1
-- Target subsystem base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- layer2_rdy                    ce_out        1
-- finished                      ce_out        1
-- out_rsvd                      ce_out        1
-- out1                          ce_out        1
-- out2                          ce_out        1
-- out3                          ce_out        1
-- out4                          ce_out        1
-- out5                          ce_out        1
-- out6                          ce_out        1
-- out7                          ce_out        1
-- biasData                      ce_out        1
-- biasWriteAddr                 ce_out        1
-- biasWriteEnable               ce_out        1
-- valid_output                  ce_out        1
-- axi_nn_output_0               ce_out        1
-- axi_nn_output_1               ce_out        1
-- axi_nn_output_2               ce_out        1
-- axi_nn_output_3               ce_out        1
-- axi_nn_output_4               ce_out        1
-- axi_nn_output_5               ce_out        1
-- axi_nn_output_6               ce_out        1
-- axi_nn_output_7               ce_out        1
-- axi_valid_output              ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_uz_mlp_three_layer
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_src_uz_mlp_three_layer IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enable_nn                         :   IN    std_logic;
        axi_enable_nn                     :   IN    std_logic;
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
        axi_wrEnBias                      :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        axi_wrEnWeights                   :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        axi_layerNr                       :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        use_axi_input                     :   IN    std_logic;
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
        ce_out                            :   OUT   std_logic;
        layer2_rdy                        :   OUT   std_logic;
        finished                          :   OUT   std_logic;
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
        biasWriteEnable                   :   OUT   std_logic;
        valid_output                      :   OUT   std_logic;
        axi_nn_output_0                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_1                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_2                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_3                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_4                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_5                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_6                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_nn_output_7                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_valid_output                  :   OUT   std_logic
        );
END uz_mlp_three_layer_src_uz_mlp_three_layer;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_uz_mlp_three_layer IS

  -- Component Declarations
  COMPONENT uz_mlp_three_layer_src_reluLayer_4Parallel
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          external_enable                 :   IN    std_logic;
          y_l_j                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          ram_rd_addr                     :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          number_of_inputs                :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          finished_layer                  :   OUT   std_logic;
          j                               :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          y                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasData                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasWriteAddr                   :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          biasWriteEnable                 :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_reluLayer_8Parallel
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          external_enable                 :   IN    std_logic;
          y_l_j                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          ram_rd_addr                     :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          finished_layer                  :   OUT   std_logic;
          j                               :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_reluLayer_8Parallel1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          external_enable                 :   IN    std_logic;
          y_l_j                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          ram_rd_addr                     :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          finished_layer                  :   OUT   std_logic;
          j                               :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_LastLayer
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          external_enable                 :   IN    std_logic;
          y_l_j                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          In1_axi_weightData              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          In1_axi_weightAddr              :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          In1_axi_weightsWriteEnable      :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          In1_axi_biasData                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          In1_axi_biasAddr                :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          In1_axi_biasWriteEnable         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          In1_axi_layerNr                 :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          output_half_minus_one           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          layer_rdy                       :   OUT   std_logic;
          finished_layer                  :   OUT   std_logic;
          j                               :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          out_rsvd                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out1                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out2                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out3                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out4                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out5                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out6                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          out7                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_Detect_Rise_Positive
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          U                               :   IN    std_logic;
          Y                               :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_mlp_three_layer_src_reluLayer_4Parallel
    USE ENTITY work.uz_mlp_three_layer_src_reluLayer_4Parallel(rtl);

  FOR ALL : uz_mlp_three_layer_src_reluLayer_8Parallel
    USE ENTITY work.uz_mlp_three_layer_src_reluLayer_8Parallel(rtl);

  FOR ALL : uz_mlp_three_layer_src_reluLayer_8Parallel1
    USE ENTITY work.uz_mlp_three_layer_src_reluLayer_8Parallel1(rtl);

  FOR ALL : uz_mlp_three_layer_src_LastLayer
    USE ENTITY work.uz_mlp_three_layer_src_LastLayer(rtl);

  FOR ALL : uz_mlp_three_layer_src_Detect_Rise_Positive
    USE ENTITY work.uz_mlp_three_layer_src_Detect_Rise_Positive(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL en                               : std_logic;
  SIGNAL en_1                             : std_logic;
  SIGNAL en_2                             : std_logic;
  SIGNAL x1_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x2_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x3_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x4_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x5_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x6_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x7_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x8_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x9_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x10_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x11_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x12_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x13_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x14_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x15_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL x16_signed                       : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_0_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_1_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_2_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_3_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_4_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_5_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_6_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_7_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_8_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_9_signed             : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_10_signed            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_11_signed            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_12_signed            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_13_signed            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_14_signed            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL axi_x_input_15_signed            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL reluLayer_4Parallel_out3_unsigned : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Multiport_Switch1_out1           : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL reluLayer_4Parallel_out3         : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL Multiport_Switch_out1            : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Switch_out1                      : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL b                                : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL reluLayer_8Parallel_out3         : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL finished_layer_1                 : std_logic;
  SIGNAL layer1_output                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reluLayer_4Parallel_out5         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reluLayer_4Parallel_out6         : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL reluLayer_4Parallel_out7         : std_logic;
  SIGNAL reluLayer_8Parallel1_out3        : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL finished_layer_1_1               : std_logic;
  SIGNAL layer1_output_1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out3                   : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL finished_layer_1_2               : std_logic;
  SIGNAL layer1_output_2                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out1                   : std_logic;
  SIGNAL finished_layer_4                 : std_logic;
  SIGNAL LastLayer_out4                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out5                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out6                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out7                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out8                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out9                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out10                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LastLayer_out11                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Detect_Rise_Positive_out1        : std_logic;
  SIGNAL Delay_iv                         : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Delay_toDel                      : std_logic;
  SIGNAL Delay_delOut                     : std_logic;
  SIGNAL Delay_out1                       : std_logic;

BEGIN
  -- valid_out is false
  -- if finished outputs a rising edge, valid_out is true
  -- rising edge on enable_nn sets valid_out to false
  -- 
  -- as long as valid_output is true, the output is valid

  u_reluLayer_4Parallel : uz_mlp_three_layer_src_reluLayer_4Parallel
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              external_enable => en_2,
              y_l_j => std_logic_vector(b),  -- sfix32_En14
              ram_rd_addr => reluLayer_8Parallel_out3,  -- ufix10
              axi_signals_axi_weightData => axi_weight,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_weight_addr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_wrEnWeights,  -- uint8
              axi_signals_axi_biasData => axi_bias,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_bias_addr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_wrEnBias,  -- uint8
              axi_signals_axi_layerNr => axi_layerNr,  -- uint8
              number_of_inputs => axi_number_of_inputs,  -- ufix10
              finished_layer => finished_layer_1,
              j => reluLayer_4Parallel_out3,  -- ufix10
              y => layer1_output,  -- sfix32_En14
              biasData => reluLayer_4Parallel_out5,  -- sfix32_En14
              biasWriteAddr => reluLayer_4Parallel_out6,  -- ufix10
              biasWriteEnable => reluLayer_4Parallel_out7
              );

  u_reluLayer_8Parallel : uz_mlp_three_layer_src_reluLayer_8Parallel
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              external_enable => finished_layer_1,
              y_l_j => layer1_output,  -- sfix32_En14
              ram_rd_addr => reluLayer_8Parallel1_out3,  -- ufix10
              axi_signals_axi_weightData => axi_weight,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_weight_addr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_wrEnWeights,  -- uint8
              axi_signals_axi_biasData => axi_bias,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_bias_addr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_wrEnBias,  -- uint8
              axi_signals_axi_layerNr => axi_layerNr,  -- uint8
              finished_layer => finished_layer_1_1,
              j => reluLayer_8Parallel_out3,  -- ufix10
              y => layer1_output_1  -- sfix32_En14
              );

  u_reluLayer_8Parallel1 : uz_mlp_three_layer_src_reluLayer_8Parallel1
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              external_enable => finished_layer_1_1,
              y_l_j => layer1_output_1,  -- sfix32_En14
              ram_rd_addr => LastLayer_out3,  -- ufix10
              axi_signals_axi_weightData => axi_weight,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_weight_addr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_wrEnWeights,  -- uint8
              axi_signals_axi_biasData => axi_bias,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_bias_addr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_wrEnBias,  -- uint8
              axi_signals_axi_layerNr => axi_layerNr,  -- uint8
              finished_layer => finished_layer_1_2,
              j => reluLayer_8Parallel1_out3,  -- ufix10
              y => layer1_output_2  -- sfix32_En14
              );

  u_LastLayer : uz_mlp_three_layer_src_LastLayer
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              external_enable => finished_layer_1_2,
              y_l_j => layer1_output_2,  -- sfix32_En14
              In1_axi_weightData => axi_weight,  -- sfix32_En14
              In1_axi_weightAddr => axi_weight_addr,  -- ufix10
              In1_axi_weightsWriteEnable => axi_wrEnWeights,  -- uint8
              In1_axi_biasData => axi_bias,  -- sfix32_En14
              In1_axi_biasAddr => axi_bias_addr,  -- ufix10
              In1_axi_biasWriteEnable => axi_wrEnBias,  -- uint8
              In1_axi_layerNr => axi_layerNr,  -- uint8
              output_half_minus_one => axi_output_number_configuration,  -- ufix10
              layer_rdy => LastLayer_out1,
              finished_layer => finished_layer_4,
              j => LastLayer_out3,  -- ufix10
              out_rsvd => LastLayer_out4,  -- sfix32_En14
              out1 => LastLayer_out5,  -- sfix32_En14
              out2 => LastLayer_out6,  -- sfix32_En14
              out3 => LastLayer_out7,  -- sfix32_En14
              out4 => LastLayer_out8,  -- sfix32_En14
              out5 => LastLayer_out9,  -- sfix32_En14
              out6 => LastLayer_out10,  -- sfix32_En14
              out7 => LastLayer_out11  -- sfix32_En14
              );

  u_Detect_Rise_Positive : uz_mlp_three_layer_src_Detect_Rise_Positive
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              U => en_2,
              Y => Detect_Rise_Positive_out1
              );

  en <= enable_nn;

  en_1 <= axi_enable_nn;

  en_2 <= en_1 OR en;

  x1_signed <= signed(x1);

  x2_signed <= signed(x2);

  x3_signed <= signed(x3);

  x4_signed <= signed(x4);

  x5_signed <= signed(x5);

  x6_signed <= signed(x6);

  x7_signed <= signed(x7);

  x8_signed <= signed(x8);

  x9_signed <= signed(x9);

  x10_signed <= signed(x10);

  x11_signed <= signed(x11);

  x12_signed <= signed(x12);

  x13_signed <= signed(x13);

  x14_signed <= signed(x14);

  x15_signed <= signed(x15);

  x16_signed <= signed(x16);

  axi_x_input_0_signed <= signed(axi_x_input_0);

  axi_x_input_1_signed <= signed(axi_x_input_1);

  axi_x_input_2_signed <= signed(axi_x_input_2);

  axi_x_input_3_signed <= signed(axi_x_input_3);

  axi_x_input_4_signed <= signed(axi_x_input_4);

  axi_x_input_5_signed <= signed(axi_x_input_5);

  axi_x_input_6_signed <= signed(axi_x_input_6);

  axi_x_input_7_signed <= signed(axi_x_input_7);

  axi_x_input_8_signed <= signed(axi_x_input_8);

  axi_x_input_9_signed <= signed(axi_x_input_9);

  axi_x_input_10_signed <= signed(axi_x_input_10);

  axi_x_input_11_signed <= signed(axi_x_input_11);

  axi_x_input_12_signed <= signed(axi_x_input_12);

  axi_x_input_13_signed <= signed(axi_x_input_13);

  axi_x_input_14_signed <= signed(axi_x_input_14);

  axi_x_input_15_signed <= signed(axi_x_input_15);

  enb <= clk_enable;

  
  Multiport_Switch1_out1 <= axi_x_input_0_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#001#, 10) ELSE
      axi_x_input_1_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#002#, 10) ELSE
      axi_x_input_2_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#003#, 10) ELSE
      axi_x_input_3_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#004#, 10) ELSE
      axi_x_input_4_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#005#, 10) ELSE
      axi_x_input_5_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#006#, 10) ELSE
      axi_x_input_6_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#007#, 10) ELSE
      axi_x_input_7_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#008#, 10) ELSE
      axi_x_input_8_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#009#, 10) ELSE
      axi_x_input_9_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00A#, 10) ELSE
      axi_x_input_10_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00B#, 10) ELSE
      axi_x_input_11_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00C#, 10) ELSE
      axi_x_input_12_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00D#, 10) ELSE
      axi_x_input_13_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00E#, 10) ELSE
      axi_x_input_14_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00F#, 10) ELSE
      axi_x_input_15_signed;

  reluLayer_4Parallel_out3_unsigned <= unsigned(reluLayer_4Parallel_out3);

  
  Multiport_Switch_out1 <= x1_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#001#, 10) ELSE
      x2_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#002#, 10) ELSE
      x3_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#003#, 10) ELSE
      x4_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#004#, 10) ELSE
      x5_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#005#, 10) ELSE
      x6_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#006#, 10) ELSE
      x7_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#007#, 10) ELSE
      x8_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#008#, 10) ELSE
      x9_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#009#, 10) ELSE
      x10_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00A#, 10) ELSE
      x11_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00B#, 10) ELSE
      x12_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00C#, 10) ELSE
      x13_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00D#, 10) ELSE
      x14_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00E#, 10) ELSE
      x15_signed WHEN reluLayer_4Parallel_out3_unsigned = to_unsigned(16#00F#, 10) ELSE
      x16_signed;

  
  Switch_out1 <= Multiport_Switch_out1 WHEN use_axi_input = '0' ELSE
      Multiport_Switch1_out1;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        b <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        b <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Delay_iv <= '0';

  Constant_out1 <= '1';

  
  Delay_toDel <= Switch1_out1 WHEN Detect_Rise_Positive_out1 = '0' ELSE
      Delay_iv;

  Delay_lowered_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_delOut <= '0';
      ELSIF enb = '1' THEN
        Delay_delOut <= Delay_toDel;
      END IF;
    END IF;
  END PROCESS Delay_lowered_process;


  
  Delay_out1 <= Delay_delOut WHEN Detect_Rise_Positive_out1 = '0' ELSE
      Delay_iv;

  
  Switch1_out1 <= Delay_out1 WHEN finished_layer_4 = '0' ELSE
      Constant_out1;

  ce_out <= clk_enable;

  layer2_rdy <= LastLayer_out1;

  finished <= finished_layer_4;

  out_rsvd <= LastLayer_out4;

  out1 <= LastLayer_out5;

  out2 <= LastLayer_out6;

  out3 <= LastLayer_out7;

  out4 <= LastLayer_out8;

  out5 <= LastLayer_out9;

  out6 <= LastLayer_out10;

  out7 <= LastLayer_out11;

  biasData <= reluLayer_4Parallel_out5;

  biasWriteAddr <= reluLayer_4Parallel_out6;

  biasWriteEnable <= reluLayer_4Parallel_out7;

  valid_output <= Switch1_out1;

  axi_nn_output_0 <= LastLayer_out4;

  axi_nn_output_1 <= LastLayer_out5;

  axi_nn_output_2 <= LastLayer_out6;

  axi_nn_output_3 <= LastLayer_out7;

  axi_nn_output_4 <= LastLayer_out8;

  axi_nn_output_5 <= LastLayer_out9;

  axi_nn_output_6 <= LastLayer_out10;

  axi_nn_output_7 <= LastLayer_out11;

  axi_valid_output <= Switch1_out1;

END rtl;

