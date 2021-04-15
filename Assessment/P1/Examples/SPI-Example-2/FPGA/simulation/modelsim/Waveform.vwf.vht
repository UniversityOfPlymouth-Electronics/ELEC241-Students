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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/16/2021 09:50:47"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AXDL345_Example
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AXDL345_Example_vhd_vec_tst IS
END AXDL345_Example_vhd_vec_tst;
ARCHITECTURE AXDL345_Example_arch OF AXDL345_Example_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL MISO_CPU : STD_LOGIC;
SIGNAL MOSI_CPU : STD_LOGIC;
SIGNAL RESET_N : STD_LOGIC;
SIGNAL SCLK_CPU : STD_LOGIC;
SIGNAL SS_N_CPU : STD_LOGIC;
COMPONENT AXDL345_Example
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	MISO_CPU : OUT STD_LOGIC;
	MOSI_CPU : IN STD_LOGIC;
	RESET_N : IN STD_LOGIC;
	SCLK_CPU : IN STD_LOGIC;
	SS_N_CPU : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : AXDL345_Example
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	MISO_CPU => MISO_CPU,
	MOSI_CPU => MOSI_CPU,
	RESET_N => RESET_N,
	SCLK_CPU => SCLK_CPU,
	SS_N_CPU => SS_N_CPU
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 20000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;

-- RESET_N
t_prcs_RESET_N: PROCESS
BEGIN
	RESET_N <= '1';
	WAIT FOR 20000 ps;
	RESET_N <= '0';
	WAIT FOR 20000 ps;
	RESET_N <= '1';
WAIT;
END PROCESS t_prcs_RESET_N;

-- SS_N_CPU
t_prcs_SS_N_CPU: PROCESS
BEGIN
	SS_N_CPU <= '1';
	WAIT FOR 60000 ps;
	SS_N_CPU <= '0';
	WAIT FOR 660000 ps;
	SS_N_CPU <= '1';
WAIT;
END PROCESS t_prcs_SS_N_CPU;

-- SCLK_CPU
t_prcs_SCLK_CPU: PROCESS
BEGIN
	SCLK_CPU <= '1';
	WAIT FOR 80000 ps;
	FOR i IN 1 TO 15
	LOOP
		SCLK_CPU <= '0';
		WAIT FOR 20000 ps;
		SCLK_CPU <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	SCLK_CPU <= '0';
	WAIT FOR 20000 ps;
	SCLK_CPU <= '1';
WAIT;
END PROCESS t_prcs_SCLK_CPU;

-- MOSI_CPU
t_prcs_MOSI_CPU: PROCESS
BEGIN
	MOSI_CPU <= '1';
WAIT;
END PROCESS t_prcs_MOSI_CPU;
END AXDL345_Example_arch;
