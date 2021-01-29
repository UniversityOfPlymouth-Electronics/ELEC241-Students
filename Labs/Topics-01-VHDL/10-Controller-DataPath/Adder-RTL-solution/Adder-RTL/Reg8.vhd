-- Simple register.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ELEC233_ALU.all;

entity reg8 is

	generic( W	: natural  :=	WORD_WIDTH );	

	port (
		clk		  	  : in std_logic;		--Clock
		load	  		  : in std_logic;		--Clock enable
		reset	  		  : in std_logic;		--Async reset
		databus		  : inout std_logic_vector(W-1 downto 0);	--Data
		oe				  : in std_logic	--Output enable (asynchronous)
	);
end entity;

architecture rtl of reg8 is
	signal latched : std_logic_vector(W-1 downto 0);
begin

	--Connect output to internal latched signal when the output is enabled
	databus <= latched after 10 ns when oe = '1' 
	                         else (others => 'Z') after 1ns;
	
	process (clk, reset)	
	begin
		if (reset = '0') then 
			latched <= (others => '0');			
		elsif (rising_edge(clk)) then
			if (load = '1') then 
				latched <= databus;		--implicit latch
			end if;
		end if;
	end process;

end rtl;
