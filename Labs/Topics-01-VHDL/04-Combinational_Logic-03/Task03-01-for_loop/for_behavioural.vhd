library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity for_behavioural is	
	generic ( DATA_WIDTH : natural := 16 );
	
	port (	
		-- Input ports
		A	: in  std_logic_vector((DATA_WIDTH-1) downto 0);
				
		-- Output ports
		Y	: out std_logic_vector((DATA_WIDTH-1) downto 0)
	);
end for_behavioural;


architecture reversal of for_behavioural is

	-- Declarations (optional)

begin
	-- Process Statement (optional)
	plist1:	--optional label
	process(A) is
		-- Declaration(s)
		variable P : integer;
		variable Q : std_logic_vector((DATA_WIDTH-1) downto 0);
	begin
		-- Sequential Statement(s)
		P := 0;
		for n in (DATA_WIDTH-1) downto 0 loop
			Q(n) := A(P);
			P := P + 1;
		end loop;
		Y <= Q;
	end process;
end reversal;

