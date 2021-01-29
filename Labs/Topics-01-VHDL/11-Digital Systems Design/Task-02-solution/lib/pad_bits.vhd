
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pad_bits is

	generic
	(
		DATA_WIDTH_IN  : natural := 4;
		DATA_WIDTH_OUT : natural := 16
	);

	port 
	(
		X	   : in  std_logic_vector ((DATA_WIDTH_IN-1) downto 0);
		Y	   : out std_logic_vector ((DATA_WIDTH_OUT-1) downto 0)
	);

end entity;

architecture rtl of pad_bits is

begin

	process(X)
		
	begin
		if (DATA_WIDTH_IN > DATA_WIDTH_OUT) then
			Y <= X(Y'range);
		elsif (DATA_WIDTH_IN < DATA_WIDTH_OUT) then
			--Zero pad
			Y <= (others => '0');
			for n in X'range loop
				Y(n) <= X(n);
			end loop;
			--Y(X'range) <= X;
		else
			Y <= X;
		end if;
	end process;

end rtl;