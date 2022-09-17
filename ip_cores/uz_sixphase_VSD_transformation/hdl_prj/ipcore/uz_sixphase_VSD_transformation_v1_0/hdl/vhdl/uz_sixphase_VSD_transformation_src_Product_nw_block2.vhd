-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw_working\ip_cores\uz_sixphase_VSD_transformation\hdl_prj\hdlsrc\uz_sixphase_VSD_transformation\uz_sixphase_VSD_transformation_src_Product_nw_block2.vhd
-- Created: 2022-09-17 18:31:03
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_sixphase_VSD_transformation_src_Product_nw_block2
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_sixphase_VSD_transformation_src_Product_nw_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        in0                               :   IN    std_logic_vector(26 DOWNTO 0);  -- sfix27_En16
        in1                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        globalSchedule                    :   IN    std_logic;
        out0                              :   OUT   std_logic_vector(26 DOWNTO 0)  -- sfix27_En16
        );
END uz_sixphase_VSD_transformation_src_Product_nw_block2;


ARCHITECTURE rtl OF uz_sixphase_VSD_transformation_src_Product_nw_block2 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in0_signed                       : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Product_C2ReIm_1_C2ReIm_B        : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL in1_signed                       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Product_C2ReIm_2_C2ReIm_A        : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Product_mul_temp                 : signed(44 DOWNTO 0);  -- sfix45_En32
  SIGNAL Product_Im_BC                    : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Product_Im_BC_1                  : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Product_Im_BC_bypass             : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Product_Im_BC_last_value         : signed(26 DOWNTO 0);  -- sfix27_En16

BEGIN
  enb_gated <= globalSchedule AND enb;

  in0_signed <= signed(in0);

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Product_C2ReIm_1_C2ReIm_B <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Product_C2ReIm_1_C2ReIm_B <= in0_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  in1_signed <= signed(in1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Product_C2ReIm_2_C2ReIm_A <= to_signed(16#00000#, 18);
      ELSIF enb_gated = '1' THEN
        Product_C2ReIm_2_C2ReIm_A <= in1_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Product_mul_temp <= Product_C2ReIm_1_C2ReIm_B * Product_C2ReIm_2_C2ReIm_A;
  Product_Im_BC <= Product_mul_temp(42 DOWNTO 16);

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Product_Im_BC_1 <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Product_Im_BC_1 <= Product_Im_BC;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Product_Im_BC_last_value <= to_signed(16#0000000#, 27);
      ELSIF enb_gated = '1' THEN
        Product_Im_BC_last_value <= Product_Im_BC_bypass;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Product_Im_BC_bypass <= Product_Im_BC_last_value WHEN globalSchedule = '0' ELSE
      Product_Im_BC_1;

  out0 <= std_logic_vector(Product_Im_BC_bypass);

END rtl;

