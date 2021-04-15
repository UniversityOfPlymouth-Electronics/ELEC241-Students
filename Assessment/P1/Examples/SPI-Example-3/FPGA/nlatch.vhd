library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Nlatch is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		RESET : in std_logic;
		D	   : in std_logic_vector((DATA_WIDTH-1) downto 0);
		LE	   : in std_logic;
		Q     : out std_logic_vector ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of Nlatch is
begin

	process(D,LE)
	begin
		if (RESET = '0') then
			Q <= (others => '0');
		elsif LE='1' then
			Q <= D;
		end if;
	end process;

end rtl;
