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
-- Generated on "02/15/2021 09:53:26"
                                                            
-- Vhdl Test Bench template for design  :  uop_dflipfop
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uop_dflipfop_vhd_tst IS
END uop_dflipfop_vhd_tst;
ARCHITECTURE uop_dflipfop_arch OF uop_dflipfop_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
COMPONENT uop_dflipfop
	PORT (
	CLK : IN STD_LOGIC;
	D : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : uop_dflipfop
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	D => D,
	Q => Q
	);

init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
	WAIT;                                                       
END PROCESS init; 
                                          
clock_gen: PROCESS                                              
	variable ck : std_logic := '0'; 
	variable n : integer;                                    
BEGIN                                                         
        for n in 1 to 12 loop
		ck := not ck;
		CLK <= ck;
		wait for 50 ns;
	end loop;  
	WAIT;                                                        
END PROCESS clock_gen; 


test_vec: PROCESS
begin
	wait until falling_edge(CLK);
	D <= '0';
	wait until falling_edge(CLK);
	D <= '0';
	wait until falling_edge(CLK);
	D <= '1';
	wait until falling_edge(CLK);
	D <= '0';
	wait until falling_edge(CLK);
	D <= '0';
	wait until falling_edge(CLK);
	D <= '0';
	wait until falling_edge(CLK);
	D <= '1';
	wait until falling_edge(CLK);
	D <= '1';
	wait until falling_edge(CLK);
	D <= '0';
	WAIT;
end process test_vec;
                                         
END uop_dflipfop_arch;
