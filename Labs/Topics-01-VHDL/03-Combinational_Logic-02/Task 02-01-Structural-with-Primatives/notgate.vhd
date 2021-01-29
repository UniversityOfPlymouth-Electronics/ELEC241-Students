library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declare entity - 2 inputs, 1 output
--
--    A1---|---------|
--         | LOGIC   |------Y
--    A2---|---------|

Entity NOTGATE is

 port( A1: in std_logic; Y: out std_logic);

End entity;

architecture myLogic of NOTGATE is

begin

	Y <= not A1;

end myLogic;