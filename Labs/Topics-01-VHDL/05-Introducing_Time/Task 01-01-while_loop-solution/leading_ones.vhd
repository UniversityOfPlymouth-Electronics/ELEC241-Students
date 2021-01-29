library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

--This entity counts the number of leading '1' terms
entity leading_ones is
	generic
	(
		Nbits	: positive  :=	4
	);
	
	port 
	(
		X	   : in std_logic_vector  ((2 ** Nbits)-1 downto 0);		 			-- 16 inputs
		GO     : in std_logic;								 			-- GO - count the number of leading 1's (level triggered)
		Y      : out std_logic_vector( (Nbits-1) downto 0) := "0000"    -- numerical result 	
	);

end entity;

architecture leading_ones_v1 of leading_ones is

	constant N : positive := (2**Nbits);

begin

	process (X,GO) is
	
		--Local declarations
		variable idx : integer range -1 to N-1 := N-1;
		variable next_bit : std_logic;
		variable res : integer;
		
	begin
	
		-- Initialise these explicitly (and outside the if, to avoid inadvertently latching their values)
		idx := N-1;
		res := 0;
		
		-- Is the 'GO' bit set?
		if (GO = '1') then

			next_bit := X(idx);								--get the next bit
						
			while ((next_bit = '1') and (idx>0))  loop		--is the next bit a '1'? If so, enter the loop body
				res := res + 1;								--Add one to the running total	
				idx := idx - 1;								--Move down to the next bit position
				next_bit := X(idx);
			end loop;

			Y <= CONV_STD_LOGIC_VECTOR(res, Nbits);				--write the result to the output

		else
			Y <= ('Z', others=>'Z');
		end if; 											
									
	end process;

end leading_ones_v1;
