-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity seven_seg_decode is

	port(
		input	 : in	 std_logic_vector(3 downto 0);		-- Binary input (0..15)
		reset	 : in	 std_logic;								-- Asynchronous reset (sets output to blank)
		en     : in  std_logic;								-- Input enable. Output is latched when 0
		output : out std_logic_vector(6 downto 0)  -- Decoded output for each of the 7 LEDs
	);

end entity;

architecture v1 of seven_seg_decode is
-- MODIFY THE CODE BELOW THIS LINE --



begin


end v1;
