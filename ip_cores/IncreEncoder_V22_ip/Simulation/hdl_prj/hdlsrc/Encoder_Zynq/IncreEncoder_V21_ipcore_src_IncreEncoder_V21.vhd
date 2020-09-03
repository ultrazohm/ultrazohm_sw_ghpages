-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Encoder_Zynq\IncreEncoder_V21_ipcore_src_IncreEncoder_V21.vhd
-- Created: 2018-05-22 10:32:47
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1e-08
-- Target subsystem base rate: 2e-08
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        2e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- omega                         ce_out        2e-08
-- omega_AXI4                    ce_out        2e-08
-- thete_el                      ce_out        2e-08
-- thete_el_AXI4                 ce_out        2e-08
-- theta_mech_AXI4               ce_out        2e-08
-- edge_rsvd                     ce_out        2e-08
-- count                         ce_out        2e-08
-- direction_AXI4                ce_out        2e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IncreEncoder_V21_ipcore_src_IncreEncoder_V21
-- Source Path: Encoder_Zynq/IncreEncoder_V21
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IncreEncoder_V21_ipcore_src_IncreEncoder_V21_pkg.ALL;

ENTITY IncreEncoder_V21_ipcore_src_IncreEncoder_V21 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        A                                 :   IN    std_logic;
        B                                 :   IN    std_logic;
        I                                 :   IN    std_logic;
        PI2_Inc_AXI4                      :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
        Timer_FPGA_ms_AXI4                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
        IncPerTurn_mech_AXI4              :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Inc_PerTurn_mech_2PI_AXI4         :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24_En24
        IncrementePerTurn_elek_AXI4       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        OverSamplFactorInv_AXI4           :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En15
        OverSamplFactor_AXI4              :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        ce_out                            :   OUT   std_logic;
        omega                             :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        omega_AXI4                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
        thete_el                          :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        thete_el_AXI4                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        theta_mech_AXI4                   :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En20
        edge_rsvd                         :   OUT   std_logic;
        count                             :   OUT   std_logic;
        direction_AXI4                    :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
        );
END IncreEncoder_V21_ipcore_src_IncreEncoder_V21;


ARCHITECTURE rtl OF IncreEncoder_V21_ipcore_src_IncreEncoder_V21 IS

  -- Component Declarations
  COMPONENT IncreEncoder_V21_ipcore_src_omega_by_measure_time
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          Edge_rsvd                       :   IN    std_logic;
          T                               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
          rps                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_En26
          NewMeasurement                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IncreEncoder_V21_ipcore_src_Subsystem
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          OmegaIn                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En11
          NewMeasurement                  :   IN    std_logic;
          SamplingFactorInv               :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En15
          SamplingFactor                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          OmegaOut                        :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En11
          );
  END COMPONENT;

  COMPONENT IncreEncoder_V21_ipcore_src_Check_Direction
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          A                               :   IN    std_logic;
          B                               :   IN    std_logic;
          Dir                             :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
          );
  END COMPONENT;

  COMPONENT IncreEncoder_V21_ipcore_src_Counter
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          Enable_ctr                      :   IN    std_logic;
          I_line                          :   IN    std_logic;
          Edge_rsvd                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- int8
          Reset_1                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT IncreEncoder_V21_ipcore_src_Counter_theta_ele
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          Edge_rsvd                       :   IN    std_logic_vector(7 DOWNTO 0);  -- int8
          Reset_1                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          IncsPerTurn                     :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          Dir                             :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
          count                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
          );
  END COMPONENT;

  COMPONENT IncreEncoder_V21_ipcore_src_Counter_theta
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          Edge_rsvd                       :   IN    std_logic_vector(7 DOWNTO 0);  -- int8
          Reset_1                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          IncsPerTurn                     :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          Dir                             :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
          count                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IncreEncoder_V21_ipcore_src_omega_by_measure_time
    USE ENTITY work.IncreEncoder_V21_ipcore_src_omega_by_measure_time(rtl);

  FOR ALL : IncreEncoder_V21_ipcore_src_Subsystem
    USE ENTITY work.IncreEncoder_V21_ipcore_src_Subsystem(rtl);

  FOR ALL : IncreEncoder_V21_ipcore_src_Check_Direction
    USE ENTITY work.IncreEncoder_V21_ipcore_src_Check_Direction(rtl);

  FOR ALL : IncreEncoder_V21_ipcore_src_Counter
    USE ENTITY work.IncreEncoder_V21_ipcore_src_Counter(rtl);

  FOR ALL : IncreEncoder_V21_ipcore_src_Counter_theta_ele
    USE ENTITY work.IncreEncoder_V21_ipcore_src_Counter_theta_ele(rtl);

  FOR ALL : IncreEncoder_V21_ipcore_src_Counter_theta
    USE ENTITY work.IncreEncoder_V21_ipcore_src_Counter_theta(rtl);

  -- Signals
  SIGNAL enb_1_2_0                        : std_logic;
  SIGNAL Logical2_out1                    : std_logic;
  SIGNAL Logical2_out1_1                  : std_logic;
  SIGNAL omega_by_measure_time_out1       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL omega_by_measure_time_out2       : std_logic;
  SIGNAL omega_by_measure_time_out1_unsigned : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL C_1_rps_1_omega_out1             : unsigned(15 DOWNTO 0);  -- ufix16_En15
  SIGNAL Mul_rps_omega_mul_temp           : unsigned(47 DOWNTO 0);  -- ufix48_En41
  SIGNAL Mul_rps_omega_out1               : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL hold2_out1                       : unsigned(31 DOWNTO 0);  -- ufix32_En26
  SIGNAL Divide_out1                      : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL hold_out1                        : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Subsystem_out1                   : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL Subsystem_out1_signed            : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL Check_Direction_out1             : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL Check_Direction_out1_signed      : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL hold1_out1                       : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL hold1_out1_1                     : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL Mul_Direction_mul_temp           : signed(27 DOWNTO 0);  -- sfix28_En11
  SIGNAL Mul_Direction_out1               : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL out_0_pipe_reg                   : vector_of_signed24(0 TO 2);  -- sfix24 [3]
  SIGNAL Mul_Direction_out1_1             : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL out_1_pipe_reg                   : vector_of_signed24(0 TO 2);  -- sfix24 [3]
  SIGNAL Subsystem_out1_1                 : signed(23 DOWNTO 0);  -- sfix24_En11
  SIGNAL PI2_Inc_AXI4_unsigned            : unsigned(23 DOWNTO 0);  -- ufix24_En24
  SIGNAL PI2_Inc_AXI4_1                   : unsigned(23 DOWNTO 0);  -- ufix24_En24
  SIGNAL Logical1_out1                    : std_logic;
  SIGNAL Logical1_out1_1                  : std_logic;
  SIGNAL Counter_out1                     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL Counter_out2                     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL Counter_theta_ele_out1           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Counter_theta_ele_out1_signed    : signed(15 DOWNTO 0);  -- int16
  SIGNAL Data_Type_Conversion1_out1       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL reset_old2_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Product_theta_el_mul_temp        : unsigned(39 DOWNTO 0);  -- ufix40_En24
  SIGNAL Product_theta_el_out1            : signed(23 DOWNTO 0);  -- sfix24_En20
  SIGNAL reset_old4_out1                  : signed(23 DOWNTO 0);  -- sfix24_En20
  SIGNAL reduced_reg                      : vector_of_signed24(0 TO 2);  -- sfix24 [3]
  SIGNAL reset_old4_out1_1                : signed(23 DOWNTO 0);  -- sfix24_En20
  SIGNAL Inc_PerTurn_mech_2PI_AXI4_unsigned : unsigned(23 DOWNTO 0);  -- ufix24_En24
  SIGNAL Inc_PerTurn_mech_2PI_AXI4_1      : unsigned(23 DOWNTO 0);  -- ufix24_En24
  SIGNAL Counter_theta_out1               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Counter_theta_out1_signed        : signed(15 DOWNTO 0);  -- int16
  SIGNAL Data_Type_Conversion9_out1       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL reset_old5_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Product_theta_mech_mul_temp      : unsigned(39 DOWNTO 0);  -- ufix40_En24
  SIGNAL Product_theta_mech_out1          : signed(23 DOWNTO 0);  -- sfix24_En20
  SIGNAL out_4_pipe_reg                   : vector_of_signed24(0 TO 3);  -- sfix24 [4]
  SIGNAL reset_old3_out1                  : signed(23 DOWNTO 0);  -- sfix24_En20
  SIGNAL Detec_edge_out1                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL reset_old1_out1                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL reset_old_switch1_out1           : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL reset_old_switch3_out1           : std_logic;
  SIGNAL out_5_pipe_reg                   : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL reset_old_switch3_out1_1         : std_logic;
  SIGNAL out_6_pipe_reg                   : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL Logical1_out1_2                  : std_logic;
  SIGNAL reduced_reg_1                    : vector_of_signed4(0 TO 2);  -- sfix4 [3]
  SIGNAL hold1_out1_2                     : signed(3 DOWNTO 0);  -- sfix4

BEGIN
  u_omega_by_measure_time : IncreEncoder_V21_ipcore_src_omega_by_measure_time
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2_0 => clk_enable,
              Edge_rsvd => Logical2_out1_1,
              T => Timer_FPGA_ms_AXI4,  -- ufix32_En26
              rps => omega_by_measure_time_out1,  -- ufix32_En26
              NewMeasurement => omega_by_measure_time_out2
              );

  u_Subsystem : IncreEncoder_V21_ipcore_src_Subsystem
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2_0 => clk_enable,
              OmegaIn => std_logic_vector(hold_out1),  -- sfix24_En11
              NewMeasurement => omega_by_measure_time_out2,
              SamplingFactorInv => OverSamplFactorInv_AXI4,  -- ufix16_En15
              SamplingFactor => OverSamplFactor_AXI4,  -- uint16
              OmegaOut => Subsystem_out1  -- sfix24_En11
              );

  u_Check_Direction : IncreEncoder_V21_ipcore_src_Check_Direction
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2_0 => clk_enable,
              A => A,
              B => B,
              Dir => Check_Direction_out1  -- sfix4
              );

  u_Counter : IncreEncoder_V21_ipcore_src_Counter
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2_0 => clk_enable,
              Enable_ctr => Logical1_out1_1,
              I_line => I,
              Edge_rsvd => Counter_out1,  -- int8
              Reset_1 => Counter_out2  -- uint8
              );

  u_Counter_theta_ele : IncreEncoder_V21_ipcore_src_Counter_theta_ele
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2_0 => clk_enable,
              Edge_rsvd => Counter_out1,  -- int8
              Reset_1 => Counter_out2,  -- uint8
              IncsPerTurn => IncrementePerTurn_elek_AXI4,  -- uint16
              Dir => std_logic_vector(hold1_out1),  -- sfix4
              count => Counter_theta_ele_out1  -- int16
              );

  u_Counter_theta : IncreEncoder_V21_ipcore_src_Counter_theta
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2_0 => clk_enable,
              Edge_rsvd => Counter_out1,  -- int8
              Reset_1 => Counter_out2,  -- uint8
              IncsPerTurn => IncPerTurn_mech_AXI4,  -- uint16
              Dir => std_logic_vector(hold1_out1),  -- sfix4
              count => Counter_theta_out1  -- int16
              );

  Logical2_out1 <=  NOT A;

  enb_1_2_0 <= clk_enable;

  Logical2_out_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Logical2_out1_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Logical2_out1_1 <= Logical2_out1;
      END IF;
    END IF;
  END PROCESS Logical2_out_pipe_process;


  omega_by_measure_time_out1_unsigned <= unsigned(omega_by_measure_time_out1);

  C_1_rps_1_omega_out1 <= to_unsigned(16#145F#, 16);

  Mul_rps_omega_mul_temp <= omega_by_measure_time_out1_unsigned * C_1_rps_1_omega_out1;
  
  Mul_rps_omega_out1 <= X"FFFFFFFF" WHEN Mul_rps_omega_mul_temp(47) /= '0' ELSE
      Mul_rps_omega_mul_temp(46 DOWNTO 15);

  hold2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        hold2_out1 <= to_unsigned(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        hold2_out1 <= Mul_rps_omega_out1;
      END IF;
    END IF;
  END PROCESS hold2_process;


  Divide_output : PROCESS (hold2_out1)
    VARIABLE c : unsigned(37 DOWNTO 0);
    VARIABLE div_temp : unsigned(37 DOWNTO 0);
  BEGIN
    IF hold2_out1 = to_unsigned(0, 32) THEN 
      c := unsigned'("11111111111111111111111111111111111111");
    ELSE 
      div_temp := unsigned'("10000000000000000000000000000000000000") / hold2_out1;
      c := div_temp;
    END IF;
    IF c(37 DOWNTO 23) /= "000000000000000" THEN 
      Divide_out1 <= X"7FFFFF";
    ELSE 
      Divide_out1 <= signed(c(23 DOWNTO 0));
    END IF;
  END PROCESS Divide_output;


  hold_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        hold_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        hold_out1 <= Divide_out1;
      END IF;
    END IF;
  END PROCESS hold_process;


  Subsystem_out1_signed <= signed(Subsystem_out1);

  Check_Direction_out1_signed <= signed(Check_Direction_out1);

  hold1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        hold1_out1 <= to_signed(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        hold1_out1 <= Check_Direction_out1_signed;
      END IF;
    END IF;
  END PROCESS hold1_process;


  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        hold1_out1_1 <= to_signed(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        hold1_out1_1 <= hold1_out1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Mul_Direction_mul_temp <= Subsystem_out1_signed * hold1_out1_1;
  
  Mul_Direction_out1 <= X"7FFFFF" WHEN (Mul_Direction_mul_temp(27) = '0') AND (Mul_Direction_mul_temp(26 DOWNTO 23) /= "0000") ELSE
      X"800000" WHEN (Mul_Direction_mul_temp(27) = '1') AND (Mul_Direction_mul_temp(26 DOWNTO 23) /= "1111") ELSE
      Mul_Direction_mul_temp(23 DOWNTO 0);

  out_0_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_0_pipe_reg <= (OTHERS => to_signed(16#000000#, 24));
      ELSIF enb_1_2_0 = '1' THEN
        out_0_pipe_reg(0) <= Mul_Direction_out1;
        out_0_pipe_reg(1 TO 2) <= out_0_pipe_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS out_0_pipe_process;

  Mul_Direction_out1_1 <= out_0_pipe_reg(2);

  omega <= std_logic_vector(Mul_Direction_out1_1);

  out_1_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_1_pipe_reg <= (OTHERS => to_signed(16#000000#, 24));
      ELSIF enb_1_2_0 = '1' THEN
        out_1_pipe_reg(0) <= Subsystem_out1_signed;
        out_1_pipe_reg(1 TO 2) <= out_1_pipe_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS out_1_pipe_process;

  Subsystem_out1_1 <= out_1_pipe_reg(2);

  omega_AXI4 <= std_logic_vector(Subsystem_out1_1);

  PI2_Inc_AXI4_unsigned <= unsigned(PI2_Inc_AXI4);

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        PI2_Inc_AXI4_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        PI2_Inc_AXI4_1 <= PI2_Inc_AXI4_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  Logical1_out1 <= A XOR B;

  Logical1_out_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Logical1_out1_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Logical1_out1_1 <= Logical1_out1;
      END IF;
    END IF;
  END PROCESS Logical1_out_pipe_process;


  Counter_theta_ele_out1_signed <= signed(Counter_theta_ele_out1);

  Data_Type_Conversion1_out1 <= unsigned(Counter_theta_ele_out1_signed);

  reset_old2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old2_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        reset_old2_out1 <= Data_Type_Conversion1_out1;
      END IF;
    END IF;
  END PROCESS reset_old2_process;


  Product_theta_el_mul_temp <= PI2_Inc_AXI4_1 * reset_old2_out1;
  Product_theta_el_out1 <= signed(Product_theta_el_mul_temp(27 DOWNTO 4));

  reset_old4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old4_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        reset_old4_out1 <= Product_theta_el_out1;
      END IF;
    END IF;
  END PROCESS reset_old4_process;


  reduced_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg <= (OTHERS => to_signed(16#000000#, 24));
      ELSIF enb_1_2_0 = '1' THEN
        reduced_reg(0) <= reset_old4_out1;
        reduced_reg(1 TO 2) <= reduced_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS reduced_1_process;

  reset_old4_out1_1 <= reduced_reg(2);

  thete_el <= std_logic_vector(reset_old4_out1_1);

  thete_el_AXI4 <= std_logic_vector(reset_old4_out1_1);

  Inc_PerTurn_mech_2PI_AXI4_unsigned <= unsigned(Inc_PerTurn_mech_2PI_AXI4);

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Inc_PerTurn_mech_2PI_AXI4_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        Inc_PerTurn_mech_2PI_AXI4_1 <= Inc_PerTurn_mech_2PI_AXI4_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  Counter_theta_out1_signed <= signed(Counter_theta_out1);

  Data_Type_Conversion9_out1 <= unsigned(Counter_theta_out1_signed);

  reset_old5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old5_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        reset_old5_out1 <= Data_Type_Conversion9_out1;
      END IF;
    END IF;
  END PROCESS reset_old5_process;


  Product_theta_mech_mul_temp <= Inc_PerTurn_mech_2PI_AXI4_1 * reset_old5_out1;
  Product_theta_mech_out1 <= signed(Product_theta_mech_mul_temp(27 DOWNTO 4));

  out_4_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_4_pipe_reg <= (OTHERS => to_signed(16#000000#, 24));
      ELSIF enb_1_2_0 = '1' THEN
        out_4_pipe_reg(0) <= Product_theta_mech_out1;
        out_4_pipe_reg(1 TO 3) <= out_4_pipe_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS out_4_pipe_process;

  reset_old3_out1 <= out_4_pipe_reg(3);

  theta_mech_AXI4 <= std_logic_vector(reset_old3_out1);

  
  reset_old_switch1_out1 <= reset_old1_out1 WHEN Detec_edge_out1 = to_unsigned(16#00#, 8) ELSE
      Data_Type_Conversion9_out1;

  reset_old1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reset_old1_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        reset_old1_out1 <= reset_old_switch1_out1;
      END IF;
    END IF;
  END PROCESS reset_old1_process;


  Detec_edge_out1 <= resize(Data_Type_Conversion9_out1, 8) - resize(reset_old1_out1, 8);

  Constant1_out1 <= '0';

  Constant_out1 <= '1';

  
  reset_old_switch3_out1 <= Constant1_out1 WHEN Detec_edge_out1 = to_unsigned(16#00#, 8) ELSE
      Constant_out1;

  out_5_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_5_pipe_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        out_5_pipe_reg(0) <= reset_old_switch3_out1;
        out_5_pipe_reg(1 TO 2) <= out_5_pipe_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS out_5_pipe_process;

  reset_old_switch3_out1_1 <= out_5_pipe_reg(2);

  out_6_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_6_pipe_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        out_6_pipe_reg(0) <= Logical1_out1_1;
        out_6_pipe_reg(1 TO 2) <= out_6_pipe_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS out_6_pipe_process;

  Logical1_out1_2 <= out_6_pipe_reg(2);

  reduced_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        reduced_reg_1 <= (OTHERS => to_signed(16#0#, 4));
      ELSIF enb_1_2_0 = '1' THEN
        reduced_reg_1(0) <= hold1_out1_1;
        reduced_reg_1(1 TO 2) <= reduced_reg_1(0 TO 1);
      END IF;
    END IF;
  END PROCESS reduced_2_process;

  hold1_out1_2 <= reduced_reg_1(2);

  direction_AXI4 <= std_logic_vector(hold1_out1_2);

  ce_out <= clk_enable;

  edge_rsvd <= reset_old_switch3_out1_1;

  count <= Logical1_out1_2;

END rtl;

