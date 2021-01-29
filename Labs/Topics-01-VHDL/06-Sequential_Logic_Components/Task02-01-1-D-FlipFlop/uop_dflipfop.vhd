library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity uop_dflipfop is
	port 
	(
		D	   : in std_logic;	-- D input							
		CLK    : in std_logic;	-- CLK
		Q      : out std_logic 	-- Q output
	);
end entity;

architecture dff_v1 of uop_dflipfop  is
begin
	--I am going to use behavioural logic
	process (D,CLK) is
		--Local declarations
	begin
		if (clk'event) and (CLK = '1') then
			Q <= D;
		end if;				
	end process;
end dff_v1;
