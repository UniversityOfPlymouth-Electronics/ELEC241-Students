entity vector_scrunge is

	port
	(
		-- Input ports
		X	: in  bit_vector(7 downto 0);
		A	: in  bit;

		-- Output ports
		Y	: out bit_vector(7 downto 0)
	);
end vector_scrunge;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture circuit1 of vector_scrunge is

	-- Declarations (optional)

begin

	Y <=     X when A = '0' else
		 not X when A = '1';
					
end circuit1;