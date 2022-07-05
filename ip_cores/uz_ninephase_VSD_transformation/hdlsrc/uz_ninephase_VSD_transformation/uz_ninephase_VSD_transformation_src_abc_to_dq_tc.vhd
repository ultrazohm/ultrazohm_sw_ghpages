-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj123\hdlsrc\uz_ninephase_VSD_transformation\uz_ninephase_VSD_transformation_src_abc_to_dq_tc.vhd
-- Created: 2022-06-30 15:39:51
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_ninephase_VSD_transformation_src_abc_to_dq_tc
-- Source Path: abc_to_dq_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_100_0 : 100x slower than clk with last phase
-- enb_1_100_1 : 100x slower than clk with phase 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_ninephase_VSD_transformation_src_abc_to_dq_tc IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_100_0                       :   OUT   std_logic;
        enb_1_100_1                       :   OUT   std_logic
        );
END uz_ninephase_VSD_transformation_src_abc_to_dq_tc;


ARCHITECTURE rtl OF uz_ninephase_VSD_transformation_src_abc_to_dq_tc IS

  -- Signals
  SIGNAL count100                         : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL phase_all                        : std_logic;
  SIGNAL phase_0                          : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_1                          : std_logic;
  SIGNAL phase_1_tmp                      : std_logic;

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

  enb <=  phase_all AND clk_enable;

  enb_1_100_0 <=  phase_0 AND clk_enable;

  enb_1_100_1 <=  phase_1 AND clk_enable;


END rtl;

