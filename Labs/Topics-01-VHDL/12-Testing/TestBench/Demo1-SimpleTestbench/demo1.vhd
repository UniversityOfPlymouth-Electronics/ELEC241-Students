-- Copyright (C) 1991-2014 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 13.1.4 Build 182 03/12/2014 SJ Full Version"
-- CREATED		"Mon Dec 01 06:44:40 2014"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY demo1 IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		Y :  OUT  STD_LOGIC
	);
END demo1;

ARCHITECTURE bdf_type OF demo1 IS 

COMPONENT myxor
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 y : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : myxor
PORT MAP(a => A,
		 b => B,
		 y => Y);


END bdf_type;