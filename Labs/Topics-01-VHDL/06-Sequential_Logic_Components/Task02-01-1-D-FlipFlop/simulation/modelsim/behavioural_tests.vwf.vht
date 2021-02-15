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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/15/2021 09:38:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          behavioural
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY behavioural_vhd_vec_tst IS
END behavioural_vhd_vec_tst;
ARCHITECTURE behavioural_arch OF behavioural_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL X : STD_LOGIC;
SIGNAL Y_flipflop : STD_LOGIC;
SIGNAL Y_latch : STD_LOGIC;
COMPONENT behavioural
	PORT (
	CLK : IN STD_LOGIC;
	X : IN STD_LOGIC;
	Y_flipflop : OUT STD_LOGIC;
	Y_latch : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : behavioural
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	X => X,
	Y_flipflop => Y_flipflop,
	Y_latch => Y_latch
	);

-- X
t_prcs_X: PROCESS
BEGIN
	X <= '0';
	WAIT FOR 30000 ps;
	X <= '1';
	WAIT FOR 40000 ps;
	X <= '0';
	WAIT FOR 40000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 40000 ps;
	X <= '1';
	WAIT FOR 40000 ps;
	X <= '0';
	WAIT FOR 40000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 30000 ps;
	X <= '0';
	WAIT FOR 40000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 40000 ps;
	X <= '0';
	WAIT FOR 50000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 30000 ps;
	X <= '0';
	WAIT FOR 30000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 30000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
WAIT;
END PROCESS t_prcs_X;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
	CLK <= '1';
	WAIT FOR 5000 ps;
	FOR i IN 1 TO 16
	LOOP
		CLK <= '0';
		WAIT FOR 30000 ps;
		CLK <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	CLK <= '0';
	WAIT FOR 30000 ps;
	CLK <= '1';
WAIT;
END PROCESS t_prcs_CLK;
END behavioural_arch;
