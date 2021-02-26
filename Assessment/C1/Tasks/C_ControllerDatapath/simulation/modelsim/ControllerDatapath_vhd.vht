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
-- Generated on "02/25/2021 16:08:31"
                                                            
-- Vhdl Test Bench template for design  :  ControllerDatapath_vhd
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;
                            

ENTITY ControllerDatapath_vhd_tst IS
END ControllerDatapath_vhd_tst;
ARCHITECTURE ControllerDatapath_vhd_arch OF ControllerDatapath_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ACC : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CLK : STD_LOGIC;
SIGNAL DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL EN_ACC : STD_LOGIC;
SIGNAL EN_R1 : STD_LOGIC;
SIGNAL EN_R2 : STD_LOGIC;
SIGNAL R1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL R2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RESET : STD_LOGIC;
SIGNAL SEL_ACC : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL SEL_R1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL SEL_R2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL SEL_SUM : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT ControllerDatapath_vhd
	PORT (
	ACC : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	CLK : IN STD_LOGIC;
	DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	EN_ACC : IN STD_LOGIC;
	EN_R1 : IN STD_LOGIC;
	EN_R2 : IN STD_LOGIC;
	R1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	R2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RESET : IN STD_LOGIC;
	SEL_ACC : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	SEL_R1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	SEL_R2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	SEL_SUM : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ControllerDatapath_vhd
	PORT MAP (
-- list connections between master ports and signals
	ACC => ACC,
	CLK => CLK,
	DATA => DATA,
	EN_ACC => EN_ACC,
	EN_R1 => EN_R1,
	EN_R2 => EN_R2,
	R1 => R1,
	R2 => R2,
	RESET => RESET,
	SEL_ACC => SEL_ACC,
	SEL_R1 => SEL_R1,
	SEL_R2 => SEL_R2,
	SEL_SUM => SEL_SUM
	);

init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        WAIT;                                           
END PROCESS init;                                           


                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         

	WAIT;                                                        
END PROCESS always;  

                                        
END ControllerDatapath_vhd_arch;
