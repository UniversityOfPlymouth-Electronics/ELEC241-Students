library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--These next two cannot be used together!
--use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--Serial to parallel shift register
entity uop_shiftreg_s2p is
	generic ( N : positive := 8);
	port 
	(
		--Inputs
		CLK	   : in std_logic;
		START		: in std_logic;
		DATA_IN  : in std_logic;
		RESET    : in std_logic;
		--Outputs
		DATA_OUT : out std_logic_vector( (N-1) downto 0 )
	);
end entity;

architecture s2p of uop_shiftreg_s2p is	
	type state_type is (WAITING, SHIFTING);

	-- Register to hold the current state
	signal state   : state_type;

begin	
	process (CLK,RESET) is
		variable Nreg : std_logic_vector( (N-1) downto 0 );		
		variable idx  : integer := 0;	
	begin
		if (RESET = '0') then
			Nreg := (others=>'0');
			state <= WAITING;
			DATA_OUT <= (others=>'0');
		else
			if rising_edge(CLK) then
			
				case state is
					when WAITING=>
						if START = '1' then
							idx := 0;
							state <= SHIFTING;
						end if;
					when SHIFTING=>
						Nreg(idx) := DATA_IN;
						idx := idx + 1;
						if (idx = N) then
							state <= WAITING;
							DATA_OUT <=Nreg;
						end if;
				end case;
				
			end if;
		end if;			
	end process;
end s2p;