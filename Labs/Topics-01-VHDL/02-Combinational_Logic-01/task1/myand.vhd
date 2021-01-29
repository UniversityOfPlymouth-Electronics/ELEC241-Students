entity myand is

	port
	(
		-- Input ports
		A	: in  bit := '0';
		B	: in  bit := '0';

		-- Output ports
		Y	: out bit
	);
end myand;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture myand_v1 of myand is

	-- Declarations (optional)

begin

	Y <= A and B;

end myand_v1;
