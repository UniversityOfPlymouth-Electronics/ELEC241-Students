library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

--This entity counts the number of leading '1' terms
entity my_counter is

	port 
	(
		CLK	   : in std_logic;
		Y1      : out std_logic_vector(15 downto 0) := ('0', others=>'0');  -- output only
		Y2      : out std_logic_vector(15 downto 0) := ('0', others=>'0')  -- output only
		
	);

end entity;

architecture counter16_v1 of my_counter is

	--component declarations
	component CTR1 is 
		port 
		(
			CLK	   : in std_logic;
			Y      : out std_logic_vector(15 downto 0) := ('0', others=>'0')  -- output only
		);
	end component CTR1;
	component CTR2 is 
		port 
		(
			CLK	   : in std_logic;
			Y      : out std_logic_vector(15 downto 0) := ('0', others=>'0')  -- output only
		);
	end component CTR2;	
	for all : CTR1 use entity work.sixteenbitcounter(counter16_rising);
	for all : CTR2 use entity work.sixteenbitcounter(counter16_falling);


begin
	-- component instantiation (and wiring)
	u1: CTR1 port map (CLK=>CLK, Y=>Y1);
	u2: CTR2 port map (CLK=>CLK, Y=>Y2);

end counter16_v1;