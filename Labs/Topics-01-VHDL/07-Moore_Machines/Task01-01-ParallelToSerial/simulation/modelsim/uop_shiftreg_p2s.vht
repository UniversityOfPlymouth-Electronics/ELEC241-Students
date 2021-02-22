LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uop_shiftreg_p2s_vhd_tst IS
END uop_shiftreg_p2s_vhd_tst;

ARCHITECTURE uop_shiftreg_p2s_arch OF uop_shiftreg_p2s_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL DATA_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DATA_OUT : STD_LOGIC;
SIGNAL LOAD : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;

BEGIN
	u1 : entity work.uop_shiftreg_p2s(p2s) PORT MAP (
	CLK => CLK,
	DATA_IN => DATA_IN,
	DATA_OUT => DATA_OUT,
	LOAD => LOAD,
	RESET => RESET
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
	wait until falling_edge(CLK);

	-- Value 1
	DATA_IN <= "10101100";
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	
	LOAD <= '1';
	wait until falling_edge(CLK);

	LOAD <= '0';

	for n in 1 to 10 loop
		wait until falling_edge(CLK);
	end loop;

		
	-- value 2
	DATA_IN <= "11110001";
	wait until falling_edge(CLK);
	wait until falling_edge(CLK);
	
	LOAD <= '1';
	wait until falling_edge(CLK);

	LOAD <= '0';

	for n in 1 to 10 loop
		wait until falling_edge(CLK);
	end loop;

	WAIT;                                                        
END PROCESS always;                                          
END uop_shiftreg_p2s_arch;
