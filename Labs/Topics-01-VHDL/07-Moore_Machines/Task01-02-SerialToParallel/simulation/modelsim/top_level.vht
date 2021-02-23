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
-- Generated on "02/22/2021 15:06:41"
                                                            
-- Vhdl Test Bench template for design  :  top_level
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY top_level_vhd_tst IS
END top_level_vhd_tst;
ARCHITECTURE top_level_arch OF top_level_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL DATA_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL LOAD : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
SIGNAL Y : STD_LOGIC;
SIGNAL Y1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT top_level
	PORT (
	CLK : IN STD_LOGIC;
	DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	LOAD : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	Y : OUT STD_LOGIC;
	Y1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : top_level
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	DATA_IN => DATA_IN,
	LOAD => LOAD,
	RESET => RESET,
	Y => Y,
	Y1 => Y1
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
	wait until reset = '1'; 
	wait until falling_edge(CLK);
	DATA_IN <= "11110001";
	LOAD <= '0';
	wait until falling_edge(CLK);
	LOAD <= '1';
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
WAIT;                                                        
END PROCESS always;                                          
END top_level_arch;
