library ieee;
use ieee.std_logic_1164.all;

entity regn is
   generic( W	: natural  :=	16 );	
   port ( 
      clk     : in    std_logic;      --Clock
      load    : in    std_logic;      --Clock enable
      reset   : in    std_logic;      --Async reset
      datain  : in    std_logic_vector(W-1 downto 0);	
		OE      : in    std_logic;			--Output enable
      dataout : out   std_logic_vector(W-1 downto 0)
   );
end entity;

architecture rtl of regn is
begin
	
	process (clk, reset)	
		variable reg : std_logic_vector(W-1 downto 0);
	begin
		if (reset = '0') then 
			reg := (others => 'Z');	
			dataout <= reg;	
			
		elsif (rising_edge(clk)) then
			if (load = '1') then 
				reg := datain;		
			end if;
			
			if (OE = '1') then
				dataout <= reg;
			else
				dataout <= (others => 'Z');
			end if;
		end if;
	end process;
end rtl;


