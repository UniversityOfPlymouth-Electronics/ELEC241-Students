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
-- Generated on "02/23/2021 12:13:14"
                                                            
-- Vhdl Test Bench template for design  :  moore_state_machine
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;   
use STD.textio.all;                             
use IEEE.std_logic_textio.all;

ENTITY moore_state_machine_vhd_tst IS
END moore_state_machine_vhd_tst;


ARCHITECTURE moore_state_machine_arch OF moore_state_machine_vhd_tst IS	  
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL input : STD_LOGIC;
SIGNAL q : STD_LOGIC;
SIGNAL reset : STD_LOGIC;

BEGIN

-- Instantiate a moore_state_machine, using architecture v1 and generic P = "1010
u1: entity work.moore_state_machine(v1) 
	generic map (P => "1010")
	port map (clk, input, reset, q);


init : PROCESS                                               
BEGIN                                                        
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
    	constant test_inp : std_logic_vector := "0010100000";                             
    	constant test_out : std_logic_vector := "0000010000"; 
	variable str_line : line; -- Used for logging text to the output
	                         
BEGIN              
	input <= '0';                                    
	wait until reset = '1';
	write(str_line, string'("Resetting"));	writeline(output, str_line);

	wait until falling_edge(clk);
	write(str_line, string'("First falling edge"));	writeline(output, str_line);

	for n in test_inp'low to test_inp'high loop
		input <= test_inp(n);
		wait until falling_edge(clk);
		wait until rising_edge(clk); wait for 10 ps;
		assert (q = test_out(n)) report "WRONG OUTPUT : Q=" & std_logic'image(q) & " Expected " & std_logic'image(test_out(n)) severity error;
	end loop;
	write(str_line, string'("Done")); writeline(output, str_line);
	WAIT;                                                        
END PROCESS always;
                                         
END moore_state_machine_arch;
