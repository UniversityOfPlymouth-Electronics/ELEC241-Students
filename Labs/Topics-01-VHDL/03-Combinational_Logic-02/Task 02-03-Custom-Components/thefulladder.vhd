library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity thefulladder is

	port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		cin    : in std_logic;
		sum    : out std_logic;
		cout   : out std_logic
	);

end entity;

architecture adder_full of thefulladder is
	signal t1, t2, t3, t4 : std_logic;
begin

	sum  <= a XOR b XOR cin;
	
	t1   <= NOT a AND b AND cin; 
	t2   <= a AND NOT b AND cin;
	t3   <= a AND b AND NOT cin;
	t4   <= a AND b AND cin;
	
	cout <= t1 OR t2 OR t3 OR t4;
	
end adder_full;

-- A B C   C S
-- 0 0 0   0 0
-- 0 0 1   0 1
-- 0 1 0   0 1
-- 0 1 1   1 0
-- 1 0 0   0 1
-- 1 0 1   1 0
-- 1 1 0   1 0
-- 1 1 1   1 1
