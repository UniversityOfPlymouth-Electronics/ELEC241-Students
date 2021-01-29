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

architecture counter16_falling of sixteenbitcounter is
begin
		
	process is
		variable x : natural := 0;
	begin
		wait until CLK = '0';
		x := x + 1;
		Y <= CONV_STD_LOGIC_VECTOR(x, 16);	    			
	end process;

end counter16_falling;

architecture counter16_rising of sixteenbitcounter is
begin
		
	process (CLK) is
		variable x : natural := 0;
	begin
		
		if (CLK'event and CLK = '1') then
			x := x + 1;
			Y <= CONV_STD_LOGIC_VECTOR(x, 16);
	    end if;
	    			
	end process;

end counter16_rising;

architecture counter16_rising_v2 of sixteenbitcounter is
begin
		
	process (CLK) is
		variable x : natural := 0;
	begin
		
		if rising_edge(CLK) then
			x := x + 1;
			Y <= CONV_STD_LOGIC_VECTOR(x, 16);
	    end if;
	    			
	end process;

end counter16_rising_v2;