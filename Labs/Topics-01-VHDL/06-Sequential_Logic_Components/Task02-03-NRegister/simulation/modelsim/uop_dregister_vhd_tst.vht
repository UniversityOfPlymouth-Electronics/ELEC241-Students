LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uop_dregister_vhd_tst IS
END uop_dregister_vhd_tst;

ARCHITECTURE v1 OF uop_dregister_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL LOAD : STD_LOGIC;
SIGNAL R : STD_LOGIC;
SIGNAL X : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT uop_dregister
	PORT (
		D	   : in std_logic_vector(15 downto 0);	-- D input							
		CLK    : in std_logic;	-- CLK, this time falling edge
		RESET  : in std_logic;  -- Active LOW asnchronous reset
		LOAD   : in std_logic;  -- Active HIGH - load value into register
		Q      : out std_logic_vector(15 downto 0) 	-- Q output
	);
END COMPONENT;
BEGIN
	i1 : uop_dregister
	PORT MAP (
	-- list connections between master ports and signals
	CLK => CLK,
	LOAD => LOAD,
	RESET => R,
	D => X,
	Q => Y
	);


-- *******
-- *RESET*
-- *******
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- Show reset signal pulled high 
	R <= '0';
	wait for 5 ps;
	R <= '1';                   
	WAIT;           	                                            
END PROCESS init;   
 
clk_gen: PROCESS
variable ck : std_logic := '0';
BEGIN
	for n in 1 to 20 loop
		ck := not ck;
		CLK <= ck;
		wait for 50 ps;
	end loop;
	WAIT;
END PROCESS clk_gen;
                                       
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations 
	                                     
BEGIN                                                         
        wait until falling_edge(CLK);
	LOAD <= '0';
	X    <= "1010010111110000";
	wait until rising_edge(CLK); wait for 1 ps;
	assert Y = "0000000000000000"
		report "Should be reset to 0"
		severity warning;

	-- X is latched if EN is HIGH
	wait until falling_edge(CLK);
	LOAD <= '1';
	X    <= (others => '1');
	wait until rising_edge(CLK); wait for 1 ps;
	assert Y = "1111111111111111"
		report "Register failed to load"
		severity error;
	
	-- X is ignored if EN is HIGH
	wait until falling_edge(CLK);
	LOAD <= '0';
	X    <= "1010111100001111";
	wait until rising_edge(CLK); wait for 1 ps;
	assert Y =  "1111111111111111"
		report "Register should ignore input chages when EN is LOW"
		severity error;

	
	  
WAIT;                                                        
END PROCESS always;                                          

END v1;
