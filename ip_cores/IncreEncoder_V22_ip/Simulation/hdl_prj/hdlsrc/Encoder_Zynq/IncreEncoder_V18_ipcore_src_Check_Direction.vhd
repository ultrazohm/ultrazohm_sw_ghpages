-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_V18_ipcore_src_Check_Direction.vhd
-- Created: 2017-07-30 17:53:19
-- 
-- Generated by MATLAB 9.0 and HDL Coder 3.8
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V18_ipcore_src_Check_Direction
-- Source Path: Encoder_Zynq/IncreEncoder_V18/Check_Direction
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IncreEncoder_V18_ipcore_src_Check_Direction IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        A                                 :   IN    std_logic;
        B                                 :   IN    std_logic;
        Dir                               :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
        );
END IncreEncoder_V18_ipcore_src_Check_Direction;


ARCHITECTURE rtl OF IncreEncoder_V18_ipcore_src_Check_Direction IS

  -- Signals
  SIGNAL Add_out1                         : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL count_old_out1                   : std_logic;
  SIGNAL count_old_switch_out1            : std_logic;
  SIGNAL Add_sub_cast                     : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Add_sub_cast_1                   : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL TrnRight_sub_cast                : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL TrnRight_out1                    : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL nothing1_out1                    : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL TurnRight_out1                   : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL T_count_switch_out1              : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Add1_out1                        : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL count_old1_out1                  : std_logic;
  SIGNAL count_old_switch1_out1           : std_logic;
  SIGNAL Add1_sub_cast                    : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Add1_sub_cast_1                  : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL TrnLeft_sub_cast                 : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL TrnLeft_out1                     : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL nothing_out1                     : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL TurnLeft_out1                    : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL speed_old_switch_out1            : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Change_out1                      : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Change1_out1                     : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Add2_out1                        : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL new_value_out1                   : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL count_old2_out1                  : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Save_Direction_out1              : signed(3 DOWNTO 0);  -- sfix4

BEGIN
  -- <S10>/count_old_switch
  
  count_old_switch_out1 <= count_old_out1 WHEN Add_out1 = to_signed(16#0#, 4) ELSE
      A;

  -- <S10>/count_old
  count_old_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        count_old_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        count_old_out1 <= count_old_switch_out1;
      END IF;
    END IF;
  END PROCESS count_old_process;


  -- <S10>/Add
  Add_sub_cast <= '0' & '0' & '0' & A;
  Add_sub_cast_1 <= '0' & '0' & '0' & count_old_out1;
  Add_out1 <= Add_sub_cast - Add_sub_cast_1;

  -- <S10>/TrnRight
  TrnRight_sub_cast <= '0' & '0' & '0' & B;
  TrnRight_out1 <= Add_out1 - TrnRight_sub_cast;

  
  switch_compare_1 <= '1' WHEN TrnRight_out1 >= to_signed(16#1#, 4) ELSE
      '0';

  -- <S10>/nothing1
  nothing1_out1 <= to_signed(16#0#, 4);

  -- <S10>/TurnRight
  TurnRight_out1 <= to_signed(16#1#, 4);

  -- <S10>/T_count_switch
  
  T_count_switch_out1 <= nothing1_out1 WHEN switch_compare_1 = '0' ELSE
      TurnRight_out1;

  -- <S10>/count_old_switch1
  
  count_old_switch1_out1 <= count_old1_out1 WHEN Add1_out1 = to_signed(16#0#, 4) ELSE
      B;

  -- <S10>/count_old1
  count_old1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        count_old1_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        count_old1_out1 <= count_old_switch1_out1;
      END IF;
    END IF;
  END PROCESS count_old1_process;


  -- <S10>/Add1
  Add1_sub_cast <= '0' & '0' & '0' & B;
  Add1_sub_cast_1 <= '0' & '0' & '0' & count_old1_out1;
  Add1_out1 <= Add1_sub_cast - Add1_sub_cast_1;

  -- <S10>/TrnLeft
  TrnLeft_sub_cast <= '0' & '0' & '0' & A;
  TrnLeft_out1 <= Add1_out1 - TrnLeft_sub_cast;

  
  switch_compare_1_1 <= '1' WHEN TrnLeft_out1 >= to_signed(16#1#, 4) ELSE
      '0';

  -- <S10>/nothing
  nothing_out1 <= to_signed(16#0#, 4);

  -- <S10>/TurnLeft
  TurnLeft_out1 <= to_signed(-16#1#, 4);

  -- <S10>/speed_old_switch
  
  speed_old_switch_out1 <= nothing_out1 WHEN switch_compare_1_1 = '0' ELSE
      TurnLeft_out1;

  -- <S10>/Change
  Change_out1 <= T_count_switch_out1 + speed_old_switch_out1;

  -- <S10>/Change1
  Change1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Change1_out1 <= to_signed(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        Change1_out1 <= Change_out1;
      END IF;
    END IF;
  END PROCESS Change1_process;


  -- <S10>/Add2
  Add2_out1 <= T_count_switch_out1 + speed_old_switch_out1;

  -- <S10>/new_value
  new_value_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        new_value_out1 <= to_signed(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        new_value_out1 <= Add2_out1;
      END IF;
    END IF;
  END PROCESS new_value_process;


  -- <S10>/Save_Direction
  
  Save_Direction_out1 <= count_old2_out1 WHEN Change1_out1 = to_signed(16#0#, 4) ELSE
      new_value_out1;

  -- <S10>/count_old2
  count_old2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        count_old2_out1 <= to_signed(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        count_old2_out1 <= Save_Direction_out1;
      END IF;
    END IF;
  END PROCESS count_old2_process;


  Dir <= std_logic_vector(count_old2_out1);

  -- <S10>/Scope6

END rtl;

