-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_src_dot_product_3.vhd
-- Created: 2022-05-18 14:41:25
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_src_dot_product_3
-- Source Path: dot_product_3
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_inverter_3ph_src_uz_inverter_3ph_pkg.ALL;

ENTITY uz_inverter_3ph_src_dot_product_3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in1                               :   IN    vector_of_std_logic_vector32(0 TO 2);  -- single [3]
        in2                               :   IN    vector_of_std_logic_vector32(0 TO 2);  -- single [3]
        out1                              :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END uz_inverter_3ph_src_dot_product_3;


ARCHITECTURE rtl OF uz_inverter_3ph_src_dot_product_3 IS

  -- Component Declarations
  COMPONENT uz_inverter_3ph_src_nfp_mul_single
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT uz_inverter_3ph_src_nfp_add_single
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_inverter_3ph_src_nfp_mul_single
    USE ENTITY work.uz_inverter_3ph_src_nfp_mul_single(rtl);

  FOR ALL : uz_inverter_3ph_src_nfp_add_single
    USE ENTITY work.uz_inverter_3ph_src_nfp_add_single(rtl);

  -- Signals
  SIGNAL nfp_out_1_1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_2_1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL sum_stage1_1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_3_1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL intdelay_reg                     : vector_of_std_logic_vector32(0 TO 5);  -- ufix32 [6]
  SIGNAL intdelay_reg_next                : vector_of_std_logic_vector32(0 TO 5);  -- ufix32 [6]
  SIGNAL sum_stage1_2                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL sum_stage2_1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_mul_comp : uz_inverter_3ph_src_nfp_mul_single
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              nfp_in1 => in1(0),  -- single
              nfp_in2 => in2(0),  -- single
              nfp_out => nfp_out_1_1  -- single
              );

  u_nfp_mul_comp_1 : uz_inverter_3ph_src_nfp_mul_single
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              nfp_in1 => in1(1),  -- single
              nfp_in2 => in2(1),  -- single
              nfp_out => nfp_out_2_1  -- single
              );

  u_nfp_add_comp : uz_inverter_3ph_src_nfp_add_single
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              nfp_in1 => nfp_out_1_1,  -- single
              nfp_in2 => nfp_out_2_1,  -- single
              nfp_out => sum_stage1_1  -- single
              );

  u_nfp_mul_comp_2 : uz_inverter_3ph_src_nfp_mul_single
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              nfp_in1 => in1(2),  -- single
              nfp_in2 => in2(2),  -- single
              nfp_out => nfp_out_3_1  -- single
              );

  u_nfp_add_comp_1 : uz_inverter_3ph_src_nfp_add_single
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              nfp_in1 => sum_stage1_1,  -- single
              nfp_in2 => sum_stage1_2,  -- single
              nfp_out => sum_stage2_1  -- single
              );

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      intdelay_reg(0) <= X"00000000";
      intdelay_reg(1) <= X"00000000";
      intdelay_reg(2) <= X"00000000";
      intdelay_reg(3) <= X"00000000";
      intdelay_reg(4) <= X"00000000";
      intdelay_reg(5) <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        intdelay_reg(0) <= intdelay_reg_next(0);
        intdelay_reg(1) <= intdelay_reg_next(1);
        intdelay_reg(2) <= intdelay_reg_next(2);
        intdelay_reg(3) <= intdelay_reg_next(3);
        intdelay_reg(4) <= intdelay_reg_next(4);
        intdelay_reg(5) <= intdelay_reg_next(5);
      END IF;
    END IF;
  END PROCESS intdelay_process;

  sum_stage1_2 <= intdelay_reg(5);
  intdelay_reg_next(0) <= nfp_out_3_1;
  intdelay_reg_next(1) <= intdelay_reg(0);
  intdelay_reg_next(2) <= intdelay_reg(1);
  intdelay_reg_next(3) <= intdelay_reg(2);
  intdelay_reg_next(4) <= intdelay_reg(3);
  intdelay_reg_next(5) <= intdelay_reg(4);

  out1 <= sum_stage2_1;

END rtl;

