-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_reluLayer_4Parallel.vhd
-- Created: 2021-02-12 15:30:22
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_reluLayer_4Parallel
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/reluLayer_4Parallel
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_mlp_three_layer_src_reluLayer_4Parallel IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        external_enable                   :   IN    std_logic;
        y_l_j                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        ram_rd_addr                       :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_signals_axi_weightData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_signals_axi_weightAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        axi_signals_axi_biasData          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        axi_signals_axi_biasAddr          :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        axi_signals_axi_biasWriteEnable   :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        axi_signals_axi_layerNr           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        number_of_inputs                  :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        finished_layer                    :   OUT   std_logic;
        j                                 :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        y                                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        biasData                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        biasWriteAddr                     :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        biasWriteEnable                   :   OUT   std_logic
        );
END uz_mlp_three_layer_src_reluLayer_4Parallel;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_reluLayer_4Parallel IS

  -- Component Declarations
  COMPONENT uz_mlp_three_layer_src_MAC3
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          b                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          fromStateMachine_endin          :   IN    std_logic;
          fromStateMachine_validIn        :   IN    std_logic;
          fromStateMachine_startin        :   IN    std_logic;
          fromStateMachine_mac_counter    :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          fromStateMachine_write_enable   :   IN    std_logic;
          fromStateMachine_n_perceptron   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          startOut                        :   OUT   std_logic;
          endOut                          :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_StateMachines1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          triggerCalc                     :   IN    std_logic;
          mac_startOut                    :   IN    std_logic;
          end_out                         :   IN    std_logic;
          number_of_inputs                :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          mac_counter                     :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          layer_finished                  :   OUT   std_logic;
          toMac_endin                     :   OUT   std_logic;
          toMac_validIn                   :   OUT   std_logic;
          toMac_startin                   :   OUT   std_logic;
          toMac_mac_counter               :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          toMac_write_enable              :   OUT   std_logic;
          toMac_n_perceptron              :   OUT   std_logic_vector(9 DOWNTO 0)  -- ufix10
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_MATLAB_Function
    PORT( readAddr                        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          y                               :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_MAC2
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          b                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          fromStateMachine_validIn        :   IN    std_logic;
          fromStateMachine_startin        :   IN    std_logic;
          fromStateMachine_mac_counter    :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          fromStateMachine_write_enable   :   IN    std_logic;
          fromStateMachine_n_perceptron   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasData                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          biasWriteAddr                   :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          biasWriteEnable                 :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_MAC1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          b                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          fromStateMachine_validIn        :   IN    std_logic;
          fromStateMachine_startin        :   IN    std_logic;
          fromStateMachine_mac_counter    :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          fromStateMachine_write_enable   :   IN    std_logic;
          fromStateMachine_n_perceptron   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
          );
  END COMPONENT;

  COMPONENT uz_mlp_three_layer_src_MAC
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          b                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightData      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_weightAddr      :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_weightsWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_biasData        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
          axi_signals_axi_biasAddr        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          axi_signals_axi_biasWriteEnable :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          axi_signals_axi_layerNr         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          fromStateMachine_validIn        :   IN    std_logic;
          fromStateMachine_startin        :   IN    std_logic;
          fromStateMachine_mac_counter    :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          fromStateMachine_write_enable   :   IN    std_logic;
          fromStateMachine_n_perceptron   :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_mlp_three_layer_src_MAC3
    USE ENTITY work.uz_mlp_three_layer_src_MAC3(rtl);

  FOR ALL : uz_mlp_three_layer_src_StateMachines1
    USE ENTITY work.uz_mlp_three_layer_src_StateMachines1(rtl);

  FOR ALL : uz_mlp_three_layer_src_MATLAB_Function
    USE ENTITY work.uz_mlp_three_layer_src_MATLAB_Function(rtl);

  FOR ALL : uz_mlp_three_layer_src_MAC2
    USE ENTITY work.uz_mlp_three_layer_src_MAC2(rtl);

  FOR ALL : uz_mlp_three_layer_src_MAC1
    USE ENTITY work.uz_mlp_three_layer_src_MAC1(rtl);

  FOR ALL : uz_mlp_three_layer_src_MAC
    USE ENTITY work.uz_mlp_three_layer_src_MAC(rtl);

  -- Signals
  SIGNAL StateMachines1_out4_endin        : std_logic;
  SIGNAL StateMachines1_out4_validIn      : std_logic;
  SIGNAL StateMachines1_out4_startin      : std_logic;
  SIGNAL StateMachines1_out4_mac_counter  : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL StateMachines1_out4_write_enable : std_logic;
  SIGNAL StateMachines1_out4_n_perceptron : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL MAC3_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL MAC3_out2                        : std_logic;
  SIGNAL MAC3_out3                        : std_logic;
  SIGNAL StateMachines1_out1              : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL layer_finished                   : std_logic;
  SIGNAL ram_rd_addr_unsigned             : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay3_out1                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL y_1                              : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL y_unsigned                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL MAC3_out1_signed                 : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL MAC2_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_biasData                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL axi_biasAddr                     : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL MAC2_out6                        : std_logic;
  SIGNAL MAC2_out1_signed                 : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL MAC1_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL MAC1_out1_signed                 : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL MAC_out1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL MAC_out1_signed                  : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL layer1_output                    : signed(31 DOWNTO 0);  -- sfix32_En14

BEGIN
  u_MAC3 : uz_mlp_three_layer_src_MAC3
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              rd_addr => ram_rd_addr,  -- ufix10
              b => y_l_j,  -- sfix32_En14
              axi_signals_axi_weightData => axi_signals_axi_weightData,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_signals_axi_weightAddr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_signals_axi_weightsWriteEnable,  -- uint8
              axi_signals_axi_biasData => axi_signals_axi_biasData,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_signals_axi_biasAddr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_signals_axi_biasWriteEnable,  -- uint8
              axi_signals_axi_layerNr => axi_signals_axi_layerNr,  -- uint8
              fromStateMachine_endin => StateMachines1_out4_endin,
              fromStateMachine_validIn => StateMachines1_out4_validIn,
              fromStateMachine_startin => StateMachines1_out4_startin,
              fromStateMachine_mac_counter => StateMachines1_out4_mac_counter,  -- ufix10
              fromStateMachine_write_enable => StateMachines1_out4_write_enable,
              fromStateMachine_n_perceptron => StateMachines1_out4_n_perceptron,  -- ufix10
              rd_dout => MAC3_out1,  -- sfix32_En14
              startOut => MAC3_out2,
              endOut => MAC3_out3
              );

  u_StateMachines1 : uz_mlp_three_layer_src_StateMachines1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              triggerCalc => external_enable,
              mac_startOut => MAC3_out2,
              end_out => MAC3_out3,
              number_of_inputs => number_of_inputs,  -- ufix10
              mac_counter => StateMachines1_out1,  -- ufix10
              layer_finished => layer_finished,
              toMac_endin => StateMachines1_out4_endin,
              toMac_validIn => StateMachines1_out4_validIn,
              toMac_startin => StateMachines1_out4_startin,
              toMac_mac_counter => StateMachines1_out4_mac_counter,  -- ufix10
              toMac_write_enable => StateMachines1_out4_write_enable,
              toMac_n_perceptron => StateMachines1_out4_n_perceptron  -- ufix10
              );

  u_MATLAB_Function : uz_mlp_three_layer_src_MATLAB_Function
    PORT MAP( readAddr => std_logic_vector(Delay3_out1),  -- ufix10
              y => y_1  -- uint8
              );

  u_MAC2 : uz_mlp_three_layer_src_MAC2
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              rd_addr => ram_rd_addr,  -- ufix10
              b => y_l_j,  -- sfix32_En14
              axi_signals_axi_weightData => axi_signals_axi_weightData,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_signals_axi_weightAddr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_signals_axi_weightsWriteEnable,  -- uint8
              axi_signals_axi_biasData => axi_signals_axi_biasData,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_signals_axi_biasAddr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_signals_axi_biasWriteEnable,  -- uint8
              axi_signals_axi_layerNr => axi_signals_axi_layerNr,  -- uint8
              fromStateMachine_validIn => StateMachines1_out4_validIn,
              fromStateMachine_startin => StateMachines1_out4_startin,
              fromStateMachine_mac_counter => StateMachines1_out4_mac_counter,  -- ufix10
              fromStateMachine_write_enable => StateMachines1_out4_write_enable,
              fromStateMachine_n_perceptron => StateMachines1_out4_n_perceptron,  -- ufix10
              rd_dout => MAC2_out1,  -- sfix32_En14
              biasData => axi_biasData,  -- sfix32_En14
              biasWriteAddr => axi_biasAddr,  -- ufix10
              biasWriteEnable => MAC2_out6
              );

  u_MAC1 : uz_mlp_three_layer_src_MAC1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              rd_addr => ram_rd_addr,  -- ufix10
              b => y_l_j,  -- sfix32_En14
              axi_signals_axi_weightData => axi_signals_axi_weightData,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_signals_axi_weightAddr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_signals_axi_weightsWriteEnable,  -- uint8
              axi_signals_axi_biasData => axi_signals_axi_biasData,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_signals_axi_biasAddr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_signals_axi_biasWriteEnable,  -- uint8
              axi_signals_axi_layerNr => axi_signals_axi_layerNr,  -- uint8
              fromStateMachine_validIn => StateMachines1_out4_validIn,
              fromStateMachine_startin => StateMachines1_out4_startin,
              fromStateMachine_mac_counter => StateMachines1_out4_mac_counter,  -- ufix10
              fromStateMachine_write_enable => StateMachines1_out4_write_enable,
              fromStateMachine_n_perceptron => StateMachines1_out4_n_perceptron,  -- ufix10
              rd_dout => MAC1_out1  -- sfix32_En14
              );

  u_MAC : uz_mlp_three_layer_src_MAC
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              rd_addr => ram_rd_addr,  -- ufix10
              b => y_l_j,  -- sfix32_En14
              axi_signals_axi_weightData => axi_signals_axi_weightData,  -- sfix32_En14
              axi_signals_axi_weightAddr => axi_signals_axi_weightAddr,  -- ufix10
              axi_signals_axi_weightsWriteEnable => axi_signals_axi_weightsWriteEnable,  -- uint8
              axi_signals_axi_biasData => axi_signals_axi_biasData,  -- sfix32_En14
              axi_signals_axi_biasAddr => axi_signals_axi_biasAddr,  -- ufix10
              axi_signals_axi_biasWriteEnable => axi_signals_axi_biasWriteEnable,  -- uint8
              axi_signals_axi_layerNr => axi_signals_axi_layerNr,  -- uint8
              fromStateMachine_validIn => StateMachines1_out4_validIn,
              fromStateMachine_startin => StateMachines1_out4_startin,
              fromStateMachine_mac_counter => StateMachines1_out4_mac_counter,  -- ufix10
              fromStateMachine_write_enable => StateMachines1_out4_write_enable,
              fromStateMachine_n_perceptron => StateMachines1_out4_n_perceptron,  -- ufix10
              rd_dout => MAC_out1  -- sfix32_En14
              );

  ram_rd_addr_unsigned <= unsigned(ram_rd_addr);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay3_out1 <= to_unsigned(16#000#, 10);
      ELSIF enb = '1' THEN
        Delay3_out1 <= ram_rd_addr_unsigned;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  y_unsigned <= unsigned(y_1);

  MAC3_out1_signed <= signed(MAC3_out1);

  MAC2_out1_signed <= signed(MAC2_out1);

  MAC1_out1_signed <= signed(MAC1_out1);

  MAC_out1_signed <= signed(MAC_out1);

  
  layer1_output <= MAC3_out1_signed WHEN y_unsigned = to_unsigned(16#00#, 8) ELSE
      MAC2_out1_signed WHEN y_unsigned = to_unsigned(16#01#, 8) ELSE
      MAC1_out1_signed WHEN y_unsigned = to_unsigned(16#02#, 8) ELSE
      MAC_out1_signed;

  y <= std_logic_vector(layer1_output);

  finished_layer <= layer_finished;

  j <= StateMachines1_out1;

  biasData <= axi_biasData;

  biasWriteAddr <= axi_biasAddr;

  biasWriteEnable <= MAC2_out6;

END rtl;

