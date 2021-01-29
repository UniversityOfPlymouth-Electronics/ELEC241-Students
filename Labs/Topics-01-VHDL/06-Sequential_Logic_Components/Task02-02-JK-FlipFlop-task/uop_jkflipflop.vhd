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
	

		Q <= outputState;
	end process;

end uop_jkflipflop_v1;
