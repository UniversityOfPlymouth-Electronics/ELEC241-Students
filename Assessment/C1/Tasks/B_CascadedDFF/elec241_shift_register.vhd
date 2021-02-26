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
		enable	: in std_logic;
		data_in	: in std_logic;
		data_out	: out std_logic
	);

end entity;

architecture rtl of elec241_shift_register is



begin



end rtl;
