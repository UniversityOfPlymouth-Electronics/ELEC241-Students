-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.1 Build 646 04/11/2019 SJ Lite Edition"

-- DATE "02/08/2021 10:54:41"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	behavioural IS
    PORT (
	Y : OUT std_logic_vector(3 DOWNTO 0);
	GO : IN std_logic;
	DATA : IN std_logic_vector(15 DOWNTO 0)
	);
END behavioural;

-- Design Ports Information
-- Y[3]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[2]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[1]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[0]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[0]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[8]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[15]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[14]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[13]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[12]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[9]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[11]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[10]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GO	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[4]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[5]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[7]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[6]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[3]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[2]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA[1]	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF behavioural IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Y : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_GO : std_logic;
SIGNAL ww_DATA : std_logic_vector(15 DOWNTO 0);
SIGNAL \DATA[0]~input_o\ : std_logic;
SIGNAL \Y[3]~output_o\ : std_logic;
SIGNAL \Y[2]~output_o\ : std_logic;
SIGNAL \Y[1]~output_o\ : std_logic;
SIGNAL \Y[0]~output_o\ : std_logic;
SIGNAL \DATA[11]~input_o\ : std_logic;
SIGNAL \DATA[15]~input_o\ : std_logic;
SIGNAL \DATA[12]~input_o\ : std_logic;
SIGNAL \DATA[14]~input_o\ : std_logic;
SIGNAL \DATA[13]~input_o\ : std_logic;
SIGNAL \inst|process_0~0_combout\ : std_logic;
SIGNAL \DATA[9]~input_o\ : std_logic;
SIGNAL \DATA[10]~input_o\ : std_logic;
SIGNAL \inst|process_0~1_combout\ : std_logic;
SIGNAL \DATA[8]~input_o\ : std_logic;
SIGNAL \inst|process_0~2_combout\ : std_logic;
SIGNAL \GO~input_o\ : std_logic;
SIGNAL \DATA[5]~input_o\ : std_logic;
SIGNAL \DATA[6]~input_o\ : std_logic;
SIGNAL \DATA[7]~input_o\ : std_logic;
SIGNAL \inst|process_0~5_combout\ : std_logic;
SIGNAL \inst|process_0~6_combout\ : std_logic;
SIGNAL \inst|process_0~3_combout\ : std_logic;
SIGNAL \inst|process_0~4_combout\ : std_logic;
SIGNAL \DATA[4]~input_o\ : std_logic;
SIGNAL \inst|process_0~7_combout\ : std_logic;
SIGNAL \DATA[3]~input_o\ : std_logic;
SIGNAL \DATA[2]~input_o\ : std_logic;
SIGNAL \inst|process_0~8_combout\ : std_logic;
SIGNAL \inst|process_0~9_combout\ : std_logic;
SIGNAL \inst|process_0~10_combout\ : std_logic;
SIGNAL \inst|process_0~11_combout\ : std_logic;
SIGNAL \DATA[1]~input_o\ : std_logic;
SIGNAL \inst|process_0~12_combout\ : std_logic;
SIGNAL \inst|process_0~13_combout\ : std_logic;
SIGNAL \inst|process_0~14_combout\ : std_logic;
SIGNAL \inst|process_0~15_combout\ : std_logic;
SIGNAL \inst|process_0~16_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

Y <= ww_Y;
ww_GO <= GO;
ww_DATA <= DATA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X49_Y0_N9
\Y[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|process_0~2_combout\,
	oe => \GO~input_o\,
	devoe => ww_devoe,
	o => \Y[3]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\Y[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|process_0~7_combout\,
	oe => \GO~input_o\,
	devoe => ww_devoe,
	o => \Y[2]~output_o\);

-- Location: IOOBUF_X47_Y0_N23
\Y[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|process_0~11_combout\,
	oe => \GO~input_o\,
	devoe => ww_devoe,
	o => \Y[1]~output_o\);

-- Location: IOOBUF_X43_Y0_N23
\Y[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|process_0~16_combout\,
	oe => \GO~input_o\,
	devoe => ww_devoe,
	o => \Y[0]~output_o\);

-- Location: IOIBUF_X53_Y10_N15
\DATA[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(11),
	o => \DATA[11]~input_o\);

-- Location: IOIBUF_X53_Y13_N8
\DATA[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(15),
	o => \DATA[15]~input_o\);

-- Location: IOIBUF_X53_Y9_N22
\DATA[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(12),
	o => \DATA[12]~input_o\);

-- Location: IOIBUF_X53_Y6_N15
\DATA[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(14),
	o => \DATA[14]~input_o\);

-- Location: IOIBUF_X53_Y14_N1
\DATA[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(13),
	o => \DATA[13]~input_o\);

-- Location: LCCOMB_X51_Y9_N8
\inst|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~0_combout\ = (\DATA[15]~input_o\ & (\DATA[12]~input_o\ & (\DATA[14]~input_o\ & \DATA[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[15]~input_o\,
	datab => \DATA[12]~input_o\,
	datac => \DATA[14]~input_o\,
	datad => \DATA[13]~input_o\,
	combout => \inst|process_0~0_combout\);

-- Location: IOIBUF_X53_Y11_N8
\DATA[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(9),
	o => \DATA[9]~input_o\);

-- Location: IOIBUF_X53_Y6_N22
\DATA[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(10),
	o => \DATA[10]~input_o\);

-- Location: LCCOMB_X51_Y9_N18
\inst|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~1_combout\ = (\DATA[11]~input_o\ & (\inst|process_0~0_combout\ & (\DATA[9]~input_o\ & \DATA[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[11]~input_o\,
	datab => \inst|process_0~0_combout\,
	datac => \DATA[9]~input_o\,
	datad => \DATA[10]~input_o\,
	combout => \inst|process_0~1_combout\);

-- Location: IOIBUF_X53_Y9_N8
\DATA[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(8),
	o => \DATA[8]~input_o\);

-- Location: LCCOMB_X50_Y9_N0
\inst|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~2_combout\ = (\inst|process_0~1_combout\ & \DATA[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|process_0~1_combout\,
	datac => \DATA[8]~input_o\,
	combout => \inst|process_0~2_combout\);

-- Location: IOIBUF_X43_Y0_N15
\GO~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GO,
	o => \GO~input_o\);

-- Location: IOIBUF_X53_Y9_N15
\DATA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(5),
	o => \DATA[5]~input_o\);

-- Location: IOIBUF_X53_Y8_N22
\DATA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(6),
	o => \DATA[6]~input_o\);

-- Location: IOIBUF_X53_Y12_N1
\DATA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(7),
	o => \DATA[7]~input_o\);

-- Location: LCCOMB_X51_Y9_N24
\inst|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~5_combout\ = (\DATA[6]~input_o\ & \DATA[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DATA[6]~input_o\,
	datac => \DATA[7]~input_o\,
	combout => \inst|process_0~5_combout\);

-- Location: LCCOMB_X51_Y9_N26
\inst|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~6_combout\ = (((!\inst|process_0~5_combout\) # (!\DATA[8]~input_o\)) # (!\inst|process_0~1_combout\)) # (!\DATA[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[5]~input_o\,
	datab => \inst|process_0~1_combout\,
	datac => \DATA[8]~input_o\,
	datad => \inst|process_0~5_combout\,
	combout => \inst|process_0~6_combout\);

-- Location: LCCOMB_X51_Y9_N28
\inst|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~3_combout\ = (\DATA[11]~input_o\ & \DATA[10]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[11]~input_o\,
	datac => \DATA[10]~input_o\,
	combout => \inst|process_0~3_combout\);

-- Location: LCCOMB_X51_Y9_N22
\inst|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~4_combout\ = (\inst|process_0~0_combout\ & (((!\inst|process_0~3_combout\) # (!\DATA[8]~input_o\)) # (!\DATA[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[9]~input_o\,
	datab => \inst|process_0~0_combout\,
	datac => \DATA[8]~input_o\,
	datad => \inst|process_0~3_combout\,
	combout => \inst|process_0~4_combout\);

-- Location: IOIBUF_X53_Y11_N1
\DATA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(4),
	o => \DATA[4]~input_o\);

-- Location: LCCOMB_X51_Y9_N20
\inst|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~7_combout\ = (\inst|process_0~6_combout\ & (\inst|process_0~4_combout\)) # (!\inst|process_0~6_combout\ & ((\DATA[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~6_combout\,
	datac => \inst|process_0~4_combout\,
	datad => \DATA[4]~input_o\,
	combout => \inst|process_0~7_combout\);

-- Location: IOIBUF_X53_Y7_N8
\DATA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(3),
	o => \DATA[3]~input_o\);

-- Location: IOIBUF_X53_Y17_N22
\DATA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(2),
	o => \DATA[2]~input_o\);

-- Location: LCCOMB_X51_Y9_N14
\inst|process_0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~8_combout\ = (((\DATA[3]~input_o\ & \DATA[2]~input_o\)) # (!\DATA[4]~input_o\)) # (!\DATA[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[3]~input_o\,
	datab => \DATA[5]~input_o\,
	datac => \DATA[2]~input_o\,
	datad => \DATA[4]~input_o\,
	combout => \inst|process_0~8_combout\);

-- Location: LCCOMB_X51_Y9_N0
\inst|process_0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~9_combout\ = (((\inst|process_0~8_combout\ & \inst|process_0~5_combout\)) # (!\DATA[8]~input_o\)) # (!\DATA[9]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[9]~input_o\,
	datab => \inst|process_0~8_combout\,
	datac => \DATA[8]~input_o\,
	datad => \inst|process_0~5_combout\,
	combout => \inst|process_0~9_combout\);

-- Location: LCCOMB_X51_Y9_N10
\inst|process_0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~10_combout\ = (((\inst|process_0~3_combout\ & \inst|process_0~9_combout\)) # (!\DATA[13]~input_o\)) # (!\DATA[12]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~3_combout\,
	datab => \inst|process_0~9_combout\,
	datac => \DATA[12]~input_o\,
	datad => \DATA[13]~input_o\,
	combout => \inst|process_0~10_combout\);

-- Location: LCCOMB_X51_Y9_N12
\inst|process_0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~11_combout\ = (\inst|process_0~10_combout\ & (\DATA[14]~input_o\ & \DATA[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~10_combout\,
	datac => \DATA[14]~input_o\,
	datad => \DATA[15]~input_o\,
	combout => \inst|process_0~11_combout\);

-- Location: IOIBUF_X53_Y17_N15
\DATA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(1),
	o => \DATA[1]~input_o\);

-- Location: LCCOMB_X51_Y9_N6
\inst|process_0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~12_combout\ = ((\DATA[3]~input_o\ & ((\DATA[1]~input_o\) # (!\DATA[2]~input_o\)))) # (!\DATA[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[3]~input_o\,
	datab => \DATA[4]~input_o\,
	datac => \DATA[2]~input_o\,
	datad => \DATA[1]~input_o\,
	combout => \inst|process_0~12_combout\);

-- Location: LCCOMB_X51_Y9_N16
\inst|process_0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~13_combout\ = (\DATA[7]~input_o\ & (((\inst|process_0~12_combout\ & \DATA[5]~input_o\)) # (!\DATA[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~12_combout\,
	datab => \DATA[6]~input_o\,
	datac => \DATA[7]~input_o\,
	datad => \DATA[5]~input_o\,
	combout => \inst|process_0~13_combout\);

-- Location: LCCOMB_X51_Y9_N2
\inst|process_0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~14_combout\ = ((\DATA[9]~input_o\ & ((\inst|process_0~13_combout\) # (!\DATA[8]~input_o\)))) # (!\DATA[10]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[9]~input_o\,
	datab => \inst|process_0~13_combout\,
	datac => \DATA[8]~input_o\,
	datad => \DATA[10]~input_o\,
	combout => \inst|process_0~14_combout\);

-- Location: LCCOMB_X51_Y9_N4
\inst|process_0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~15_combout\ = (\DATA[13]~input_o\ & (((\DATA[11]~input_o\ & \inst|process_0~14_combout\)) # (!\DATA[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[11]~input_o\,
	datab => \inst|process_0~14_combout\,
	datac => \DATA[12]~input_o\,
	datad => \DATA[13]~input_o\,
	combout => \inst|process_0~15_combout\);

-- Location: LCCOMB_X51_Y9_N30
\inst|process_0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|process_0~16_combout\ = (\DATA[15]~input_o\ & ((\inst|process_0~15_combout\) # (!\DATA[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA[14]~input_o\,
	datac => \inst|process_0~15_combout\,
	datad => \DATA[15]~input_o\,
	combout => \inst|process_0~16_combout\);

-- Location: IOIBUF_X53_Y22_N1
\DATA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA(0),
	o => \DATA[0]~input_o\);

ww_Y(3) <= \Y[3]~output_o\;

ww_Y(2) <= \Y[2]~output_o\;

ww_Y(1) <= \Y[1]~output_o\;

ww_Y(0) <= \Y[0]~output_o\;
END structure;


