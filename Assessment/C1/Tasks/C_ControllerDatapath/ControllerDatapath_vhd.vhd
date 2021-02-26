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
-- CREATED		"Thu Feb 25 16:06:17 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ControllerDatapath_vhd IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		EN_R1 :  IN  STD_LOGIC;
		EN_R2 :  IN  STD_LOGIC;
		EN_ACC :  IN  STD_LOGIC;
		DATA :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SEL_ACC :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		SEL_R1 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		SEL_R2 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		SEL_SUM :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		ACC :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		R1 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		R2 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ControllerDatapath_vhd;

ARCHITECTURE bdf_type OF ControllerDatapath_vhd IS 

COMPONENT unsigned_adder_b
GENERIC (DATA_WIDTH : INTEGER
			);
	PORT(a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT constant_literal
	PORT(		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT big_mux_4
GENERIC (N : INTEGER
			);
	PORT(sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 X0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 X1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 X2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 X3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT simplereg
GENERIC (W : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 EN : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ACC_OUT :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	R1_OUT :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	R2_OUT :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SUM :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ZERO :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : unsigned_adder_b
GENERIC MAP(DATA_WIDTH => 8
			)
PORT MAP(a => ACC_OUT,
		 b => SYNTHESIZED_WIRE_0,
		 result => SUM);


b2v_inst1 : constant_literal
PORT MAP(		 result => ZERO);


b2v_MUX_ACC : big_mux_4
GENERIC MAP(N => 8
			)
PORT MAP(sel => SEL_ACC,
		 X0 => DATA,
		 X1 => R1_OUT,
		 X2 => R2_OUT,
		 X3 => SUM,
		 Q => SYNTHESIZED_WIRE_1);


b2v_MUX_R1 : big_mux_4
GENERIC MAP(N => 8
			)
PORT MAP(sel => SEL_R1,
		 X0 => DATA,
		 X1 => ACC_OUT,
		 X2 => R2_OUT,
		 X3 => ZERO,
		 Q => SYNTHESIZED_WIRE_2);


b2v_MUX_R2 : big_mux_4
GENERIC MAP(N => 8
			)
PORT MAP(sel => SEL_R2,
		 X0 => DATA,
		 X1 => R1_OUT,
		 X2 => ACC_OUT,
		 X3 => ZERO,
		 Q => SYNTHESIZED_WIRE_3);


b2v_MUX_SUM : big_mux_4
GENERIC MAP(N => 8
			)
PORT MAP(sel => SEL_SUM,
		 X0 => DATA,
		 X1 => R1_OUT,
		 X2 => R2_OUT,
		 X3 => ZERO,
		 Q => SYNTHESIZED_WIRE_0);


b2v_REG_ACC : simplereg
GENERIC MAP(W => 8
			)
PORT MAP(clk => CLK,
		 EN => EN_ACC,
		 reset => RESET,
		 data => SYNTHESIZED_WIRE_1,
		 output => ACC_OUT);


b2v_REG_R1 : simplereg
GENERIC MAP(W => 8
			)
PORT MAP(clk => CLK,
		 EN => EN_R1,
		 reset => RESET,
		 data => SYNTHESIZED_WIRE_2,
		 output => R1_OUT);


b2v_REG_R2 : simplereg
GENERIC MAP(W => 8
			)
PORT MAP(clk => CLK,
		 EN => EN_R2,
		 reset => RESET,
		 data => SYNTHESIZED_WIRE_3,
		 output => R2_OUT);

ACC <= ACC_OUT;
R1 <= R1_OUT;
R2 <= R2_OUT;

END bdf_type;