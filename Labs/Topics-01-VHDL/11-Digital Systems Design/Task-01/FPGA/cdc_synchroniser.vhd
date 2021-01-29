-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Wed Feb  6 10:46:53 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cdc_synchroniser IS 
	PORT
	(
		Dasync :  IN  STD_LOGIC;
		ARESET :  IN  STD_LOGIC;
		CLKsync :  IN  STD_LOGIC;
		Qsync :  OUT  STD_LOGIC
	);
END cdc_synchroniser;

ARCHITECTURE bdf_type OF cdc_synchroniser IS 

SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	DFF_inst1 :  STD_LOGIC;
SIGNAL	DFF_inst2 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_3 <= '1';



PROCESS(CLKsync,ARESET,SYNTHESIZED_WIRE_3)
BEGIN
IF (ARESET = '0') THEN
	DFF_inst1 <= '0';
ELSIF (SYNTHESIZED_WIRE_3 = '0') THEN
	DFF_inst1 <= '1';
ELSIF (RISING_EDGE(CLKsync)) THEN
	DFF_inst1 <= Dasync;
END IF;
END PROCESS;


PROCESS(CLKsync,ARESET,SYNTHESIZED_WIRE_3)
BEGIN
IF (ARESET = '0') THEN
	DFF_inst2 <= '0';
ELSIF (SYNTHESIZED_WIRE_3 = '0') THEN
	DFF_inst2 <= '1';
ELSIF (RISING_EDGE(CLKsync)) THEN
	DFF_inst2 <= DFF_inst1;
END IF;
END PROCESS;


PROCESS(CLKsync,ARESET,SYNTHESIZED_WIRE_3)
BEGIN
IF (ARESET = '0') THEN
	Qsync <= '0';
ELSIF (SYNTHESIZED_WIRE_3 = '0') THEN
	Qsync <= '1';
ELSIF (RISING_EDGE(CLKsync)) THEN
	Qsync <= DFF_inst2;
END IF;
END PROCESS;



END bdf_type;