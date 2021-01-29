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
-- CREATED		"Thu Jan 07 11:38:07 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY behavioural_vhd IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		Y_behave :  OUT  STD_LOGIC;
		Y_library :  OUT  STD_LOGIC
	);
END behavioural_vhd;

ARCHITECTURE bdf_type OF behavioural_vhd IS 

COMPONENT and2_behavioural
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Y : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : and2_behavioural
PORT MAP(A => A,
		 B => B,
		 Y => Y_behave);


Y_library <= A AND B;


END bdf_type;