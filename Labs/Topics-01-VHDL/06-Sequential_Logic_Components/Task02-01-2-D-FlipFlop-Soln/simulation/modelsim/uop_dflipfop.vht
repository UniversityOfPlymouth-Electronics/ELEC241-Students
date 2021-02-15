LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

-- ********************
-- THIS IS A TEST BENCH
-- ********************
ENTITY uop_dflipfop_vhd_tst IS
END uop_dflipfop_vhd_tst;

ARCHITECTURE uop_dflipfop_arch OF uop_dflipfop_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
SIGNAL R : STD_LOGIC;

COMPONENT uop_dflipfop
	PORT (
	CLK : IN STD_LOGIC;
	D : IN STD_LOGIC;
	R : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC
	);
END COMPONENT;

BEGIN
	i1 : uop_dflipfop
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	D => D,
	R => R,
	Q => Q
	);

-- ***************************************
-- PROCESS BLOCKS TO GENERATE TEST SIGNALS
-- ***************************************
init : PROCESS                                                                                 
BEGIN                                                        
        -- code that executes only once   
	R <= '0';
	wait for 10 ps;
	R <= '1';                  
	WAIT;                                                       
END PROCESS init; 
  
-- *********************************************        
-- THIS PROCESS BLOCK GENERATES THE CLOCK SIGNAL                                
-- *********************************************
clock_gen: PROCESS                                              
	variable ck : std_logic := '0'; 
	variable n : integer;                                    
BEGIN                                                         
        for n in 1 to 12 loop
		ck := not ck;
		CLK <= ck;
		wait for 50 ps;
	end loop;  
	WAIT;                                                        
END PROCESS clock_gen; 

-- ********************************************
-- THIS PROCESS BLOCK GENERATES THE TEST INPUTS
-- ********************************************
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
