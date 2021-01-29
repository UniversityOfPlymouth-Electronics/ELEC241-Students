-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.2 Build 203 01/18/2017 SJ Lite Edition"
-- CREATED		"Tue Feb 19 17:35:59 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY switch_dataflow IS 
	PORT
	(
		CLK_50 :  IN  STD_LOGIC;
		LD :  IN  STD_LOGIC;
		ARESET :  IN  STD_LOGIC;
		OE :  IN  STD_LOGIC;
		SW0 :  IN  STD_LOGIC;
		SW1 :  IN  STD_LOGIC;
		SW2 :  IN  STD_LOGIC;
		SW3 :  IN  STD_LOGIC;
		Y :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END switch_dataflow;

ARCHITECTURE bdf_type OF switch_dataflow IS 

COMPONENT pad_bits
GENERIC (DATA_WIDTH_IN : INTEGER;
			DATA_WIDTH_OUT : INTEGER
			);
	PORT(X : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT switches
	PORT(RESET : IN STD_LOGIC;
		 FPGA_CLOCK : IN STD_LOGIC;
		 Switch_0 : IN STD_LOGIC;
		 Switch_1 : IN STD_LOGIC;
		 Switch_2 : IN STD_LOGIC;
		 Switch_3 : IN STD_LOGIC;
		 SW0 : OUT STD_LOGIC;
		 SW1 : OUT STD_LOGIC;
		 SW2 : OUT STD_LOGIC;
		 SW3 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT regn
GENERIC (W : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 OE : IN STD_LOGIC;
		 datain : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	CLOCK_50 :  STD_LOGIC;
SIGNAL	sw_reg :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst : pad_bits
GENERIC MAP(DATA_WIDTH_IN => 4,
			DATA_WIDTH_OUT => 16
			)
PORT MAP(X => sw_reg,
		 Y => SYNTHESIZED_WIRE_0);


b2v_SWITCH_SYNC : switches
PORT MAP(RESET => ARESET,
		 FPGA_CLOCK => CLOCK_50,
		 Switch_0 => SW0,
		 Switch_1 => SW1,
		 Switch_2 => SW2,
		 Switch_3 => SW3,
		 SW0 => sw_reg(0),
		 SW1 => sw_reg(1),
		 SW2 => sw_reg(2),
		 SW3 => sw_reg(3));


b2v_SWITCHES_REG : regn
GENERIC MAP(W => 16
			)
PORT MAP(clk => CLOCK_50,
		 load => LD,
		 reset => ARESET,
		 OE => OE,
		 datain => SYNTHESIZED_WIRE_0,
		 dataout => Y);

CLOCK_50 <= CLK_50;

END bdf_type;