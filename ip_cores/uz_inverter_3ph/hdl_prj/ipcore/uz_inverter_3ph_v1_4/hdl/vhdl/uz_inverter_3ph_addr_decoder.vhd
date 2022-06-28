-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\valen\Documents\repos\UZ\ultrazohm_sw\ip_cores\uz_inverter_3ph\hdl_prj\hdlsrc\uz_inverter_3phgm\uz_inverter_3ph_addr_decoder.vhd
-- Created: 2022-05-13 08:58:03
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: uz_inverter_3ph_addr_decoder
-- Source Path: uz_inverter_3ph/uz_inverter_3ph_axi4/uz_inverter_3ph_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.uz_inverter_3ph_pkg.ALL;

ENTITY uz_inverter_3ph_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_u_abc_ps                     :   IN    vector_of_std_logic_vector32(0 TO 2);  -- ufix32 [3]
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_switch_pspl_abc             :   OUT   std_logic;  -- ufix1
        write_switch_pspl_gate            :   OUT   std_logic;  -- ufix1
        write_u_dc                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_i_abc_ps                    :   OUT   vector_of_std_logic_vector32(0 TO 2);  -- ufix32 [3]
        write_gate_ps                     :   OUT   std_logic_vector(0 TO 5)  -- ufix1 [6]
        );
END uz_inverter_3ph_addr_decoder;


ARCHITECTURE rtl OF uz_inverter_3ph_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL decode_sel_u_abc_ps_1_1          : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_u_abc_ps              : std_logic;  -- ufix1
  SIGNAL strobe_sel_u_abc_ps              : std_logic;  -- ufix1
  SIGNAL const_zero                       : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL strobe_in_u_abc_ps               : std_logic;  -- ufix1
  SIGNAL strobe_sw_u_abc_ps               : std_logic;  -- ufix1
  SIGNAL strobe_reg_u_abc_ps              : std_logic;  -- ufix1
  SIGNAL read_u_abc_ps_unsigned           : vector_of_unsigned32(0 TO 2);  -- ufix32 [3]
  SIGNAL sync_reg_u_abc_ps                : vector_of_unsigned32(0 TO 2);  -- ufix32 [3]
  SIGNAL data_slice_u_abc_ps_1            : vector_of_unsigned32(0 TO 2);  -- ufix32 [3]
  SIGNAL decode_sel_u_abc_ps_1_2          : std_logic;  -- ufix1
  SIGNAL data_slice_u_abc_ps_1_0          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_u_abc_ps_1_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_u_abc_ps_1_3          : std_logic;  -- ufix1
  SIGNAL data_slice_u_abc_ps_1_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_u_abc_ps_1_2           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_slice_u_abc_ps_1_2          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_u_abc_ps_1_3           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL write_concats_axi_enable_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_switch_pspl_abc_1_1   : std_logic;  -- ufix1
  SIGNAL reg_enb_switch_pspl_abc_1_1      : std_logic;  -- ufix1
  SIGNAL data_in_switch_pspl_abc          : std_logic;  -- ufix1
  SIGNAL data_reg_switch_pspl_abc_1_1     : std_logic;  -- ufix1
  SIGNAL write_concats_switch_pspl_abc_1  : std_logic;  -- ufix1
  SIGNAL decode_sel_switch_pspl_gate_1_1  : std_logic;  -- ufix1
  SIGNAL reg_enb_switch_pspl_gate_1_1     : std_logic;  -- ufix1
  SIGNAL data_in_switch_pspl_gate         : std_logic;  -- ufix1
  SIGNAL data_reg_switch_pspl_gate_1_1    : std_logic;  -- ufix1
  SIGNAL write_concats_switch_pspl_gate_1 : std_logic;  -- ufix1
  SIGNAL decode_sel_u_dc_1_1              : std_logic;  -- ufix1
  SIGNAL reg_enb_u_dc_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_u_dc_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_i_abc_ps              : std_logic;  -- ufix1
  SIGNAL strobe_sel_i_abc_ps              : std_logic;  -- ufix1
  SIGNAL const_zero_1                     : std_logic;  -- ufix1
  SIGNAL strobe_in_i_abc_ps               : std_logic;  -- ufix1
  SIGNAL strobe_sw_i_abc_ps               : std_logic;  -- ufix1
  SIGNAL decode_sel_i_abc_ps_1_1          : std_logic;  -- ufix1
  SIGNAL reg_enb_i_abc_ps_1_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_i_abc_ps_2_1          : std_logic;  -- ufix1
  SIGNAL reg_enb_i_abc_ps_2_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_i_abc_ps_3_1          : std_logic;  -- ufix1
  SIGNAL reg_enb_i_abc_ps_3_1             : std_logic;  -- ufix1
  SIGNAL strobe_reg_i_abc_ps              : std_logic;  -- ufix1
  SIGNAL data_reg_i_abc_ps_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_reg_i_abc_ps_2_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_reg_i_abc_ps_3_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL write_reg_i_abc_ps               : vector_of_unsigned32(0 TO 2);  -- ufix32 [3]
  SIGNAL sync_reg_i_abc_ps_1              : vector_of_unsigned32(0 TO 2);  -- ufix32 [3]
  SIGNAL decode_sel_gate_ps               : std_logic;  -- ufix1
  SIGNAL strobe_sel_gate_ps               : std_logic;  -- ufix1
  SIGNAL const_zero_2                     : std_logic;  -- ufix1
  SIGNAL strobe_in_gate_ps                : std_logic;  -- ufix1
  SIGNAL strobe_sw_gate_ps                : std_logic;  -- ufix1
  SIGNAL decode_sel_gate_ps_1_1           : std_logic;  -- ufix1
  SIGNAL reg_enb_gate_ps_1_1              : std_logic;  -- ufix1
  SIGNAL data_in_gate_ps                  : std_logic;  -- ufix1
  SIGNAL decode_sel_gate_ps_2_1           : std_logic;  -- ufix1
  SIGNAL reg_enb_gate_ps_2_1              : std_logic;  -- ufix1
  SIGNAL decode_sel_gate_ps_3_1           : std_logic;  -- ufix1
  SIGNAL reg_enb_gate_ps_3_1              : std_logic;  -- ufix1
  SIGNAL decode_sel_gate_ps_4_1           : std_logic;  -- ufix1
  SIGNAL reg_enb_gate_ps_4_1              : std_logic;  -- ufix1
  SIGNAL decode_sel_gate_ps_5_1           : std_logic;  -- ufix1
  SIGNAL reg_enb_gate_ps_5_1              : std_logic;  -- ufix1
  SIGNAL decode_sel_gate_ps_6_1           : std_logic;  -- ufix1
  SIGNAL reg_enb_gate_ps_6_1              : std_logic;  -- ufix1
  SIGNAL strobe_reg_gate_ps               : std_logic;  -- ufix1
  SIGNAL data_reg_gate_ps_1_1             : std_logic;  -- ufix1
  SIGNAL write_concats_gate_ps_1          : std_logic;  -- ufix1
  SIGNAL data_reg_gate_ps_2_1             : std_logic;  -- ufix1
  SIGNAL write_concats_gate_ps_2          : std_logic;  -- ufix1
  SIGNAL data_reg_gate_ps_3_1             : std_logic;  -- ufix1
  SIGNAL write_concats_gate_ps_3          : std_logic;  -- ufix1
  SIGNAL data_reg_gate_ps_4_1             : std_logic;  -- ufix1
  SIGNAL write_concats_gate_ps_4          : std_logic;  -- ufix1
  SIGNAL data_reg_gate_ps_5_1             : std_logic;  -- ufix1
  SIGNAL write_concats_gate_ps_5          : std_logic;  -- ufix1
  SIGNAL data_reg_gate_ps_6_1             : std_logic;  -- ufix1
  SIGNAL write_concats_gate_ps_6          : std_logic;  -- ufix1
  SIGNAL write_reg_gate_ps                : std_logic_vector(0 TO 5);  -- ufix1 [6]
  SIGNAL sync_reg_gate_ps_1               : std_logic_vector(0 TO 5);  -- ufix1 [6]

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  const_1 <= '1';

  enb <= const_1;

  
  decode_sel_u_abc_ps_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0064#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_ip_timestamp_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_ip_timestamp <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp_1_1 <= const_0 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
      read_reg_ip_timestamp;

  
  decode_sel_u_abc_ps <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0068#, 14) ELSE
      '0';

  strobe_sel_u_abc_ps <= decode_sel_u_abc_ps AND wr_enb;

  const_zero <= '0';

  data_write_unsigned <= unsigned(data_write);

  strobe_in_u_abc_ps <= data_write_unsigned(0);

  
  strobe_sw_u_abc_ps <= const_zero WHEN strobe_sel_u_abc_ps = '0' ELSE
      strobe_in_u_abc_ps;

  reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      strobe_reg_u_abc_ps <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        strobe_reg_u_abc_ps <= strobe_sw_u_abc_ps;
      END IF;
    END IF;
  END PROCESS reg_process;


  outputgen1: FOR k IN 0 TO 2 GENERATE
    read_u_abc_ps_unsigned(k) <= unsigned(read_u_abc_ps(k));
  END GENERATE;

  reg_u_abc_ps_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sync_reg_u_abc_ps(0) <= to_unsigned(0, 32);
      sync_reg_u_abc_ps(1) <= to_unsigned(0, 32);
      sync_reg_u_abc_ps(2) <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND strobe_reg_u_abc_ps = '1' THEN
        sync_reg_u_abc_ps(0) <= read_u_abc_ps_unsigned(0);
        sync_reg_u_abc_ps(1) <= read_u_abc_ps_unsigned(1);
        sync_reg_u_abc_ps(2) <= read_u_abc_ps_unsigned(2);
      END IF;
    END IF;
  END PROCESS reg_u_abc_ps_process;


  data_slice_u_abc_ps_1(0) <= sync_reg_u_abc_ps(0);
  data_slice_u_abc_ps_1(1) <= sync_reg_u_abc_ps(1);
  data_slice_u_abc_ps_1(2) <= sync_reg_u_abc_ps(2);

  
  decode_sel_u_abc_ps_1_2 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0065#, 14) ELSE
      '0';

  data_slice_u_abc_ps_1_0 <= data_slice_u_abc_ps_1(0);

  
  decode_rd_u_abc_ps_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_u_abc_ps_1_1 = '0' ELSE
      data_slice_u_abc_ps_1_0;

  
  decode_sel_u_abc_ps_1_3 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0066#, 14) ELSE
      '0';

  data_slice_u_abc_ps_1_1 <= data_slice_u_abc_ps_1(1);

  
  decode_rd_u_abc_ps_1_2 <= decode_rd_u_abc_ps_1_1 WHEN decode_sel_u_abc_ps_1_2 = '0' ELSE
      data_slice_u_abc_ps_1_1;

  data_slice_u_abc_ps_1_2 <= data_slice_u_abc_ps_1(2);

  
  decode_rd_u_abc_ps_1_3 <= decode_rd_u_abc_ps_1_2 WHEN decode_sel_u_abc_ps_1_3 = '0' ELSE
      data_slice_u_abc_ps_1_2;

  data_read <= std_logic_vector(decode_rd_u_abc_ps_1_3);

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_in_axi_enable <= data_write_unsigned(0);

  reg_axi_enable_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_axi_enable_1_1 <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  write_concats_axi_enable_1 <= data_reg_axi_enable_1_1;

  write_axi_enable <= write_concats_axi_enable_1;

  
  decode_sel_switch_pspl_abc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_switch_pspl_abc_1_1 <= decode_sel_switch_pspl_abc_1_1 AND wr_enb;

  data_in_switch_pspl_abc <= data_write_unsigned(0);

  reg_switch_pspl_abc_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_switch_pspl_abc_1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_switch_pspl_abc_1_1 = '1' THEN
        data_reg_switch_pspl_abc_1_1 <= data_in_switch_pspl_abc;
      END IF;
    END IF;
  END PROCESS reg_switch_pspl_abc_1_1_process;


  write_concats_switch_pspl_abc_1 <= data_reg_switch_pspl_abc_1_1;

  write_switch_pspl_abc <= write_concats_switch_pspl_abc_1;

  
  decode_sel_switch_pspl_gate_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  reg_enb_switch_pspl_gate_1_1 <= decode_sel_switch_pspl_gate_1_1 AND wr_enb;

  data_in_switch_pspl_gate <= data_write_unsigned(0);

  reg_switch_pspl_gate_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_switch_pspl_gate_1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_switch_pspl_gate_1_1 = '1' THEN
        data_reg_switch_pspl_gate_1_1 <= data_in_switch_pspl_gate;
      END IF;
    END IF;
  END PROCESS reg_switch_pspl_gate_1_1_process;


  write_concats_switch_pspl_gate_1 <= data_reg_switch_pspl_gate_1_1;

  write_switch_pspl_gate <= write_concats_switch_pspl_gate_1;

  
  decode_sel_u_dc_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  reg_enb_u_dc_1_1 <= decode_sel_u_dc_1_1 AND wr_enb;

  reg_u_dc_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_u_dc_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_u_dc_1_1 = '1' THEN
        data_reg_u_dc_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_u_dc_1_1_process;


  write_u_dc <= std_logic_vector(data_reg_u_dc_1_1);

  
  decode_sel_i_abc_ps <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0054#, 14) ELSE
      '0';

  strobe_sel_i_abc_ps <= decode_sel_i_abc_ps AND wr_enb;

  const_zero_1 <= '0';

  strobe_in_i_abc_ps <= data_write_unsigned(0);

  
  strobe_sw_i_abc_ps <= const_zero_1 WHEN strobe_sel_i_abc_ps = '0' ELSE
      strobe_in_i_abc_ps;

  
  decode_sel_i_abc_ps_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0050#, 14) ELSE
      '0';

  reg_enb_i_abc_ps_1_1 <= decode_sel_i_abc_ps_1_1 AND wr_enb;

  
  decode_sel_i_abc_ps_2_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0051#, 14) ELSE
      '0';

  reg_enb_i_abc_ps_2_1 <= decode_sel_i_abc_ps_2_1 AND wr_enb;

  
  decode_sel_i_abc_ps_3_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0052#, 14) ELSE
      '0';

  reg_enb_i_abc_ps_3_1 <= decode_sel_i_abc_ps_3_1 AND wr_enb;

  reg_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      strobe_reg_i_abc_ps <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        strobe_reg_i_abc_ps <= strobe_sw_i_abc_ps;
      END IF;
    END IF;
  END PROCESS reg_1_process;


  reg_i_abc_ps_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_i_abc_ps_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_i_abc_ps_1_1 = '1' THEN
        data_reg_i_abc_ps_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_i_abc_ps_1_1_process;


  reg_i_abc_ps_2_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_i_abc_ps_2_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_i_abc_ps_2_1 = '1' THEN
        data_reg_i_abc_ps_2_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_i_abc_ps_2_1_process;


  reg_i_abc_ps_3_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_i_abc_ps_3_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_i_abc_ps_3_1 = '1' THEN
        data_reg_i_abc_ps_3_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_i_abc_ps_3_1_process;


  write_reg_i_abc_ps(0) <= data_reg_i_abc_ps_1_1;
  write_reg_i_abc_ps(1) <= data_reg_i_abc_ps_2_1;
  write_reg_i_abc_ps(2) <= data_reg_i_abc_ps_3_1;

  sync_reg_i_abc_ps_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sync_reg_i_abc_ps_1(0) <= to_unsigned(0, 32);
      sync_reg_i_abc_ps_1(1) <= to_unsigned(0, 32);
      sync_reg_i_abc_ps_1(2) <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND strobe_reg_i_abc_ps = '1' THEN
        sync_reg_i_abc_ps_1(0) <= write_reg_i_abc_ps(0);
        sync_reg_i_abc_ps_1(1) <= write_reg_i_abc_ps(1);
        sync_reg_i_abc_ps_1(2) <= write_reg_i_abc_ps(2);
      END IF;
    END IF;
  END PROCESS sync_reg_i_abc_ps_process;


  outputgen: FOR k IN 0 TO 2 GENERATE
    write_i_abc_ps(k) <= std_logic_vector(sync_reg_i_abc_ps_1(k));
  END GENERATE;

  
  decode_sel_gate_ps <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0060#, 14) ELSE
      '0';

  strobe_sel_gate_ps <= decode_sel_gate_ps AND wr_enb;

  const_zero_2 <= '0';

  strobe_in_gate_ps <= data_write_unsigned(0);

  
  strobe_sw_gate_ps <= const_zero_2 WHEN strobe_sel_gate_ps = '0' ELSE
      strobe_in_gate_ps;

  
  decode_sel_gate_ps_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0058#, 14) ELSE
      '0';

  reg_enb_gate_ps_1_1 <= decode_sel_gate_ps_1_1 AND wr_enb;

  data_in_gate_ps <= data_write_unsigned(0);

  
  decode_sel_gate_ps_2_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0059#, 14) ELSE
      '0';

  reg_enb_gate_ps_2_1 <= decode_sel_gate_ps_2_1 AND wr_enb;

  
  decode_sel_gate_ps_3_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#005A#, 14) ELSE
      '0';

  reg_enb_gate_ps_3_1 <= decode_sel_gate_ps_3_1 AND wr_enb;

  
  decode_sel_gate_ps_4_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#005B#, 14) ELSE
      '0';

  reg_enb_gate_ps_4_1 <= decode_sel_gate_ps_4_1 AND wr_enb;

  
  decode_sel_gate_ps_5_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#005C#, 14) ELSE
      '0';

  reg_enb_gate_ps_5_1 <= decode_sel_gate_ps_5_1 AND wr_enb;

  
  decode_sel_gate_ps_6_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#005D#, 14) ELSE
      '0';

  reg_enb_gate_ps_6_1 <= decode_sel_gate_ps_6_1 AND wr_enb;

  reg_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      strobe_reg_gate_ps <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        strobe_reg_gate_ps <= strobe_sw_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_2_process;


  reg_gate_ps_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_gate_ps_1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gate_ps_1_1 = '1' THEN
        data_reg_gate_ps_1_1 <= data_in_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_gate_ps_1_1_process;


  write_concats_gate_ps_1 <= data_reg_gate_ps_1_1;

  reg_gate_ps_2_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_gate_ps_2_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gate_ps_2_1 = '1' THEN
        data_reg_gate_ps_2_1 <= data_in_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_gate_ps_2_1_process;


  write_concats_gate_ps_2 <= data_reg_gate_ps_2_1;

  reg_gate_ps_3_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_gate_ps_3_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gate_ps_3_1 = '1' THEN
        data_reg_gate_ps_3_1 <= data_in_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_gate_ps_3_1_process;


  write_concats_gate_ps_3 <= data_reg_gate_ps_3_1;

  reg_gate_ps_4_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_gate_ps_4_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gate_ps_4_1 = '1' THEN
        data_reg_gate_ps_4_1 <= data_in_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_gate_ps_4_1_process;


  write_concats_gate_ps_4 <= data_reg_gate_ps_4_1;

  reg_gate_ps_5_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_gate_ps_5_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gate_ps_5_1 = '1' THEN
        data_reg_gate_ps_5_1 <= data_in_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_gate_ps_5_1_process;


  write_concats_gate_ps_5 <= data_reg_gate_ps_5_1;

  reg_gate_ps_6_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_gate_ps_6_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gate_ps_6_1 = '1' THEN
        data_reg_gate_ps_6_1 <= data_in_gate_ps;
      END IF;
    END IF;
  END PROCESS reg_gate_ps_6_1_process;


  write_concats_gate_ps_6 <= data_reg_gate_ps_6_1;

  write_reg_gate_ps(0) <= write_concats_gate_ps_1;
  write_reg_gate_ps(1) <= write_concats_gate_ps_2;
  write_reg_gate_ps(2) <= write_concats_gate_ps_3;
  write_reg_gate_ps(3) <= write_concats_gate_ps_4;
  write_reg_gate_ps(4) <= write_concats_gate_ps_5;
  write_reg_gate_ps(5) <= write_concats_gate_ps_6;

  sync_reg_gate_ps_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sync_reg_gate_ps_1(0) <= '0';
      sync_reg_gate_ps_1(1) <= '0';
      sync_reg_gate_ps_1(2) <= '0';
      sync_reg_gate_ps_1(3) <= '0';
      sync_reg_gate_ps_1(4) <= '0';
      sync_reg_gate_ps_1(5) <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND strobe_reg_gate_ps = '1' THEN
        sync_reg_gate_ps_1(0) <= write_reg_gate_ps(0);
        sync_reg_gate_ps_1(1) <= write_reg_gate_ps(1);
        sync_reg_gate_ps_1(2) <= write_reg_gate_ps(2);
        sync_reg_gate_ps_1(3) <= write_reg_gate_ps(3);
        sync_reg_gate_ps_1(4) <= write_reg_gate_ps(4);
        sync_reg_gate_ps_1(5) <= write_reg_gate_ps(5);
      END IF;
    END IF;
  END PROCESS sync_reg_gate_ps_process;


  write_gate_ps <= sync_reg_gate_ps_1;

END rtl;

