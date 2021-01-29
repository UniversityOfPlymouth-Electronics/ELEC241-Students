library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity clevergate_behavioural is

	port
	(
		-- Input ports
		A		: in  std_logic_vector(15 downto 0);
		B		: in  std_logic_vector(15 downto 0);
		EN   	: in  std_logic;
		mode    : in  std_logic_vector(1 downto 0);
				
		-- Output ports
		Y	: out std_logic_vector(15 downto 0)
	);
end clevergate_behavioural;


architecture andor2_behavioural of clevergate_behavioural is

	-- Declarations (optional)

begin

	-- Process Statement (optional)
	plist1:	--optional label
	process(A,B,EN,mode) is
		-- Declaration(s)
		variable P : std_logic_vector(15 downto 0);
	begin
		-- Sequential Statement(s)
		if (EN = '1') then
			P := "ZZZZZZZZZZZZZZZZ";
		else	
			if (mode = "00") then 
				P := A and B;
			elsif (mode = "01") then
				P := A or B;
			elsif (mode = "10") then
			    P := A xor B; 
			else
			    P := "0000000000000000";
			end if;
		end if;
		
		Y <= P;
	end process;

end andor2_behavioural;