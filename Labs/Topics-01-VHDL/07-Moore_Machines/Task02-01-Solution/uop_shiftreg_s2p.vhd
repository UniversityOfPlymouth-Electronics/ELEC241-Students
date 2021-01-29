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
		CLK	     : in std_logic;
		DATA_IN  : in std_logic;
		SHIFT    : in std_logic;
		RESET    : in std_logic;
		--Outputs
		DATA_OUT : out std_logic_vector( (N-1) downto 0 )
	);
end entity;

architecture s2p of uop_shiftreg_s2p is	
begin	
	process (CLK,RESET,SHIFT) is
		variable idx : integer := 0;
		variable Nreg : std_logic_vector( (N-1) downto 0 );
	begin
		if (RESET = '0') then
			Nreg := ('0', others=>'0');
			idx := 0;
			DATA_OUT <= ('0', others=>'0');
		else
			if ((CLK'event and CLK = '1') and (SHIFT = '1')) then
				Nreg(idx) := DATA_IN;
				idx := idx + 1;
				if (idx = N) then
					idx := 0;
					DATA_OUT <= Nreg;
				end if;
			end if;
		end if;			
	end process;
end s2p;