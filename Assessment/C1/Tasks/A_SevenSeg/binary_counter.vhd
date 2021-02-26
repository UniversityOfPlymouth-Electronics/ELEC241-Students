library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter is

	port
	(
		clk	  : in std_logic;
		reset	  : in std_logic;
		enable  : in std_logic;
		q		  : out std_logic_vector(3 downto 0)
	);

end entity;

architecture rtl of binary_counter is
begin

	process (clk)
		variable   cnt		   : integer range 0 to 15;
	begin
		if (rising_edge(clk)) then

			if reset = '0' then
				-- Reset the counter to 0
				cnt := 0;

			elsif enable = '1' then
				-- Increment the counter if counting is enabled			   
				cnt := cnt + 1;

			end if;
		end if;

		-- Output the current count
		q <= std_logic_vector(to_unsigned(cnt,4));
	end process;

end rtl;
