-- Quartus II VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity thehalfadder is

	port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		sum    : out std_logic;
		cout   : out std_logic
	);

end entity;

architecture adder_half of thehalfadder is
begin

	sum  <= a XOR b;
	cout <= a AND b; 

end adder_half;




