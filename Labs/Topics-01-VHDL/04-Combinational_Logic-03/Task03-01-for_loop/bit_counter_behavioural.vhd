library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity bit_counter is	
	generic
	(
		DATA_WIDTH : natural := 16
	);
	
	port
	(	
		-- Input ports
		A	: in  std_logic_vector((DATA_WIDTH-1) downto 0);
				
		-- Output ports
		Y	: out std_logic_vector((DATA_WIDTH-1) downto 0)
	);
end bit_counter;


architecture bit_counter_behavioural of bit_counter is

	-- Declarations (optional)
	variable res : integer;

begin
	-- Process Statement (optional)
	plist1:	--optional label
	process(A) is
		-- Declaration(s)
		variable Nbits : integer;
	begin
		-- Sequential Statement(s)
		Nbits := 0;
		for n in (DATA_WIDTH-1) downto 0 loop
			if (A(n) = '1') then 
				Nbits := Nbits + 1;
			end if;
		end loop;
		res := Nbits;
	end process;
	
	Y <= CONV_STD_LOGIC_VECTOR(res, DATA_WIDTH);
	
end bit_counter_behavioural;

