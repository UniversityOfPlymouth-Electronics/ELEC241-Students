library ieee;
use ieee.std_logic_1164.all;

-- Quartus Prime VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;

entity constant_source is

	generic
	(
		N 		: natural := 16
	);

	port 
	(
		X : in std_logic := '0';
		Y : out std_logic_vector(N-1 downto 0)
	);

end entity;

architecture rtl of constant_source is
begin
	Y <= (others => X);
end rtl;
