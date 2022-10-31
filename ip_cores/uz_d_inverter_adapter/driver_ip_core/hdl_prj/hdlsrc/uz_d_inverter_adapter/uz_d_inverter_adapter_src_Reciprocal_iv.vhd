-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\uz_d_inverter_adapter\uz_d_inverter_adapter_src_Reciprocal_iv.vhd
-- Created: 2022-05-31 17:55:04
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_d_inverter_adapter_src_Reciprocal_iv
-- Source Path: uz_d_inverter_adapter/uz_d_inverter_adapter/PWMdutyFreqDetection/Reciprocal/Reciprocal_iv
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_d_inverter_adapter_src_uz_d_inverter_adapter_pkg.ALL;

ENTITY uz_d_inverter_adapter_src_Reciprocal_iv IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        ain                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En32
        xinit                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        inzero                            :   OUT   std_logic;  -- ufix1
        aout                              :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32_En32
        );
END uz_d_inverter_adapter_src_Reciprocal_iv;


ARCHITECTURE rtl OF uz_d_inverter_adapter_src_Reciprocal_iv IS

  -- Component Declarations
  COMPONENT uz_d_inverter_adapter_src_NewtonPolynomialIVStage
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          ain                             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En32
          mulin                           :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34_En30
          adderin                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          xinitinterm                     :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : uz_d_inverter_adapter_src_NewtonPolynomialIVStage
    USE ENTITY work.uz_d_inverter_adapter_src_NewtonPolynomialIVStage(rtl);

  -- Signals
  SIGNAL ain_unsigned                     : unsigned(31 DOWNTO 0);  -- ufix32_En32
  SIGNAL ain_reg_reg                      : vector_of_unsigned32(0 TO 1);  -- ufix32 [2]
  SIGNAL aout_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32_En32
  SIGNAL constA                           : signed(33 DOWNTO 0);  -- sfix34_En30
  SIGNAL constB                           : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL constC                           : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL xinitreg                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL xinitreg_signed                  : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL xinitreg_1                       : signed(33 DOWNTO 0);  -- sfix34_En30
  SIGNAL constC_reg_reg                   : vector_of_signed32(0 TO 3);  -- sfix32 [4]
  SIGNAL constC_p                         : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL xinit_tmp                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL mstwobit                         : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  -- Polynomial initial value stage of the RecipSqrtSingleRate Implementation using Newton Method

  u_NewtonPolynomialIVStage1 : uz_d_inverter_adapter_src_NewtonPolynomialIVStage
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              ain => ain,  -- ufix32_En32
              mulin => std_logic_vector(constA),  -- sfix34_En30
              adderin => std_logic_vector(constB),  -- sfix32_En28
              xinitinterm => xinitreg  -- sfix32_En28
              );

  u_NewtonPolynomialIVStage2 : uz_d_inverter_adapter_src_NewtonPolynomialIVStage
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              ain => std_logic_vector(aout_tmp),  -- ufix32_En32
              mulin => std_logic_vector(xinitreg_1),  -- sfix34_En30
              adderin => std_logic_vector(constC_p),  -- sfix32_En28
              xinitinterm => xinit_tmp  -- sfix32_En28
              );

  ain_unsigned <= unsigned(ain);

  -- Pipeline registers
  ain_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        ain_reg_reg <= (OTHERS => to_unsigned(0, 32));
      ELSIF enb = '1' THEN
        ain_reg_reg(0) <= ain_unsigned;
        ain_reg_reg(1) <= ain_reg_reg(0);
      END IF;
    END IF;
  END PROCESS ain_reg_process;

  aout_tmp <= ain_reg_reg(1);

  constA <= to_signed(1710685963, 34);

  constB <= to_signed(-854319736, 32);

  constC <= to_signed(704821885, 32);

  xinitreg_signed <= signed(xinitreg);

  xinitreg_1 <= xinitreg_signed & '0' & '0';

  -- Pipeline registers
  constC_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        constC_reg_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        constC_reg_reg(0) <= constC;
        constC_reg_reg(1 TO 3) <= constC_reg_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS constC_reg_process;

  constC_p <= constC_reg_reg(3);

  mstwobit <= ain_unsigned(31 DOWNTO 30);

  
  inzero <= '1' WHEN mstwobit = to_unsigned(16#0#, 2) ELSE
      '0';

  aout <= std_logic_vector(aout_tmp);

  xinit <= xinit_tmp;

END rtl;

