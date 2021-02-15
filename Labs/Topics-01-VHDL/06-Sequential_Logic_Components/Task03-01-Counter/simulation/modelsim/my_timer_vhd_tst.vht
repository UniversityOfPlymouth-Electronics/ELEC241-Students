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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/15/2021 17:25:49"
                                                            
-- Vhdl Test Bench template for design  :  my_counter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;                               

ENTITY my_timer_vhd_tst IS
END my_timer_vhd_tst;

ARCHITECTURE v1 OF my_timer_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL COUNT : STD_LOGIC;
SIGNAL LOAD : STD_LOGIC;
SIGNAL PR : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL REC : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT my_counter
	PORT (
	CLK : IN STD_LOGIC;
	COUNT : IN STD_LOGIC;
	LOAD : IN STD_LOGIC;
	PR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	REC : OUT STD_LOGIC;
	RESET : IN STD_LOGIC;
	Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	i1 : my_counter
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	COUNT => COUNT,
	LOAD => LOAD,
	PR => PR,
	REC => REC,
	RESET => RESET,
	Y => Y
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once  
	RESET <= '0';
	wait for 10 ps;   
	RESET <= '1';                 
	WAIT;                                                       
END PROCESS init;                                           

clk_gen: PROCESS
	variable ck : std_logic := '0';
BEGIN
	for n in 1 to 100 loop
		ck := not ck;
		CLK <= ck;	
		wait for 50 ns;
	end loop;
	WAIT;
END PROCESS clk_gen;

always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
	
	-- TEST START UP CONDITIONS
	wait until falling_edge(CLK);
	COUNT <= '0';
	LOAD <= '0';
	PR <= (others => '0');
	wait until rising_edge(CLK); wait for 1 ps;
	assert REC = '0' report "REC should be 0" severity error;
	assert Y = "00000000" report "Y should be 0" severity error;
  	
	--LOAD PR with 10, count 10 times and check
	wait until falling_edge(CLK);
	COUNT <= '0';
	LOAD <= '1';
	PR <= "00001010";
	wait until rising_edge(CLK); wait for 1 ps;
	assert REC = '0' report "REC should be 0" severity error;
	assert Y = "00000000" report "Y should be 0" severity error;

	wait until falling_edge(CLK);
	COUNT <= '0';
	LOAD <= '0';
	PR <= "11111111";
	wait until rising_edge(CLK); wait for 1 ps;
	assert REC = '0' report "REC should be 0" severity error;
	assert Y = "00000000" report "Y should be 0" severity error;

	-- Now start counting
	for n in 1 to 9 loop
		wait until falling_edge(CLK);
		COUNT <= '1';
		wait until rising_edge(CLK); wait for 1 ps;
		assert REC = '0' report "REC should be 0" severity error;
		assert Y = std_logic_vector(to_unsigned(n,8)) report "Y has wrong value" severity error;
	end loop;

	--check recycle
	wait until falling_edge(CLK);
	COUNT <= '1';
	wait until rising_edge(CLK); wait for 1 ps;
	assert REC = '1' report "REC should be 1" severity error;
	assert Y = "00000000" report "Y has wrong value" severity error;

	-- check recycle goes low again
	wait until falling_edge(CLK);
	COUNT <= '1';
	wait until rising_edge(CLK); wait for 1 ps;
	assert REC = '0' report "REC should be 0" severity error;
	assert Y = "00000001" report "Y has wrong value" severity error;

	-- Finish
	wait until falling_edge(CLK);
	assert false report "Test finished" severity note;
	WAIT;
                                                        
END PROCESS always;                                          

END v1;
