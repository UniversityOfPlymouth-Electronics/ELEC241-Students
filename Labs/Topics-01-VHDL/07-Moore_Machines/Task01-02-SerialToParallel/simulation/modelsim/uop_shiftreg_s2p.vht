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
-- Generated on "02/22/2021 14:46:25"
                                                            
-- Vhdl Test Bench template for design  :  uop_shiftreg_s2p
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uop_shiftreg_s2p_vhd_tst IS
END uop_shiftreg_s2p_vhd_tst;
ARCHITECTURE uop_shiftreg_s2p_arch OF uop_shiftreg_s2p_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL DATA_IN : STD_LOGIC;
SIGNAL DATA_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RESET : STD_LOGIC;
SIGNAL START : STD_LOGIC;
COMPONENT uop_shiftreg_s2p
	PORT (
	CLK : IN STD_LOGIC;
	DATA_IN : IN STD_LOGIC;
	DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RESET : IN STD_LOGIC;
	START : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : uop_shiftreg_s2p
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	DATA_IN => DATA_IN,
	DATA_OUT => DATA_OUT,
	RESET => RESET,
	START => START
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
	wait until RESET = '1';
	START <= '1';
	wait until falling_edge(CLK);
	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '1';

	START <= '0';
	wait until falling_edge(CLK);
	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '1';

	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '1';

	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '1';

	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '0';

	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '0';

	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '0';

	wait until rising_edge(CLK); wait for 2 ps;
	DATA_IN <= '1';


	wait until rising_edge(CLK);
	wait for 1 ps;
	assert(DATA_OUT="10001111") report "Wrong output" severity error;

	WAIT;                                                        
END PROCESS always;                                          
END uop_shiftreg_s2p_arch;
