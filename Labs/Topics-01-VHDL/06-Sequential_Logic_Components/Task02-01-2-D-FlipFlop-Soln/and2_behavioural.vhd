library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity and2_behavioural is

	port
	(
		-- Input ports
		A		: in  std_logic;
		B		: in  std_logic;
		mode   	: in  std_logic;
				
		-- Output ports
		Y	: out std_logic
	);
end and2_behavioural;


architecture and2_behavioural_v1 of and2_behavioural is

	-- Declarations (optional)

begin

	-- Process Statement (optional)
	plist1:	--optional label
	process(A,B) is
		-- Declaration(s)
		variable P : std_logic;
	begin
		-- Sequential Statement(s)
		if (mode = '1') then 
			P := A and B;
		else
			P := A or B;
		end if;
			
		Y <= P;
		
	end process;

end and2_behavioural_v1;

