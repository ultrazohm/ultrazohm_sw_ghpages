-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_mlp_three_layer/uz_mlp_three_layer_src_mac_control.vhd
-- Created: 2021-02-12 15:30:22
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_mlp_three_layer_src_mac_control
-- Source Path: uz_mlp_three_layer/uz_mlp_three_layer/LastLayer/StateMachines/mac_control
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_mlp_three_layer_src_uz_mlp_three_layer_pkg.ALL;

ENTITY uz_mlp_three_layer_src_mac_control IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        external_enable                   :   IN    std_logic;
        counter_finished                  :   IN    std_logic;
        end_out                           :   IN    std_logic;
        end_out_delay                     :   IN    std_logic;
        mac_startOut                      :   IN    std_logic;
        index_counter_enb                 :   OUT   std_logic;
        mac_startIn                       :   OUT   std_logic;
        mac_endIn                         :   OUT   std_logic;
        mac_validIn                       :   OUT   std_logic;
        index_counter_rst                 :   OUT   std_logic;
        write_ram                         :   OUT   std_logic;
        mac_ready                         :   OUT   std_logic
        );
END uz_mlp_three_layer_src_mac_control;


ARCHITECTURE rtl OF uz_mlp_three_layer_src_mac_control IS

  -- Signals
  SIGNAL is_mac_control                   : T_state_type_is_mac_control;  -- uint8
  SIGNAL index_counter_enb_reg            : std_logic;
  SIGNAL mac_startIn_reg                  : std_logic;
  SIGNAL mac_endIn_reg                    : std_logic;
  SIGNAL mac_validIn_reg                  : std_logic;
  SIGNAL index_counter_rst_reg            : std_logic;
  SIGNAL write_ram_reg                    : std_logic;
  SIGNAL mac_ready_reg                    : std_logic;
  SIGNAL is_mac_control_next              : T_state_type_is_mac_control;  -- enum type state_type_is_mac_control (7 enums)
  SIGNAL index_counter_enb_reg_next       : std_logic;
  SIGNAL mac_startIn_reg_next             : std_logic;
  SIGNAL mac_endIn_reg_next               : std_logic;
  SIGNAL mac_validIn_reg_next             : std_logic;
  SIGNAL index_counter_rst_reg_next       : std_logic;
  SIGNAL write_ram_reg_next               : std_logic;
  SIGNAL mac_ready_reg_next               : std_logic;

BEGIN
  mac_control_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        --Entry: uz_mlp_three_layer/LastLayer/StateMachines/mac_control
        --Entry Internal: uz_mlp_three_layer/LastLayer/StateMachines/mac_control
        --Transition
        is_mac_control <= IN_idle_entry;
        --Entry 'idle_entry'
        index_counter_rst_reg <= '1';
        index_counter_enb_reg <= '0';
        mac_startIn_reg <= '0';
        mac_endIn_reg <= '0';
        mac_validIn_reg <= '0';
        mac_ready_reg <= '1';
        write_ram_reg <= '0';
      ELSIF enb = '1' THEN
        is_mac_control <= is_mac_control_next;
        index_counter_enb_reg <= index_counter_enb_reg_next;
        mac_startIn_reg <= mac_startIn_reg_next;
        mac_endIn_reg <= mac_endIn_reg_next;
        mac_validIn_reg <= mac_validIn_reg_next;
        index_counter_rst_reg <= index_counter_rst_reg_next;
        write_ram_reg <= write_ram_reg_next;
        mac_ready_reg <= mac_ready_reg_next;
      END IF;
    END IF;
  END PROCESS mac_control_process;

  mac_control_output : PROCESS (counter_finished, end_out, end_out_delay, external_enable,
       index_counter_enb_reg, index_counter_rst_reg, is_mac_control,
       mac_endIn_reg, mac_ready_reg, mac_startIn_reg, mac_startOut,
       mac_validIn_reg, write_ram_reg)
  BEGIN
    index_counter_enb_reg_next <= index_counter_enb_reg;
    mac_startIn_reg_next <= mac_startIn_reg;
    mac_endIn_reg_next <= mac_endIn_reg;
    mac_validIn_reg_next <= mac_validIn_reg;
    index_counter_rst_reg_next <= index_counter_rst_reg;
    write_ram_reg_next <= write_ram_reg;
    mac_ready_reg_next <= mac_ready_reg;
    is_mac_control_next <= is_mac_control;
    --Gateway: uz_mlp_three_layer/LastLayer/StateMachines/mac_control
    --During: uz_mlp_three_layer/LastLayer/StateMachines/mac_control
    CASE is_mac_control IS
      WHEN IN_accumulate =>
        --During 'accumulate'
        IF counter_finished = '1' THEN 
          --Transition
          is_mac_control_next <= IN_mac_finished;
          --Entry 'mac_finished'
          mac_endIn_reg_next <= '1';
        ELSE 
          mac_startIn_reg_next <= '0';
        END IF;
      WHEN IN_idle_entry =>
        --During 'idle_entry'
        IF external_enable = '1' THEN 
          --Transition
          is_mac_control_next <= IN_start_counter;
          --Entry 'start_counter'
          index_counter_rst_reg_next <= '0';
          index_counter_enb_reg_next <= '1';
          mac_ready_reg_next <= '0';
        ELSE 
          index_counter_rst_reg_next <= '1';
          index_counter_enb_reg_next <= '0';
          mac_startIn_reg_next <= '0';
          mac_endIn_reg_next <= '0';
          mac_validIn_reg_next <= '0';
          mac_ready_reg_next <= '1';
          write_ram_reg_next <= '0';
        END IF;
      WHEN IN_mac_finished =>
        --During 'mac_finished'
        IF end_out = '1' THEN 
          --Transition
          is_mac_control_next <= IN_mac_stop;
          --Entry 'mac_stop'
          mac_endIn_reg_next <= '0';
          mac_validIn_reg_next <= '0';
          index_counter_rst_reg_next <= '1';
          index_counter_enb_reg_next <= '0';
        ELSE 
          mac_endIn_reg_next <= '1';
        END IF;
      WHEN IN_mac_stop =>
        --During 'mac_stop'
        IF end_out_delay = '1' THEN 
          --Transition
          is_mac_control_next <= IN_write_ram_entry;
          --Entry 'write_ram_entry'
          write_ram_reg_next <= '1';
        ELSE 
          mac_endIn_reg_next <= '0';
          mac_validIn_reg_next <= '0';
          index_counter_rst_reg_next <= '1';
          index_counter_enb_reg_next <= '0';
        END IF;
      WHEN IN_start_counter =>
        --During 'start_counter'
        --Transition
        is_mac_control_next <= IN_start_mac;
        --Entry 'start_mac'
        mac_startIn_reg_next <= '1';
        mac_validIn_reg_next <= '1';
      WHEN IN_start_mac =>
        --During 'start_mac'
        IF mac_startOut = '1' THEN 
          --Transition
          is_mac_control_next <= IN_accumulate;
          --Entry 'accumulate'
          mac_startIn_reg_next <= '0';
        ELSE 
          mac_startIn_reg_next <= '1';
          mac_validIn_reg_next <= '1';
        END IF;
      WHEN OTHERS => 
        --case IN_write_ram_entry:
        --During 'write_ram_entry'
        --Transition
        is_mac_control_next <= IN_idle_entry;
        --Entry 'idle_entry'
        index_counter_rst_reg_next <= '1';
        index_counter_enb_reg_next <= '0';
        mac_startIn_reg_next <= '0';
        mac_endIn_reg_next <= '0';
        mac_validIn_reg_next <= '0';
        mac_ready_reg_next <= '1';
        write_ram_reg_next <= '0';
    END CASE;
  END PROCESS mac_control_output;

  index_counter_enb <= index_counter_enb_reg_next;
  mac_startIn <= mac_startIn_reg_next;
  mac_endIn <= mac_endIn_reg_next;
  mac_validIn <= mac_validIn_reg_next;
  index_counter_rst <= index_counter_rst_reg_next;
  write_ram <= write_ram_reg_next;
  mac_ready <= mac_ready_reg_next;

END rtl;

