library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--These next two cannot be used together!
--use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--This entity counts the number of leading '1' terms
entity my_counter is

	generic ( N : integer := 8);
	port 
	(
		--Clock
		CLK	   : in std_logic;
		
		--Control signals
		COUNT  : in std_logic;	--set HIGH to count; LOW to stop
		RESET  : in std_logic;	--Set LOW to reset (asynchronous)
		PR     : in std_logic_vector((N-1) downto 0) := ('0', others=>'0');	--Period register. When count = PR, recycle
		LOAD   : in std_logic;	--Load the PR register - active HIGH
		
		--Output signals
		REC    : out std_logic;	--Goes momentarily high when the counter re-cycles
		Y      : out std_logic_vector((N-1) downto 0) := ('0', others=>'0')  -- output only
	);
end entity;

architecture counterN_rising of my_counter is
	signal PeriodReg : std_logic_vector((N-1) downto 0) := ('1', others=>'1');
begin

	--Process for loading the Period Register
	process (CLK, LOAD, PR, COUNT, RESET)
	begin
		if (RESET='0') then
			PeriodReg <= ('1', others=>'1');	--Reset period register 
		elsif (CLK'event) and (CLK='1') and (LOAD='1') and (COUNT='0') then		--This is latching
			PeriodReg <= PR;
		end if;
	end process;

	--Process for counting
	process (CLK, COUNT, RESET) 
	variable x : unsigned ((N-1) downto 0) := ('0', others => '0');		--Internal state
	begin
		--Asychronous reset
		if (RESET = '0') then 
			x := ('0', others=>'0');			--Reset count
			--PeriodReg <= ('1', others=>'1');	--Reset period register
		else
			--Not the reset mode
			if (CLK'event) and (CLK='1') and (COUNT='1') then
				x := x + 1;
				if (std_logic_vector(x) = PeriodReg) then
					x := ('0', others=>'0');
					REC <= '1';
				else
					rec <= '0';
				end if;
			end if; --end if CLK'event...
		end if;	--end if RESET
		
		Y <= std_logic_vector(x);
	end process;
	
end counterN_rising;