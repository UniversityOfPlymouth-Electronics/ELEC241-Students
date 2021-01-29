library ieee;
use ieee.std_logic_1164.all;

entity regn is
   generic( W	: natural  :=	16 );	
   port ( 
      clk     : in    std_logic;      --Clock
      load    : in    std_logic;      --Clock enable
      reset   : in    std_logic;      --Async reset
      datain  : in    std_logic_vector(W-1 downto 0);	
      dataout : out   std_logic_vector(W-1 downto 0)
   );
end entity;

architecture rtl of regn is
begin
	
	process (clk, reset)	
	begin
		if (reset = '0') then 
			dataout <= (others => '0');	
		elsif (rising_edge(clk)) then
			if (load = '1') then 
				dataout <= datain;		
			end if;
		end if;
	end process;
end rtl;


