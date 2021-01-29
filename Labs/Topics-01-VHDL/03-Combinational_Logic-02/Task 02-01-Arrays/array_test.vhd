library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity ARRAY_TEST is

 port( Y: out bit);

End entity;

--data flow method
architecture arraytest1 of ARRAY_TEST is

type byte is array (7 downto 0) of bit;
signal X : byte;
		
begin

	-- Array literal example. 
	--    These are in order from index 7 downto 0
	--    msb                                lsb
	X <= ('1', '0', '0', '1', '1', '0', '0', '0');
	Y <= X(7);	--least significant bit

end architecture arraytest1;
