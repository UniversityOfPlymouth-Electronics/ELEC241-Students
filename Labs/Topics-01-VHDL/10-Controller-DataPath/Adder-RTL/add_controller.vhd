-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity add_controller is

	port(
		clk	 : in	std_logic;
		go	    : in	std_logic;
		reset	 : in	std_logic;
		
		EN 	 : out std_logic;
		S0     : out std_logic;
		S1     : out std_logic;
		S2     : out std_logic
	);

end entity;

architecture rtl of add_controller is

	-- Build an enumerated type for the state machine
	type state_type is (A, B, C, D);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '0' then
			state <= D;
		elsif (rising_edge(clk)) then
			case state is
				when A=>
					state <= B;
				when B=>
					state <= C;
				when C=>
					state <= D;
				when D =>
					if go = '1' then
						state <= A;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		--Default signal values
		EN <= '0';
		S0 <= '0';
		S1 <= '0';
		S2 <= '0';
		
		case state is
			when A =>
				S0 <= '1';
				EN <= '1';
			when B =>
				S1 <= '1';
				EN <= '1';
			when C =>
				S1 <= '1';
				S2 <= '1';
				EN <= '1';				
			when D =>
				--None are asserted high
		end case;
	end process;

end rtl;
