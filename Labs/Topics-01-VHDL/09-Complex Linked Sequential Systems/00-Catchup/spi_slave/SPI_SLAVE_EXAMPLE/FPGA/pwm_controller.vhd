library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_controller is

	generic
	(
		DATA_WIDTH : natural := 16
	);

	port 
	(
		clk			: in std_logic;
		datain	   : in std_logic_vector (DATA_WIDTH-1 downto 0);
		opto_a	   : in std_logic;
		opto_b	   : in std_logic;
		motor_a	   : out std_logic;
		motor_b	   : out std_logic
	);

end entity;




--architecture rtl of pwm_controller is
--
--	signal position : integer := 0;
--	signal desired_position : integer;
--	signal polarity : std_logic;
--	
--begin
--
--	desired_position <= to_integer(unsigned(datain(DATA_WIDTH-2 downto 0)));
--	polarity <= datain(DATA_WIDTH-1);
--
--	process(clk)
--
--		type state_type is (s0, s1, s2, s3);
--		variable state : state_type := s0;
--		variable whatnext : std_logic := '1';
--		
--	begin
--
--		if rising_edge(clk) then
--		
--			-- DEFAULT MOTOR STATE
--			if (position < desired_position) and (position < 200) then
--				--Advance
--				motor_a <= polarity;
--				motor_b <= not polarity;
--			elsif (position > desired_position) and (position > 0) then
--				--Reverse
--				motor_a <= not polarity;
--				motor_b <= polarity;
--			else 
--				--Freewheel (gentle brake)
--				motor_a <= '0';
--				motor_b <= '0';
--			end if;		
--		
--			-- Update position
--			case state is
--					
--				when s0 =>
--					if opto_a = whatnext then
--						state := s1;
--						whatnext := not opto_b;
--					end if;
--					
--				when s1 =>
--					if opto_b = whatnext then
--						state := s2;
--						whatnext := not opto_a;
--					end if;
--					
--				when s2 =>
--					if (opto_a = whatnext) then
--						state := s3;
--						whatnext := not opto_b;
--					end if;
--					
--				when s3 =>
--					if (opto_b = whatnext) then
--					
--						state := s0;
--						whatnext := not opto_a;
--						
--						--update position
--						if (datain = "10") then
--							position <= position + 1;
--						elsif (datain = "01") then
--							position <= position - 1;
--						end if;
--						
--					end if; --case 3
--			end case;
--		end if;
--	end process;
--	
--
--end rtl;




architecture rtl2 of pwm_controller is
begin

				motor_a <= datain(0);
				motor_b <= datain(1);

end rtl2;
