library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package elec241 is

	-- Type Declaration (optional)
	type instruction is (readback, leds_and_switches, illegal); -- Different instructions suppported 
	type internal_address is (none, spi_master_rx, spi_slave_rx, switches, operand); -- 0 .. 4 (3 bits)
	subtype address is std_logic_vector(2 downto 0);
	
	-- Subtype Declaration (optional)

	-- Constant Declaration (optional)

	-- Signal Declaration (optional)

	-- Component Declaration (optional)
	function address_of(aa : internal_address ) return address;
	function instruction_for(dat : std_logic_vector(3 downto 0)) return instruction;
	
end package elec241;


package body elec241 is

	-- Type Declaration (optional)

	-- Subtype Declaration (optional)

	-- Constant Declaration (optional)

	-- Function Declaration (optional)

	-- Function Body (optional)
	function address_of(aa : internal_address ) return address is
	begin
		case aa is
			when none =>
				return "000";
			when spi_master_rx =>
				return "001";
			when spi_slave_rx =>
				return "010";
			when switches =>
				return "011";
			when operand =>
				return "100";
		end case;
	end address_of;
		
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
	
	-- Procedure Declaration (optional)

	-- Procedure Body (optional)

end package body elec241;