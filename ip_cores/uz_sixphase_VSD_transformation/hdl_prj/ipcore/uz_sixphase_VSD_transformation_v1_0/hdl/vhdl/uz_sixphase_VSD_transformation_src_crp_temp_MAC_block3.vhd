-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_sixphase_VSD_transformation\hdl_prj\hdlsrc\uz_sixphase_VSD_transformation\uz_sixphase_VSD_transformation_src_crp_temp_MAC_block3.vhd
-- Created: 2022-10-17 10:15:35
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_sixphase_VSD_transformation_src_crp_temp_MAC_block3
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_sixphase_VSD_transformation_src_abc_to_dq_pkg.ALL;

ENTITY uz_sixphase_VSD_transformation_src_crp_temp_MAC_block3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    vector_of_std_logic_vector18(0 TO 5);  -- sfix18_En16 [6]
        in1                               :   IN    vector_of_std_logic_vector27(0 TO 5);  -- sfix27_En18 [6]
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   std_logic_vector(26 DOWNTO 0)  -- sfix27_En18
        );
END uz_sixphase_VSD_transformation_src_crp_temp_MAC_block3;


ARCHITECTURE rtl OF uz_sixphase_VSD_transformation_src_crp_temp_MAC_block3 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL t_counterSig                     : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL t_reset_sig                      : std_logic;
  SIGNAL t_initial_value                  : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL in0_signed                       : vector_of_signed18(0 TO 5);  -- sfix18_En16 [6]
  SIGNAL t_multiportswitch_out            : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL in1_signed                       : vector_of_signed27(0 TO 5);  -- sfix27_En18 [6]
  SIGNAL t_multiportswitch_out_1          : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL t_multiply_out                   : signed(44 DOWNTO 0);  -- sfix45_En34
  SIGNAL t_multiplyadd_out                : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL t_delay_loop                     : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL t_switch_out                     : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL t_add_add_cast                   : signed(45 DOWNTO 0);  -- sfix46_En34
  SIGNAL t_add_add_cast_1                 : signed(45 DOWNTO 0);  -- sfix46_En34
  SIGNAL t_add_add_temp                   : signed(45 DOWNTO 0);  -- sfix46_En34
  SIGNAL t_multiplyadd_out_bypass         : signed(26 DOWNTO 0);  -- sfix27_En18
  SIGNAL t_multiplyadd_out_last_value     : signed(26 DOWNTO 0);  -- sfix27_En18

  ATTRIBUTE use_dsp : string;

  ATTRIBUTE use_dsp OF t_multiply_out : SIGNAL IS "yes";

BEGIN
  enb_gated <= globalSchedule AND enb;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 5
  t_counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        t_counterSig <= to_unsigned(16#0#, 3);
      ELSIF enb_gated = '1' THEN
        IF t_counterSig >= to_unsigned(16#5#, 3) THEN 
          t_counterSig <= to_unsigned(16#0#, 3);
        ELSE 
          t_counterSig <= t_counterSig + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS t_counter_process;


  
  t_reset_sig <= '1' WHEN t_counterSig /= to_unsigned(16#0#, 3) ELSE
      '0';

  t_initial_value <= to_signed(16#0000000#, 27);

  outputgen1: FOR k IN 0 TO 5 GENERATE
    in0_signed(k) <= signed(in0(k));
  END GENERATE;

  
  t_multiportswitch_out <= in0_signed(0) WHEN t_counterSig = to_unsigned(16#0#, 3) ELSE
      in0_signed(1) WHEN t_counterSig = to_unsigned(16#1#, 3) ELSE
      in0_signed(2) WHEN t_counterSig = to_unsigned(16#2#, 3) ELSE
      in0_signed(3) WHEN t_counterSig = to_unsigned(16#3#, 3) ELSE
      in0_signed(4) WHEN t_counterSig = to_unsigned(16#4#, 3) ELSE
      in0_signed(5);

  outputgen: FOR k IN 0 TO 5 GENERATE
    in1_signed(k) <= signed(in1(k));
  END GENERATE;

  
  t_multiportswitch_out_1 <= in1_signed(0) WHEN t_counterSig = to_unsigned(16#0#, 3) ELSE
      in1_signed(1) WHEN t_counterSig = to_unsigned(16#1#, 3) ELSE
      in1_signed(2) WHEN t_counterSig = to_unsigned(16#2#, 3) ELSE
      in1_signed(3) WHEN t_counterSig = to_unsigned(16#3#, 3) ELSE
      in1_signed(4) WHEN t_counterSig = to_unsigned(16#4#, 3) ELSE
      in1_signed(5);

  t_multiply_out <= t_multiportswitch_out * t_multiportswitch_out_1;

  t_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        t_delay_loop <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        t_delay_loop <= t_multiplyadd_out;
      END IF;
    END IF;
  END PROCESS t_delay_process;


  
  t_switch_out <= t_initial_value WHEN t_reset_sig = '0' ELSE
      t_delay_loop;

  t_add_add_cast <= resize(t_switch_out & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 46);
  t_add_add_cast_1 <= resize(t_multiply_out, 46);
  t_add_add_temp <= t_add_add_cast + t_add_add_cast_1;
  t_multiplyadd_out <= t_add_add_temp(42 DOWNTO 16);

  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        t_multiplyadd_out_last_value <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        t_multiplyadd_out_last_value <= t_multiplyadd_out_bypass;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  t_multiplyadd_out_bypass <= t_multiplyadd_out_last_value WHEN globalSchedule = '0' ELSE
      t_multiplyadd_out;

  out0 <= std_logic_vector(t_multiplyadd_out_bypass);

END rtl;

