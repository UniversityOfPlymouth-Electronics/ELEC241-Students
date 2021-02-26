-- Simple register.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simplereg is

	generic( W	: natural  :=	8 );	

	port (
		clk    : in  std_logic;		--Clock
		EN     : in  std_logic;		--Clock enable
		reset  : in  std_logic;		--Async reset
		data   : in  std_logic_vector(W-1 downto 0);	
		output : out std_logic_vector(W-1 downto 0)	
	);
end entity;

architecture rtl of simplereg is
	signal latched : std_logic_vector(W-1 downto 0);
begin

	output <= latched;
	
	process (clk, reset)	
	begin
		if (reset = '0') then 
			latched <= (others => '0');			
		elsif (rising_edge(clk)) then
			if (EN = '1') then 
				latched <= data;		--implicit latch
			end if;
		end if;
	end process;

end rtl;
