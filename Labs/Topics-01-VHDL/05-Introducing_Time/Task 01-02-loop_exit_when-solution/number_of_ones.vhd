library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

--This entity counts the number of leading '1' terms
entity number_of_ones is

	port 
	(
		X	   : in std_logic_vector  (15 downto 0);		 -- 16 inputs
		GO     : in std_logic;								 -- GO - count the number of leading 1's (level triggered)
		Y      : out std_logic_vector(3 downto 0) := "0000"  -- numerical result 	
	);

end entity;


-- ARCHITECTURE VERSION 1
architecture number_of_ones_v1 of number_of_ones is
begin

	process (X,GO) is
	
		--Local declarations
		variable idx : integer range -1 to 15 := 15;
		variable next_bit : std_logic;
		variable res : integer;
		
	begin
	
		-- Initialise these explicitly (and outside the if, to avoid inadvertently latching their values)
		idx := 15;
		res := 0;
		
		-- Is the 'GO' bit set?
		if (GO = '1') then		
			loop
				-- are we done?
				exit when idx = -1;
				
				-- if no, get the next bit
				next_bit := X(idx);
				
				--decrement the index
				idx := idx - 1;	
				
				-- if this bit is a zero, skip the rest of the loop body
				next when next_bit = '0';
				
				-- otherwise, add one to the count
				res := res + 1;								
				
			end loop;

			Y <= CONV_STD_LOGIC_VECTOR(res, 4);				--write the result to the output

		else
			Y <= "ZZZZ";
		end if; 											
									
	end process;

end number_of_ones_v1;

