-- Quartus Prime VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity elec241_shift_register is

	generic
	(
		NUM_STAGES : natural := 4
	);

	port 
	(
		clk		: in std_logic;
		data_in	: in std_logic;
		data_out	: out std_logic
	);

end entity;

architecture rtl of elec241_shift_register is

-- THE SHIFT REGISTER MUST BE BUILT WITH STRUCTURAL VHDL
--
-- You will also need to create a separate D-Flip Flop component (in a separate VHDL file).
-- (The DFF component is normally created with behavioural VHDL)

begin



end rtl;
