library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--These next two cannot be used together!
--use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--This entity counts the number of leading '1' terms
entity my_counter is

	generic ( N : integer := 8);
	port 
	(
		CLK	   : in std_logic;
		Y      : out std_logic_vector((N-1) downto 0) := ('0', others=>'0')  -- output only
	);
end entity;

architecture counter16_rising of my_counter is
begin
		
	process (CLK) is
		variable x : unsigned ((N-1) downto 0) := ('0', others => '0');	--unsigned vector that supports arithmetic
	begin
		
		if (CLK'event and CLK = '1') then
			x := x + 1;
			Y <= std_logic_vector(x); --this function is decalred in IEEE.std_logic_unsigned.all
	    end if;
	    			
	end process;

end counter16_rising;