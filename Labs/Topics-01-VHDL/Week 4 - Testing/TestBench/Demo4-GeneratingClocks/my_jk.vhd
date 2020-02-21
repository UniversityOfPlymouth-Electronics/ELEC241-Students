-- Quartus II VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_jk is
	port (
		J	   : in std_logic;
		K	   : in std_logic;
		CLK	: in std_logic;
		Q     : out std_logic );
end entity;

architecture jk_v1 of my_jk is
	signal state : std_logic := '0';
begin


	process (J,K,CLK) 
	begin
	
		if (CLK'Event and CLK = '0') then
		
			if 	(J = '0' and K = '1') then state <= '0';
			elsif (J = '1' and K = '0') then state <= '1';
			elsif (J = '1' and K = '1') then state <= not state;
			end if;
			
		end if;
		
		Q <= state;
		
	end process;

end jk_v1;
