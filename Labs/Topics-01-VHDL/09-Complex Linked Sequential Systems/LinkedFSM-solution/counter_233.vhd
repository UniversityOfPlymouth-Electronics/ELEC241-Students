library ieee;
use ieee.std_logic_1164.all;

entity counter_233 is

	port(
		clk	 : in	std_logic;
		start	 : in	std_logic;
		reset	 : in	std_logic;
		
		ready	 : out	std_logic
	);

end entity;

architecture rtl of counter_233 is


	-- Register to hold the current state
	signal state   : integer range 0 to 256 := 0;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if (rising_edge(clk)) then
			
			-- IDLE
			if (state = 0) then 
				if (start = '1') then
					state <= 1;
				end if;
			
			-- S1 .. S255
			elsif (state<256) then
				state <= state + 1;
			
			-- S256
			elsif (state = 256) then 
				if (reset = '1') then 
					state <= 0;
				end if;
				
			else 
				state <= 0;
				
			end if;
			
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		if (state = 256) then 
			ready <= '1';
		else 
			ready <= '0';
		end if;
	end process;

end rtl;
