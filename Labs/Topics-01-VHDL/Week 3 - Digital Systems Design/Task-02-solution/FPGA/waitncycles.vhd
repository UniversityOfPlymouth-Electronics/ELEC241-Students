library ieee;
use ieee.std_logic_1164.all;

entity waitncycles is
	
	generic (
		N	: natural  :=	10
	);
	
	port(
		areset : in  std_logic;
		clk	 : in	 std_logic;
		START	 : in	 std_logic;
		READY	 : out std_logic
	);

end entity;

architecture rtl of waitncycles is

	-- Register to hold the current state
	signal state   : natural;

begin

	-- Logic to advance to the next state
	process (clk, areset)
	begin
		if areset = '0' then
			state <= N-1;
		elsif (rising_edge(clk)) then
			if (start = '0') then
				state <= (N-1);
			elsif (state>0) then
				state <= state - 1;
			else
				state <= (N-1);
			end if;
		end if;
	end process;

	-- Logic to determine output
	process (state)
	begin
		if (state = 0) then
			READY <= '1';
		else
			READY <= '0';
		end if;
	end process;

end rtl;
