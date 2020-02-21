-- Simple register.
-- Outputs are NOT connected to a bus

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm8 is


	port
	(
		clk		  	  : in std_logic;		--Clock
		run	  		  : in std_logic;		--Run (on or off)
		reset	  		  : in std_logic;		--Async reset
		DUTY   	     : in std_logic_vector(7 downto 0);	--Total time period
		PERIOD	     : in std_logic_vector(7 downto 0);	--Total time period		
		q		  		  : out std_logic		--Data output
	);

end entity;

architecture rtl of pwm8 is
	signal p : integer range 0 to 255;
	signal d : integer range 0 to 255;
begin
	
	p <= to_integer(unsigned(PERIOD));
	d <= to_integer(unsigned(DUTY));
	
	process (clk, reset)	
		variable counter : Integer range 0 to 255;
		variable state : Integer range 0 to 1;
	begin
		if (reset = '0') then 
			counter := 0;
			state := 0;
			q <= '0';
		elsif (rising_edge(clk)) then

			case state is
				--Waiting for run to equal 1
				when 0 =>
					counter := 0;
					q <= '0';
					if (run = '1') then 
						state := 1;
						if (counter < d) then 
							q <= '1';
						else
							q <= '0';
						end if;
					end if;
					
				--Running
				when 1 =>
					if (run = '1') then
						if (counter < d) then 
							q <= '1';
						else
							q <= '0';
						end if;
						--Update count
						counter := counter + 1;
						if (counter = p) then 
							counter := 0;
						end if;					
					else  
						state := 0;
						q <= '0';
					end if;
					
				when others =>
					state := 0;
			end case;

		end if;
	end process;

end rtl;