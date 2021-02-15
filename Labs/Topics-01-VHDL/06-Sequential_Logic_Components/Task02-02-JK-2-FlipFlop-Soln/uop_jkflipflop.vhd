library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity uop_jkflipflop is
	port 
	(
		J	   : in std_logic;	-- J input							
		K      : in std_logic;  -- K input
		CLK    : in std_logic;  -- Clock (falling edge triggered)
		Q      : out std_logic 	-- Q output
	);
end entity;

architecture uop_jkflipflop_v1 of uop_jkflipflop is
begin
	process (J,K,CLK) is
		--Local declarations
		variable outputState : std_logic := '0';
	begin

		-- ************************
		-- WRITE YOUR SOLUTION HERE
		-- ************************	
		if falling_edge(CLK) then
			if    J='1' and K='0' then
				outputState := '1';
			elsif J='0' and K='1' then
				outputState := '0';
			elsif J='1' and K='1' then
				outputState := not outputState;
			end if; 
		end if;
		Q <= outputState;
	end process;

end uop_jkflipflop_v1;
