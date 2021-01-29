library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity uop_dregister is
	port 
	(
		D	   : in std_logic;	-- D input							
		CLK    : in std_logic;	-- CLK, this time falling edge
		RESET  : in std_logic;  -- Active LOW asnchronous reset
		Q      : out std_logic 	-- Q output
	);
end entity;

architecture dff_v1 of uop_dflipfop  is
begin
	--I am going to use behavioural logic
	process (D,CLK,RESET) is
		--Local declarations
	begin
		if (RESET = '0') then
			Q <= '0';
		else
			--Latch Q<=D on falling edge
			if (clk'event) and (CLK = '1') then
				Q <= D;
			end if; --end if falling edge
		end if;	--end if RESET			
	end process;
end dff_v1;
