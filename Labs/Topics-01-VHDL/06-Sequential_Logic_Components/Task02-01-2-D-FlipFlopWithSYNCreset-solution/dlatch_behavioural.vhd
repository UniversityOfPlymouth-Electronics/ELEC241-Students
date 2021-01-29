library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity dlatch_behavioural is

	port
	(
		-- Input ports
		D		: in  std_logic;
		EN   	: in  std_logic;
				
		-- Output ports
		Q	: out std_logic
	);
end dlatch_behavioural;


architecture dlatch_behavioural of dlatch_behavioural is

	-- Declarations (optional)

begin

	-- Process Statement (optional)
	plist1:	--optional label
	process(D, EN) is
		-- Declaration(s)

	begin
		-- Sequential Statement(s)
		if (EN = '1') then 
			Q <= D;
		end if;
		
	end process;

end dlatch_behavioural;