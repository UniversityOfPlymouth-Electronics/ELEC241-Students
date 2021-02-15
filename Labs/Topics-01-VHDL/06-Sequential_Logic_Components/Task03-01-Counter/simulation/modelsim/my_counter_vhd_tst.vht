LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY my_counter_vhd_tst IS
END my_counter_vhd_tst;

ARCHITECTURE my_counter_arch OF my_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT my_counter
	PORT (
	CLK : IN STD_LOGIC;
	Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	i1 : my_counter
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	Y => Y
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init; 

clk_gen: PROCESS
	variable ck : std_logic := '0';
BEGIN
	for n in 1 to 100 loop
		ck := not ck;
		CLK <= ck;
		wait for 100 ps;
	end loop;
	WAIT;
END PROCESS clk_gen;
                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
	wait until rising_edge(CLK); wait for 1 ps;
	assert Y = "00000001"
		report "Wrong value"
		severity error;
	wait until rising_edge(CLK); wait for 1 ps;
	assert Y = "00000010"
		report "Wrong value"
		severity error;
		  
	WAIT;                                                        
END PROCESS always;                                          
END my_counter_arch;
