library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declare entity - 2 inputs, 1 output
--
--    A1---|---------|
--         | LOGIC   |------Y
--    A2---|---------|

Entity ORGATE2 is

 port( A1, A2 : in std_logic; Y: out std_logic);

End entity;

architecture myLogic of ORGATE2 is

begin

	Y <= A1 or A2;

end myLogic;