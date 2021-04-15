
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity strobe_sync is

	port 
	(
		RESET		: in std_logic;
		CLK	   : in std_logic;		-- Clock (faster than DIN)
		DIN	   : in std_logic;		-- Input signal
		STROBE_FALLING  : out std_logic;	-- HIGH for one clock cycle when DIN rises
		STROBE_RISING   : out std_logic  -- HIGH for one clock cycle when DIN falls
	);

end entity;

architecture rtl of strobe_sync is

begin

	rising: 
	process(CLK,DIN) is
		variable state : integer range 0 to 1;
	begin
		if (RESET = '0') then
			STROBE_RISING  <= '0';
			state := 0;
		elsif rising_edge(CLK) then
			case state is
			when 0 =>
				-- Sequential Statement(s)
				if DIN = '1' then
					state := 1;
					STROBE_RISING <= '1';
				end if;
			when 1 =>
				-- Sequential Statement(s)
				STROBE_RISING <= '0';
				if (DIN = '0') then
					state := 0;
				end if;
			when others =>
				-- Sequential Statement(s)
				state := 0;
			end case;
		end if;
	end process;
	
	falling: 
	process(CLK,DIN) is
		variable state : integer range 0 to 1;
	begin
		if (RESET = '0') then
			STROBE_FALLING <= '0';
			state := 0;
		elsif rising_edge(CLK) then
			case state is
			when 0 =>
				-- Sequential Statement(s)
				STROBE_FALLING <= '0';
				if DIN = '1' then
					state := 1;
				end if;
			when 1 =>
				-- Sequential Statement(s)
				if (DIN = '0') then
					state := 0;
					STROBE_FALLING <= '1';
				end if;
			when others =>
				-- Sequential Statement(s)
				state := 1;
			end case;
		end if;
	end process;	

end rtl;
