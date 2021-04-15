library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Package declaration
package elec241 is

	-- Type Declaration (optional)
	type instruction is (readback, leds_and_switches, illegal); -- Different instructions suppported 
	type data_source is (spi_slave_rx, reserved, switches, operand); -- 0 .. 4 (3 bits)
	subtype select_lines is std_logic_vector(2 downto 0);
	
	-- Function declarations
	function select_source(aa : data_source ) return select_lines;
	function instruction_for(dat : std_logic_vector(3 downto 0)) return instruction;
	
end package elec241;

-- Package body - where the shared functions, constants, signals and procedures all live
package body elec241 is

	-- FUNCTIONS are similar to process blocks. They take parameters and can return results. They do not support wait statements.
	-- You can use procedures in testbenches as unlike functions, they support wait statements.

	-- Maps the funcion source to the select lines for the MUX block
	-- Again, done to make code cleaner.
	function select_source(aa : data_source ) return select_lines is
	begin
		case aa is
			when spi_slave_rx =>
				return "001";
			when reserved =>
				return "010";
			when switches =>
				return "100";
			when operand =>
				return "000";
		end case;
	end select_source;
	
	-- Maps the instructions bits to an instruction enumerated type. This is done simply to make the code cleaner and less error prone
	-- Case statements on enumerated types must have full coverage, or it will not compile.
	function instruction_for(dat : std_logic_vector(3 downto 0)) return instruction is
	begin	
		case dat is
			when "0000" =>
				return readback;
			when "0001" =>
				return leds_and_switches;
			when others =>
				return illegal;
		end case;
	end instruction_for;
	

end package body elec241;