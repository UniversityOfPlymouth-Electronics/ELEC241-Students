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
-- Generated on "02/15/2021 12:10:02"
                                                            
-- Vhdl Test Bench template for design  :  uop_jkflipflop
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uop_jkflipflop_vhd_tst IS
END uop_jkflipflop_vhd_tst;
ARCHITECTURE uop_jkflipflop_arch OF uop_jkflipflop_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL J : STD_LOGIC;
SIGNAL K : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
COMPONENT uop_jkflipflop
	PORT (
	CLK : IN STD_LOGIC;
	J : IN STD_LOGIC;
	K : IN STD_LOGIC;
	Q : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : uop_jkflipflop
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	J => J,
	K => K,
	Q => Q
	);

init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init; 

-- *********************************************        
-- THIS PROCESS BLOCK GENERATES THE CLOCK SIGNAL                                
-- *********************************************
clock_gen: PROCESS                                              
	variable ck : std_logic := '0'; 
	variable n : integer;                                    
BEGIN                                                         
        for n in 1 to 20 loop
		ck := not ck;
		CLK <= ck;
		wait for 50 ps;
	end loop;  
	WAIT;                                                        
END PROCESS clock_gen;

                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list 
	wait until rising_edge(clk);
	J <= '1';
	K <= '0';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '1')
		report "J did not set Q high"
		severity error;
		
	wait until rising_edge(clk);
	J <= '0';
	K <= '0';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '1')
		report "Q failed to latch high"
		severity error;

	wait until rising_edge(clk);
	J <= '0';
	K <= '1';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '0')
		report "Q failed to latch low"
		severity error;

	wait until rising_edge(clk);
	J <= '0';
	K <= '0';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '0')
		report "Q failed to latch low"
		severity error;

	wait until rising_edge(clk);
	J <= '1';
	K <= '1';	
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '1')
		report "Q failed to toggle high"
		severity error;

	wait until rising_edge(clk);
	J <= '1';
	K <= '1';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '0')
		report "Q failed to toggle low"
		severity error;
	
	wait until rising_edge(clk);
	J <= '1';
	K <= '1';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '1')
		report "Q failed to toggle high"
		severity error;
	
	wait until rising_edge(clk);
	J <= '0';
	K <= '0';
	wait until falling_edge(clk); wait for 1 ps;
	assert (q = '1')
		report "Q failed to latch high"
		severity error;
	 
WAIT;                                                        
END PROCESS always;                                          
END uop_jkflipflop_arch;
