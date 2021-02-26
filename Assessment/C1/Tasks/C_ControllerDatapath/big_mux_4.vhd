library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity big_mux_4 is

	generic ( N : positive := 8 );
	port(
		X0     : in	std_logic_vector(N-1 downto 0);
		X1     : in	std_logic_vector(N-1 downto 0);
		X2     : in	std_logic_vector(N-1 downto 0);
		X3     : in	std_logic_vector(N-1 downto 0);
		sel    : in	std_logic_vector(1 downto 0);
		Q      : out    std_logic_vector(N-1 downto 0)
	);

end entity;

architecture rtl of big_mux_4 is

begin

	with sel select	Q <= 	
		X0 when "00",
		X1 when "01",
		X2 when "10",
		X3 when "11",
		(others=>'X') when others;	
end rtl;