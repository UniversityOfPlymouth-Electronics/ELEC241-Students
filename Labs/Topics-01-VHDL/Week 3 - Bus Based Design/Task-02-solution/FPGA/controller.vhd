library ieee;
use ieee.std_logic_1164.all;

-- Quartus Prime VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;

entity controller is

	port 
	(
		CLK : in std_logic;
		reset : out std_logic;
		R1_LD : out std_logic;
		R2_LD : out std_logic;
		LEDREG_LD : out std_logic;
		SEL   : out std_logic
);

end entity;

architecture rtl of controller is
begin
	process 
		variable state  : natural := 0;		
		variable countr : natural := 0;

		
		procedure next_state is
		begin
			state := state + 1;
		end procedure;
		
		procedure advance_after(N : natural) is
		begin
			if (countr = N-1) then
				countr := 0;
				next_state;
			else
				countr := countr + 1;
			end if;
		end procedure;
		
		
	begin
	
		wait until rising_edge(clk);
		
		reset 	 <= '1';
		R1_LD 	 <= '0';
		R2_LD 	 <= '0';
		LEDREG_LD <= '0';
		SEL       <= '0';
		
		if (state = 0 ) then
			reset <= '0';
			next_state;
			
		elsif (state = 1) then
			R1_LD <= '1';
			next_state;
			
		elsif (state = 2) then
			LEDREG_LD <= '1';
			next_state;
								
		elsif (state = 3) then
			advance_after(500000);
	
		elsif (state = 4) then
			R2_LD <= '1';
			next_state;
		
		elsif (state = 5) then
			SEL <= '1';
			LEDREG_LD <= '1';
			next_state;
		
		elsif (state = 6) then
			advance_after(500000);
			
		else
			state := 1;
		end if;
	
	end process;
end rtl;
