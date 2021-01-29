-- Quartus II VHDL Template
-- Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity moore_state_machine is
	generic
	(
		P : std_logic_vector(3 downto 0) := "0000"
	);

	port(
		clk		 : in	std_logic;
		input	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic
	);

end entity;

architecture my_fsm of moore_state_machine is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '0' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					--Reset condition
					if input = P(3) then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if input = P(2) then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
					if input = P(1) then
						state <= s3;
					else
						state <= s2;
					end if;
				when s3 =>
					if input = P(0) then
						state <= s4;
					else
						state <= s3;
					end if;
				when s4 =>
					if input = P(3) then
						state <= s1;
					else
						state <= s0;
					end if;				
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				output <= '0';
			when s1 =>
				output <= '0';
			when s2 =>
				output <= '0';
			when s3 =>
				output <= '0';
			when s4 =>
				output <= '1';				
		end case;
	end process;

end my_fsm;
