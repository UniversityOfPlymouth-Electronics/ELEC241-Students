library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity for_behavioural is

	port
	(
		-- Input ports
		A	: in  std_logic_vector(15 downto 0);
				
		-- Output ports
		Y	: out std_logic_vector(15 downto 0)
	);
end for_behavioural;


architecture reversal of for_behavioural is

	-- Declarations (optional)

begin

	-- Process Statement (optional)
	plist1:	--optional label
	process(A) is
		-- Declaration(s)
		variable P : unsigned(15 downto 0);
		variable Q : std_logic_vector(15 downto 0);
	begin
		-- Sequential Statement(s)
		P := 0;
		for n in 15 downto 0 loop
			Q(n) := A(P);
			
		end loop;
		
	end process;

end and2_behavioural_v1;

