-- Quartus Prime VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity myadd is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		a	   : in signed	((DATA_WIDTH-1) downto 0);
		b	   : in signed	((DATA_WIDTH-1) downto 0);
		result : out signed ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of myadd is
begin

	result <= a + b;

end rtl;
