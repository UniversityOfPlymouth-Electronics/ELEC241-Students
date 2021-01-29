-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity uop_pattern_gen is

	port(
		clk		 : in	std_logic;
		pattern	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic
	);

end entity;

architecture pat_gen of uop_pattern_gen is

	-- Build an enumerated type for the state machine
	type state_type is (RES, p0b0, p0b1, p0b2, p0b3, p1b0, p1b1, p1b2, p1b3);

	-- Register to hold the current state
	signal state   : state_type := RES;

begin
	-- Logic to advance to the next state
	process (clk)
	begin
		if (rising_edge(clk)) then
		
			case state is
				when RES=>
					if reset = '0' then
						state <= RES;
					else
						if (pattern = '0') then
							state <= p0b0;
						else
							state <= p1b0;
						end if;
					end if;
					
				--Pattern 0
				when p0b0=>
					state <= p0b1;
				when p0b1=>
					state <= p0b2;
				when p0b2=>
					state <= p0b3;
				when p0b3=>
					state <= RES;

				--Pattern 1
				when p1b0=>
					state <= p1b1;
				when p1b1=>
					state <= p1b2;
				when p1b2=>
					state <= p1b3;
				when p1b3=>
					state <= RES;
			end case;
				
		end if; --end if rising_edge
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when RES =>
				output <= '0';
				
			when p0b0=>
				output <= '1';
			when p0b1=>
				output <= '0';
			when p0b2=>
				output <= '0';
			when p0b3=>
				output <= '1';
				
			when p1b0=>
				output <= '1';
			when p1b1=>
				output <= '1';
			when p1b2=>
				output <= '0';
			when p1b3=>
				output <= '1';				
		end case;
	end process;

end pat_gen;
