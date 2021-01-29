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

architecture leading_ones_v1 of leading_ones is
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

			next_bit := X(idx);								--get the next bit
						
			while ((next_bit = '1') and (idx>0))  loop		--is the next bit a '1'? If so, enter the loop body
				res := res + 1;								--Add one to the running total	
				idx := idx - 1;								--Move down to the next bit position
				next_bit := X(idx);							--get the next bit
			end loop;

			Y <= CONV_STD_LOGIC_VECTOR(res, 4);				--write the result to the output

		else
			Y <= "ZZZZ";
		end if; 											
									
	end process;

end leading_ones_v1;
