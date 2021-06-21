-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/uz_pmsm_model/uz_pmsm_model_addr_decoder.vhd
-- Created: 2021-06-17 18:12:47
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_pmsm_model_addr_decoder
-- Source Path: uz_pmsm_model/uz_pmsm_model_axi_lite/uz_pmsm_model_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY uz_pmsm_model_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_i_d                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_i_q                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_torque                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_u_d                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_u_q                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_omega_mech                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_reset                       :   OUT   std_logic  -- ufix1
        );
END uz_pmsm_model_addr_decoder;


ARCHITECTURE rtl OF uz_pmsm_model_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_i_d_unsigned                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_i_q_unsigned                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_torque_unsigned             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_torque_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_i_q_1_1               : std_logic;  -- ufix1
  SIGNAL decode_sel_i_d_1_1               : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_i_d                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_i_d_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_i_q                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_i_q_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_torque                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_torque_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL write_concats_axi_enable_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_u_d_1_1               : std_logic;  -- ufix1
  SIGNAL reg_enb_u_d_1_1                  : std_logic;  -- ufix1
  SIGNAL data_reg_u_d_1_1                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_u_q_1_1               : std_logic;  -- ufix1
  SIGNAL reg_enb_u_q_1_1                  : std_logic;  -- ufix1
  SIGNAL data_reg_u_q_1_1                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_omega_mech_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_omega_mech_1_1           : std_logic;  -- ufix1
  SIGNAL data_reg_omega_mech_1_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_reset_1_1             : std_logic;  -- ufix1
  SIGNAL reg_enb_reset_1_1                : std_logic;  -- ufix1
  SIGNAL data_in_reset                    : std_logic;  -- ufix1
  SIGNAL data_reg_reset_1_1               : std_logic;  -- ufix1
  SIGNAL write_concats_reset_1            : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  const_1 <= '1';

  enb <= const_1;

  read_i_d_unsigned <= unsigned(read_i_d);

  read_i_q_unsigned <= unsigned(read_i_q);

  read_torque_unsigned <= unsigned(read_torque);

  
  decode_sel_torque_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  
  decode_sel_i_q_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  
  decode_sel_i_d_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_ip_timestamp_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_ip_timestamp <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp_1_1 <= const_0 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
      read_reg_ip_timestamp;

  reg_i_d_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_i_d <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_i_d <= read_i_d_unsigned;
      END IF;
    END IF;
  END PROCESS reg_i_d_process;


  
  decode_rd_i_d_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_i_d_1_1 = '0' ELSE
      read_reg_i_d;

  reg_i_q_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_i_q <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_i_q <= read_i_q_unsigned;
      END IF;
    END IF;
  END PROCESS reg_i_q_process;


  
  decode_rd_i_q_1_1 <= decode_rd_i_d_1_1 WHEN decode_sel_i_q_1_1 = '0' ELSE
      read_reg_i_q;

  reg_torque_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_torque <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_torque <= read_torque_unsigned;
      END IF;
    END IF;
  END PROCESS reg_torque_process;


  
  decode_rd_torque_1_1 <= decode_rd_i_q_1_1 WHEN decode_sel_torque_1_1 = '0' ELSE
      read_reg_torque;

  data_read <= std_logic_vector(decode_rd_torque_1_1);

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  reg_axi_enable_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_axi_enable_1_1 <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  write_concats_axi_enable_1 <= data_reg_axi_enable_1_1;

  write_axi_enable <= write_concats_axi_enable_1;

  
  decode_sel_u_d_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_u_d_1_1 <= decode_sel_u_d_1_1 AND wr_enb;

  reg_u_d_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_u_d_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_u_d_1_1 = '1' THEN
        data_reg_u_d_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_u_d_1_1_process;


  write_u_d <= std_logic_vector(data_reg_u_d_1_1);

  
  decode_sel_u_q_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  reg_enb_u_q_1_1 <= decode_sel_u_q_1_1 AND wr_enb;

  reg_u_q_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_u_q_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_u_q_1_1 = '1' THEN
        data_reg_u_q_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_u_q_1_1_process;


  write_u_q <= std_logic_vector(data_reg_u_q_1_1);

  
  decode_sel_omega_mech_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  reg_enb_omega_mech_1_1 <= decode_sel_omega_mech_1_1 AND wr_enb;

  reg_omega_mech_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_omega_mech_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_omega_mech_1_1 = '1' THEN
        data_reg_omega_mech_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_omega_mech_1_1_process;


  write_omega_mech <= std_logic_vector(data_reg_omega_mech_1_1);

  
  decode_sel_reset_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  reg_enb_reset_1_1 <= decode_sel_reset_1_1 AND wr_enb;

  data_in_reset <= data_write_unsigned(0);

  reg_reset_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        data_reg_reset_1_1 <= '0';
      ELSIF enb = '1' AND reg_enb_reset_1_1 = '1' THEN
        data_reg_reset_1_1 <= data_in_reset;
      END IF;
    END IF;
  END PROCESS reg_reset_1_1_process;


  write_concats_reset_1 <= data_reg_reset_1_1;

  write_reset <= write_concats_reset_1;

END rtl;

