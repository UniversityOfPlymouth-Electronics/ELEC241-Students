-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.1 Build 646 04/11/2019 SJ Lite Edition"
-- CREATED		"Mon Feb 22 15:03:54 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY top_level IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		LOAD :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		DATA_IN :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Y :  OUT  STD_LOGIC;
		Y1 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END top_level;

ARCHITECTURE bdf_type OF top_level IS 

COMPONENT uop_shiftreg_s2p
GENERIC (N : INTEGER
			);
	PORT(CLK : IN STD_LOGIC;
		 START : IN STD_LOGIC;
		 DATA_IN : IN STD_LOGIC;
		 RESET : IN STD_LOGIC;
		 DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uop_shiftreg_p2s
GENERIC (N : INTEGER
			);
	PORT(CLK : IN STD_LOGIC;
		 LOAD : IN STD_LOGIC;
		 RESET : IN STD_LOGIC;
		 DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 DATA_OUT : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 
Y <= SYNTHESIZED_WIRE_0;



b2v_inst : uop_shiftreg_s2p
GENERIC MAP(N => 8
			)
PORT MAP(CLK => CLK,
		 START => LOAD,
		 DATA_IN => SYNTHESIZED_WIRE_0,
		 RESET => RESET,
		 DATA_OUT => Y1);


b2v_inst1 : uop_shiftreg_p2s
GENERIC MAP(N => 8
			)
PORT MAP(CLK => CLK,
		 LOAD => LOAD,
		 RESET => RESET,
		 DATA_IN => DATA_IN,
		 DATA_OUT => SYNTHESIZED_WIRE_0);


END bdf_type;