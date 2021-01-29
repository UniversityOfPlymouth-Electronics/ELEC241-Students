library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity AND_OR is

 port( A1, A2 : in std_logic; Y: out std_logic);

End entity;

--data flow method
architecture myLogic of AND_OR is
	
	-- Component declarations
	component \NOT\ 
		port (IN1: in std_logic; \OUT\: out std_logic);
	end component;
	
	component AND2
		port (IN1, IN2: in std_logic; \OUT\ : out std_logic);
	end component;

	component OR2
		port (IN1, IN2: in std_logic; \OUT\: out std_logic);
	end component;

	-- Signals
	signal I1, I2, S1, S2 : std_logic;
		
begin

	U1: \NOT\ port map (A1, I1);	-- inverter
	U2: \NOT\ port map (A2, I2);  -- inverter
	U3: AND2 port map (A1, I2, S1);
	U4: AND2 port map (I1, A2, S2);
	U5: OR2 port map (S1, S2, Y);
	-- X <= (A0 and A1 and A2 and A3) or (A0 and not A1 and A2 and not A3);

end architecture myLogic;






