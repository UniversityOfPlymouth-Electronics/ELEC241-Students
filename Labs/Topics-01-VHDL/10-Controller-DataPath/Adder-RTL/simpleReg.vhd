-- Simple register.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ELEC233_ALU.all;

entity simpleReg is

	port (
		clk    : in  std_logic;		--Clock
		EN     : in  std_logic;		--Clock enable
		reset  : in  std_logic;		--Async reset
		data   : in  std_logic_vector(7 downto 0);	
		output : out std_logic_vector(7 downto 0)	
	);
end entity;

architecture rtl of simpleReg is
	signal latched : std_logic_vector(7 downto 0);
begin

	output <= latched after 10 ns ;
	
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
