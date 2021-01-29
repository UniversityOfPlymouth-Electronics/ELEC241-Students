library ieee;
use ieee.std_logic_1164.all;

entity control_button is

	port(
		clk 			: in	std_logic;
		X	 			: in	std_logic;		--Switch input
		timer_ready : in std_logic;		--Timer is ready input
		
		--Outputs
		reset_timer	: out std_logic;
		start_timer : out std_logic;
		Y			 	: out	std_logic
	);

end entity;

architecture rtl of control_button is

	-- Build an enumerated type for the state machine
	type state_type is (IDLE, ST, HD, DT);

	-- Register to hold the current state
	signal state   : state_type := IDLE;

begin

	-- Logic to advance to the next state
	process (clk)
	begin
		if (rising_edge(clk)) then
			case state is
			
				when IDLE=>
					if X = '1' then
						state <= ST;
					else
						state <= IDLE;
					end if;
					
				when ST=>
					state <= HD;
	
				when HD=>
					if (X = '0') then
						state <= IDLE;
					elsif (timer_ready = '1') then 
						state <= DT;
					end if;
					
				when DT =>
					state <= DT;
					
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when IDLE =>
				Y <= '0';
				start_timer <= '0';
				reset_timer <= '1';
	
			when ST =>
				Y <= '0';
				start_timer <= '1';
				reset_timer <= '0';
				
			when HD =>
				Y <= '0';
				start_timer <= '0';
				reset_timer <= '0';
				
			when DT =>
				Y <= '1';
				start_timer <= '0';
				reset_timer <= '0';
				
		end case;
	end process;

end rtl;
