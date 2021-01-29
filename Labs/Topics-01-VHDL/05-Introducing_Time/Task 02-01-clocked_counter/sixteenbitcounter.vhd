library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

--This entity counts the number of leading '1' terms
entity sixteenbitcounter is

	port 
	(
		CLK	   : in std_logic;
		Y      : out std_logic_vector(15 downto 0) := ('0', others=>'0')  -- output only
	);

end entity;

architecture counter16_v1 of sixteenbitcounter is
begin
		
	process is
		variable x : natural := 0;
	begin
		wait until CLK = '1';
		x := x + 1;
		Y <= CONV_STD_LOGIC_VECTOR(x, 16);		
	end process;

end counter16_v1;