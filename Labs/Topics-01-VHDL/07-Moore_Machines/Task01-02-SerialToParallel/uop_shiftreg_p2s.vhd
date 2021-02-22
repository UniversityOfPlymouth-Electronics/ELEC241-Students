library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--These next two cannot be used together!
--use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--This entity counts the number of leading '1' terms
entity uop_shiftreg_p2s is
	generic ( N : positive := 8);
	port 
	(
		--Inputs
		CLK	     : in std_logic;
		DATA_IN  : in std_logic_vector( (N-1) downto 0 );
		--Control
		LOAD     : in std_logic;		--HIGH -> Load parallel data; HIGH -> Shift Out
		RESET    : in std_logic;
		
		--Outputs
		DATA_OUT : out std_logic
	);
end entity;

architecture p2s of uop_shiftreg_p2s is	

begin	
	process (CLK) is
		variable idx  : integer := 0;
		variable Nreg : std_logic_vector( (N-1) downto 0 );
	begin
		if (RESET='0') then
			idx := 0;
			Nreg := (others => '0');
		elsif (CLK'event and CLK = '1') then
			if (LOAD = '1') then 
				--LOAD Data into parallel latch
				Nreg := DATA_IN;	--Copy the parallel word into the internal register
				idx  := 0;			--Reset the index to the lsb
				DATA_OUT <= Nreg(idx);
			elsif (idx < (N-1)) then
				idx := idx + 1;
				DATA_OUT <= Nreg(idx) after 2 ps;
			end if;
	    end if;			
	end process;
end p2s;