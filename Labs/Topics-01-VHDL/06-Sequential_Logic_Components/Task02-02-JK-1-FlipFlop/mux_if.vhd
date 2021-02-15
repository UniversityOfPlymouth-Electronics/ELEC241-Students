library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_case is

	port 
	(
		X	   : in std_logic_vector  (15 downto 0);	-- 16 inputs
		SEL	   : in std_logic_vector  (2  downto 0);     -- 3-bit selector
		EN     : in std_logic;							-- EN (Active Low, Tristate)
		
		Y      : out std_logic 	
	);

end entity;

architecture super_mux_v1 of mux_case is
begin

	process (X,SEL) is
	begin
		
		if (SEL = "000") then
			Y <= X(0);
		elsif (SEL = "001") then
			Y <= X(1);
		elsif (SEL = "010") then
			Y <= X(2);
		elsif (SEL = "011") then
			Y <= X(3);
		elsif (SEL = "100") then
			Y <= X(4);
		elsif (SEL = "101") then
			Y <= X(5);
		elsif (SEL = "110") then
			Y <= X(6);
		else
			Y <= X(7);
		end if;
									
	end process;

end super_mux_v1;
