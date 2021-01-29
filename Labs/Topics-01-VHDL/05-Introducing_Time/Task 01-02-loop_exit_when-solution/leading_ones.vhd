library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

--This entity counts the number of leading '1' terms
entity leading_ones is

	port 
	(
		X	   : in std_logic_vector  (15 downto 0);		 -- 16 inputs
		GO     : in std_logic;								 -- GO - count the number of leading 1's (level triggered)
		Y      : out std_logic_vector(3 downto 0) := "0000"  -- numerical result 	
	);

end entity;


-- ARCHITECTURE VERSION 2
architecture leading_ones_v2 of leading_ones is
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
			    --Get the next bit
				next_bit := X(idx);								
				
				--If it is a zero, then we quit the loop
				exit when next_bit = '0';
				
				--otherwise it's a one - so increment the count
				res := res + 1;								
				
				--Move down to the next bit position
				idx := idx - 1;					
				
				--Are we done?			
				exit when idx = -1;
				
			end loop;

			--write the result to the output
			Y <= CONV_STD_LOGIC_VECTOR(res, 4);				

		else
			Y <= "ZZZZ";
		end if; 											
									
	end process;

end leading_ones_v2;
