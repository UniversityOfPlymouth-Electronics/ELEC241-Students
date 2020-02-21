

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY demo1 IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		Y1 :  OUT  STD_LOGIC;
		Y2 :  OUT  STD_LOGIC
	);
END demo1;

ARCHITECTURE bdf_type OF demo1 IS 

COMPONENT myxor
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 y : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : myxor
PORT MAP(a => A,
		 b => B,
		 y => Y1);


Y2 <= A XOR B;


END bdf_type;