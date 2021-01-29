-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity myxor is

	port (
		a	   : in std_logic;
		b		: in std_logic;
		y 		: out std_logic );

end entity;

architecture myxor_v1 of myxor is

signal y1 : std_logic;
signal y2 : std_logic;

begin

	y1 <= (not a and b);
	y2 <= (a and not b);
	y <= y1 or y2;
	
end myxor_v1;