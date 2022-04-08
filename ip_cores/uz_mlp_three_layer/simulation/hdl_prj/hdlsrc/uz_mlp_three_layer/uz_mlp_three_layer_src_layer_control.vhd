-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_layer_control.vhd
-- Created: 2021-03-17 16:47:03
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_layer_control
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/LastLayer/StateMachines/layer_control
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_mlp_three_layer_src_uz_mlp_three_layer_pkg.ALL;

ENTITY uz_mlp_three_layer_src_layer_control IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        ext_enable                        :   IN    std_logic;
        mac_ready                         :   IN    std_logic;
        cnt_finished                      :   IN    std_logic;
        enable_mac                        :   OUT   std_logic;
        cnt_enable                        :   OUT   std_logic;
        counter_rest                      :   OUT   std_logic;
        layer_finished                    :   OUT   std_logic
        );
END uz_mlp_three_layer_src_layer_control;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_layer_control IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL is_layer_control                 : T_state_type_is_layer_control;  -- uint8
  SIGNAL layer_rdy                        : std_logic;
  SIGNAL enable_mac_reg                   : std_logic;
  SIGNAL layer_rdy_reg                    : std_logic;
  SIGNAL cnt_enable_reg                   : std_logic;
  SIGNAL counter_rest_reg                 : std_logic;
  SIGNAL layer_finished_reg               : std_logic;
  SIGNAL is_layer_control_next            : T_state_type_is_layer_control;  -- enum type state_type_is_layer_control (7 enums)
  SIGNAL enable_mac_reg_next              : std_logic;
  SIGNAL layer_rdy_reg_next               : std_logic;
  SIGNAL cnt_enable_reg_next              : std_logic;
  SIGNAL counter_rest_reg_next            : std_logic;
  SIGNAL layer_finished_reg_next          : std_logic;

BEGIN
  layer_control_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        enable_mac_reg <= '0';
        cnt_enable_reg <= '0';
        layer_finished_reg <= '0';
        --Entry: uz_mlp_three_layer/LastLayer/StateMachines/layer_control
        --Entry Internal: uz_mlp_three_layer/LastLayer/StateMachines/layer_control
        --Transition
        is_layer_control <= IN_entry_to_entry_state;
        --Entry 'entry_to_entry_state'
        layer_rdy_reg <= '1';
        counter_rest_reg <= '1';
        -- reset counter for looping through perceptrons of one layer
      ELSIF enb = '1' THEN
        is_layer_control <= is_layer_control_next;
        enable_mac_reg <= enable_mac_reg_next;
        layer_rdy_reg <= layer_rdy_reg_next;
        cnt_enable_reg <= cnt_enable_reg_next;
        counter_rest_reg <= counter_rest_reg_next;
        layer_finished_reg <= layer_finished_reg_next;
      END IF;
    END IF;
  END PROCESS layer_control_process;

  layer_control_output : PROCESS (cnt_enable_reg, cnt_finished, counter_rest_reg, enable_mac_reg, ext_enable,
       is_layer_control, layer_finished_reg, layer_rdy_reg, mac_ready)
    VARIABLE sf_internal_predicateOutput : std_logic;
  BEGIN
    sf_internal_predicateOutput := '0';
    enable_mac_reg_next <= enable_mac_reg;
    layer_rdy_reg_next <= layer_rdy_reg;
    cnt_enable_reg_next <= cnt_enable_reg;
    counter_rest_reg_next <= counter_rest_reg;
    layer_finished_reg_next <= layer_finished_reg;
    is_layer_control_next <= is_layer_control;
    --Gateway: uz_mlp_three_layer/LastLayer/StateMachines/layer_control
    --During: uz_mlp_three_layer/LastLayer/StateMachines/layer_control
    CASE is_layer_control IS
      WHEN IN_calc_perceptron =>
        --During 'calc_perceptron'
        IF ( NOT mac_ready) = '1' THEN 
          --Transition
          is_layer_control_next <= IN_calc_running;
          --Entry 'calc_running'
          enable_mac_reg_next <= '0';
        ELSE 
          enable_mac_reg_next <= '1';
        END IF;
      WHEN IN_calc_running =>
        --During 'calc_running'
        sf_internal_predicateOutput := hdlcoder_to_stdlogic((mac_ready AND ( NOT cnt_finished)) = '1');
        IF sf_internal_predicateOutput = '1' THEN 
          --Transition
          is_layer_control_next <= IN_perceptron_rdy;
          --Entry 'perceptron_rdy'
          cnt_enable_reg_next <= '1';
          counter_rest_reg_next <= '0';
        ELSIF (mac_ready AND cnt_finished) = '1' THEN 
          --Transition
          is_layer_control_next <= IN_finished;
          --Entry 'finished'
          layer_finished_reg_next <= '1';
        ELSE 
          enable_mac_reg_next <= '0';
        END IF;
      WHEN IN_entry_to_entry_state =>
        --During 'entry_to_entry_state'
        IF ext_enable = '1' THEN 
          --Transition
          is_layer_control_next <= IN_idle;
          --Entry 'idle'
          cnt_enable_reg_next <= '0';
        ELSE 
          layer_rdy_reg_next <= '1';
          counter_rest_reg_next <= '1';
          -- reset counter for looping through perceptrons of one layer
        END IF;
      WHEN IN_finished =>
        --During 'finished'
        --Transition
        is_layer_control_next <= IN_finished2;
        --Entry 'finished2'
        layer_finished_reg_next <= '0';
      WHEN IN_finished2 =>
        --During 'finished2'
        --Transition
        is_layer_control_next <= IN_entry_to_entry_state;
        --Entry 'entry_to_entry_state'
        layer_rdy_reg_next <= '1';
        counter_rest_reg_next <= '1';
        -- reset counter for looping through perceptrons of one layer
      WHEN IN_idle =>
        --During 'idle'
        IF mac_ready = '1' THEN 
          --Transition
          is_layer_control_next <= IN_calc_perceptron;
          --Entry 'calc_perceptron'
          enable_mac_reg_next <= '1';
        ELSE 
          cnt_enable_reg_next <= '0';
        END IF;
      WHEN OTHERS => 
        --case IN_perceptron_rdy:
        --During 'perceptron_rdy'
        --Transition
        is_layer_control_next <= IN_idle;
        --Entry 'idle'
        cnt_enable_reg_next <= '0';
    END CASE;
  END PROCESS layer_control_output;

  enable_mac <= enable_mac_reg_next;
  layer_rdy <= layer_rdy_reg_next;
  cnt_enable <= cnt_enable_reg_next;
  counter_rest <= counter_rest_reg_next;
  layer_finished <= layer_finished_reg_next;

END rtl;

