library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declare entity - 2 inputs, 1 output
--
--    A1---|---------|
--         | LOGIC   |------Y
--    A2---|---------|

Entity AND_OR is

 port( A1, A2 : in std_logic; Y: out std_logic);

End entity;

-- structural style
architecture myLogic of AND_OR is
	
	-- Component declarations (of existing component we're going to use in our design)
	component ANDGATE2
		port (A1, A2: in std_logic; Y: out std_logic);
	end component;

	component ORGATE2
		port (A1, A2: in std_logic; Y: out std_logic);
	end component;

	component NOTGATE
		port (A1: in std_logic; Y: out std_logic);
	end component;

	-- Signals (nodes in the circuit)
	signal I1, I2, S1, S2 : std_logic;
		
begin
	
	U1: NOTGATE port map (A1, I1);
	U2: NOTGATE port map (A2, I2);
	U3: ANDGATE2 port map (A1, I2, S1); -- connects to an internal signal S1
	U4: ANDGATE2 port map (I1, A2, S2); -- connects to an internal signal S2
	U5: ORGATE2 port map (S1, S2, Y); -- connect internal signals S1 and S2 to the output Y

end architecture myLogic;




