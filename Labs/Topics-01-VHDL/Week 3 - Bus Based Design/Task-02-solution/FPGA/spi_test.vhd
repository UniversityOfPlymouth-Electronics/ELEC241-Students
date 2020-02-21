-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.2 Build 203 01/18/2017 SJ Standard Edition"
-- CREATED		"Tue Feb 26 07:42:09 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY spi_test IS 
	PORT
	(
		CLOCK_50MHZ :  IN  STD_LOGIC;
		LED_7 :  OUT  STD_LOGIC;
		LED_6 :  OUT  STD_LOGIC;
		LED_5 :  OUT  STD_LOGIC;
		LED_4 :  OUT  STD_LOGIC;
		LED_3 :  OUT  STD_LOGIC;
		LED_2 :  OUT  STD_LOGIC;
		LED_1 :  OUT  STD_LOGIC;
		LED_0 :  OUT  STD_LOGIC
	);
END spi_test;

ARCHITECTURE bdf_type OF spi_test IS 

COMPONENT controller
	PORT(CLK : IN STD_LOGIC;
		 READY : IN STD_LOGIC;
		 reset : OUT STD_LOGIC;
		 R1_LD : OUT STD_LOGIC;
		 R1_OE : OUT STD_LOGIC;
		 R2_LD : OUT STD_LOGIC;
		 R2_OE : OUT STD_LOGIC;
		 LEDREG_LD : OUT STD_LOGIC;
		 DELAY : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT waitncycles
GENERIC (N : INTEGER
			);
	PORT(areset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 START : IN STD_LOGIC;
		 READY : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT constant_source
GENERIC (N : INTEGER
			);
	PORT(X : IN STD_LOGIC;
		 Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT spi_pll
	PORT(inclk0 : IN STD_LOGIC;
		 c0 : OUT STD_LOGIC;
		 c1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT regn
GENERIC (W : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 OE : IN STD_LOGIC;
		 datain : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	areset :  STD_LOGIC;
SIGNAL	CLOCK_1MHZ :  STD_LOGIC;
SIGNAL	CLOCK_200MHz :  STD_LOGIC;
SIGNAL	CLOCK_50 :  STD_LOGIC;
SIGNAL	dbus :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	led_data :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	LED_REG_LD :  STD_LOGIC;
SIGNAL	R1_LD :  STD_LOGIC;
SIGNAL	R1_OE :  STD_LOGIC;
SIGNAL	R2_LD :  STD_LOGIC;
SIGNAL	R2_OE :  STD_LOGIC;
SIGNAL	READY :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_2 <= '1';
SYNTHESIZED_WIRE_3 <= '0';
SYNTHESIZED_WIRE_4 <= '1';



b2v_CONTROLLER : controller
PORT MAP(CLK => CLOCK_1MHZ,
		 READY => READY,
		 reset => areset,
		 R1_LD => R1_LD,
		 R1_OE => R1_OE,
		 R2_LD => R2_LD,
		 R2_OE => R2_OE,
		 LEDREG_LD => LED_REG_LD,
		 DELAY => SYNTHESIZED_WIRE_0);


b2v_COUNT1 : waitncycles
GENERIC MAP(N => 8
			)
PORT MAP(areset => areset,
		 clk => CLOCK_1MHZ,
		 START => SYNTHESIZED_WIRE_0,
		 READY => SYNTHESIZED_WIRE_1);


b2v_COUNT2 : waitncycles
GENERIC MAP(N => 8
			)
PORT MAP(areset => areset,
		 clk => CLOCK_1MHZ,
		 START => SYNTHESIZED_WIRE_1,
		 READY => READY);


b2v_inst : constant_source
GENERIC MAP(N => 8
			)
PORT MAP(X => SYNTHESIZED_WIRE_2,
		 Y => SYNTHESIZED_WIRE_5);


b2v_inst14 : spi_pll
PORT MAP(inclk0 => CLOCK_50,
		 c1 => CLOCK_1MHZ);


b2v_inst2 : constant_source
GENERIC MAP(N => 8
			)
PORT MAP(X => SYNTHESIZED_WIRE_3,
		 Y => SYNTHESIZED_WIRE_6);





b2v_LED_REG : regn
GENERIC MAP(W => 8
			)
PORT MAP(clk => CLOCK_1MHZ,
		 load => LED_REG_LD,
		 reset => areset,
		 OE => SYNTHESIZED_WIRE_4,
		 datain => dbus,
		 dataout => led_data);


b2v_R1 : regn
GENERIC MAP(W => 8
			)
PORT MAP(clk => CLOCK_1MHZ,
		 load => R1_LD,
		 reset => areset,
		 OE => R1_OE,
		 datain => SYNTHESIZED_WIRE_5,
		 dataout => dbus);


b2v_R2 : regn
GENERIC MAP(W => 8
			)
PORT MAP(clk => CLOCK_1MHZ,
		 load => R2_LD,
		 reset => areset,
		 OE => R2_OE,
		 datain => SYNTHESIZED_WIRE_6,
		 dataout => dbus);

LED_7 <= led_data(7);
CLOCK_50 <= CLOCK_50MHZ;
LED_6 <= led_data(6);
LED_5 <= led_data(5);
LED_4 <= led_data(4);
LED_3 <= led_data(3);
LED_2 <= led_data(2);
LED_1 <= led_data(1);
LED_0 <= led_data(0);

END bdf_type;