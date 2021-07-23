-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_pmsm_model/uz_pmsm_model_src_uz_pmsm_model_tc.vhd
-- Created: 2021-07-23 14:36:59
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_pmsm_model_src_uz_pmsm_model_tc
-- Source Path: uz_pmsm_model_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_50_1  : 50x slower than clk with phase 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_pmsm_model_src_uz_pmsm_model_tc IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_50_1                        :   OUT   std_logic
        );
END uz_pmsm_model_src_uz_pmsm_model_tc;


ARCHITECTURE rtl OF uz_pmsm_model_src_uz_pmsm_model_tc IS

  -- Signals
  SIGNAL count50                          : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL phase_all                        : std_logic;
  SIGNAL phase_1                          : std_logic;
  SIGNAL phase_1_tmp                      : std_logic;

BEGIN
  Counter50 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        count50 <= to_unsigned(1, 6);
      ELSIF clk_enable = '1' THEN
        IF count50 >= to_unsigned(49, 6) THEN
          count50 <= to_unsigned(0, 6);
        ELSE
          count50 <= count50 + to_unsigned(1, 6);
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter50;

  phase_all <= '1' WHEN clk_enable = '1' ELSE '0';

  temp_process1 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        phase_1 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1 <= phase_1_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process1;

  phase_1_tmp <= '1' WHEN count50 = to_unsigned(0, 6) AND clk_enable = '1' ELSE '0';

  enb <=  phase_all AND clk_enable;

  enb_1_50_1 <=  phase_1 AND clk_enable;


END rtl;

