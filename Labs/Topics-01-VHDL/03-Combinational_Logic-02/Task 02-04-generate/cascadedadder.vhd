library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity cascaded_adder is

 port( A1, B1, A2, B2 : in std_logic; SUM1, SUM2, COUT : out std_logic);

End entity;

--data flow method
architecture myadder of cascaded_adder is
	
	-- Component declarations
	component thefulladder
		port (a, b, cin: in std_logic; sum, cout:out std_logic);
	end component;
	
	component thehalfadder
		port (a, b: in std_logic; sum, cout:out std_logic);
	end component;	
	-- Signals
	signal S1, C1 : std_logic;
	
begin

	U1: thehalfadder port map (A1, B1, S1, C1); 
	U2: thefulladder port map (A2, B2, C1, SUM2, COUT);
	SUM1 <= S1;
	-- X <= (A0 and A1 and A2 and A3) or (A0 and not A1 and A2 and not A3);

end architecture myadder;






