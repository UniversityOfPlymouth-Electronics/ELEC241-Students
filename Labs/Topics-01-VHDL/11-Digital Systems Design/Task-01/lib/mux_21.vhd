
library ieee;
use ieee.std_logic_1164.all;

entity mux_21 is

	generic ( N : natural := 16 );

	port 
	(
		A	: in std_logic_vector(N-1 downto 0);
		B	: in std_logic_vector(N-1 downto 0);
		SEL : in std_logic;
		Y	: out std_logic_vector(N-1 downto 0)
	);

end entity;

architecture rtl of mux_21 is
begin

	Y <= A when SEL = '0' else B;

end rtl;