entity vector_bits is

	port
	(
		-- Input ports
		X	: in  bit_vector(7 downto 0);	--this is an 8-bit value
		
		-- Output ports
		Y	: out bit_vector(1 downto 0)	-- 2 bit output
	);
end vector_bits;


architecture circuit1 of vector_bits is

	-- Declarations (optional)

begin
	
	Y(0) <= X(0) and X(1) and X(2) and X(3);
	Y(1) <= X(4) and X(5) and X(6) and X(7);
					
end circuit1;