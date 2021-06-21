-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_pmsm_model/uz_pmsm_model_src_uz_pmsm_model_tc.vhd
-- Created: 2021-06-21 14:13:47
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
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
-- enb_1_100_0 : 100x slower than clk with last phase
-- enb_1_100_1 : 100x slower than clk with phase 1
-- enb_1_100_91: 100x slower than clk with phase 91
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
        enb_1_100_0                       :   OUT   std_logic;
        enb_1_100_1                       :   OUT   std_logic;
        enb_1_100_91                      :   OUT   std_logic
        );
END uz_pmsm_model_src_uz_pmsm_model_tc;


ARCHITECTURE rtl OF uz_pmsm_model_src_uz_pmsm_model_tc IS

  -- Signals
  SIGNAL count100                         : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL phase_all                        : std_logic;
  SIGNAL phase_0                          : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_1                          : std_logic;
  SIGNAL phase_1_tmp                      : std_logic;
  SIGNAL phase_91                         : std_logic;
  SIGNAL phase_91_tmp                     : std_logic;

BEGIN
  Counter100 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        count100 <= to_unsigned(1, 7);
      ELSIF clk_enable = '1' THEN
        IF count100 >= to_unsigned(99, 7) THEN
          count100 <= to_unsigned(0, 7);
        ELSE
          count100 <= count100 + to_unsigned(1, 7);
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter100;

  phase_all <= '1' WHEN clk_enable = '1' ELSE '0';

  temp_process1 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        phase_0 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_0 <= phase_0_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process1;

  phase_0_tmp <= '1' WHEN count100 = to_unsigned(99, 7) AND clk_enable = '1' ELSE '0';

  temp_process2 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        phase_1 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1 <= phase_1_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process2;

  phase_1_tmp <= '1' WHEN count100 = to_unsigned(0, 7) AND clk_enable = '1' ELSE '0';

  temp_process3 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        phase_91 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_91 <= phase_91_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process3;

  phase_91_tmp <= '1' WHEN count100 = to_unsigned(90, 7) AND clk_enable = '1' ELSE '0';

  enb <=  phase_all AND clk_enable;

  enb_1_100_0 <=  phase_0 AND clk_enable;

  enb_1_100_1 <=  phase_1 AND clk_enable;

  enb_1_100_91 <=  phase_91 AND clk_enable;


END rtl;

