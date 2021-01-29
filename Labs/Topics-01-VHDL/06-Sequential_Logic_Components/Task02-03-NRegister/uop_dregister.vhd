library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity uop_dregister is
	port 
	(
		D	   : in std_logic_vector(15 downto 0);	-- D input							
		CLK    : in std_logic;	-- CLK, this time falling edge
		RESET  : in std_logic;  -- Active LOW asnchronous reset
		LOAD   : in std_logic;  -- Active HIGH - load value into register
		Q      : out std_logic_vector(15 downto 0) 	-- Q output
	);
end entity;

architecture dreg_v1 of uop_dregister  is
begin
	--I am going to use behavioural logic
	process (D,CLK,RESET, LOAD) is
		--Local declarations
	begin
		if (RESET = '0') then
			Q <= ('0',others=>'0');
		else
			--Latch Q<=D on rising edge is LOAD bit is set HIGH
			if (clk'event) and (CLK = '1') and (LOAD = '1') then
				Q <= D;
			end if; --end if falling edge
		end if;	--end if RESET			
	end process;
end dreg_v1;
