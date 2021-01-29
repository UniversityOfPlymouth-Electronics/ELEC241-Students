library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity uop_srlatch is
	port 
	(
		S	   : in std_logic;	-- D input							
		R      : in std_logic;  -- Active LOW Reset
		Q      : out std_logic 	-- Q output
	);
end entity;

architecture srlatch_v1 of uop_srlatch is
begin
	--I am going to use behavioural logic
	process (S,R) is
		--Local declarations
	begin
		if (S = '1') and (R = '0') then
			Q <= '1';
		elsif (S = '0' and R = '1') then
			Q <= '0';
		elsif (S = '1' and R = '1') then
			Q <= 'Z';			
		end if;

	end process;

end srlatch_v1;
