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


architecture myand_v2 of myand is

	-- Declarations (optional)

begin

	Y <= '1' when A='1' and B='1' else '0';

end myand_v2;

