library ieee;
use ieee.std_logic_1164.all;

library work;
use work.elec241.all;

-- ****************************************
-- THIS IS THE CENTRAL FOCUS FOR THIS LAB *
-- ****************************************

entity master_controller is

	port(
		areset        		: in std_logic; -- Asynchronous reset
		clk		     		: in std_logic; -- 50Mhz FPGA Clock

		-- SPI Slave (driven by the MCU)
		SPI_SLAVE_BUSYTX	: in std_logic; -- When high, do not write to SPIS_TX register - use the falling edge of this a trigger
		SPI_SLAVE_BUSYRX 	: in std_logic; -- when high, do not read from SPIS_RX register
		SPI_SLAVE_RXREG_LD  : out std_logic;	-- LOAD for the SPI master transmit register
		SPI_SLAVE_TXREG_LD  : out std_logic;	-- LOAD for the SPI master transmit register
		
		-- LEDs
		LED_REG_LD			  : out std_logic;	-- LOAD for the LED register		

		-- SWITCHESs
		SW_REG_LD			  : out std_logic;	-- LOAD for the Switch register		
		
		-- Instruction Register
		INSTR_REG_LD		: out	std_logic;							-- Load for the INSTR register
		INSTR					: in std_logic_vector(3 downto 0);	-- Current instruction
		
		-- operand register
		OPER_REG_LD 		: out std_logic; 		-- Holds the 12-bit data payload sent by the MCU (via SPI) 

		-- Select lines for the MUX
		SEL					: out std_logic_vector(2 downto 0)
		
	);

end entity;

architecture rtl of master_controller is

	procedure reset_all is
	begin
		SPI_SLAVE_RXREG_LD <= '0';
		SPI_SLAVE_TXREG_LD <= '0';
		LED_REG_LD          <= '0';
		SW_REG_LD			  <= '0';
		INSTR_REG_LD		  <= '0';
		OPER_REG_LD			  <= '0';
		SEL <= select_source(spi_slave_rx);
	end procedure;

	-- Build an enumerated type for the state machine
	type state_type is (RESET, WAIT_FOR_BUSYRX_HIGH, WAIT_FOR_BUSYTX_HIGH, WAIT_FOR_BUSYRX_LOW, WAIT_FOR_BUSYTX_LOW, S00, S01, S02, S03, READBACK_01, LEDS_AND_SWITCHES_01, LEDS_AND_SWITCHES_02, LEDS_AND_SWITCHES_03, ILLEGAL);

	-- Register to hold the current state
	signal state   : state_type := reset;
	
begin
	process(CLK, ARESET)
		variable next_instruction : instruction;
	begin
	
		if (areset = '0') then
			reset_all;
			SEL <= select_source(spi_slave_rx);
			state <= reset;
			
		elsif rising_edge(CLK) then
		
			-- Set output signals to defaults
			reset_all;
			
			case state is
				when RESET =>
					if (SPI_SLAVE_BUSYRX = '0') and (SPI_SLAVE_BUSYTX = '0') then
						state <= WAIT_FOR_BUSYRX_HIGH;
					end if;
						
				when WAIT_FOR_BUSYRX_HIGH =>
					-- Wait for BUSY_TX to go high
					if (SPI_SLAVE_BUSYRX = '1') then
						state <= WAIT_FOR_BUSYTX_HIGH;
					end if;
					
				when WAIT_FOR_BUSYTX_HIGH =>
					-- Wait for BUSY_TX to go low (the event to start decoding)
					if (SPI_SLAVE_BUSYTX = '1') then
						state <= WAIT_FOR_BUSYRX_LOW;
					end if;
				
				when WAIT_FOR_BUSYRX_LOW =>
					if (SPI_SLAVE_BUSYRX = '0') then
						state <= WAIT_FOR_BUSYTX_LOW;
					end if;
				
				when WAIT_FOR_BUSYTX_LOW =>
					if (SPI_SLAVE_BUSYTX = '0') then
						state <= S00;
					end if;
					
				when S00 =>
					-- Load SPI RX data (already stable) into the receive register
					SPI_SLAVE_RXREG_LD <= '1';				-- SPIS_REG <= SPI_RX
					state <= S01;
				
				when S01 =>
					-- Load the recieve data into the INSTRUCTION and OPERAND Registers
					SEL <= select_source(spi_slave_rx);	-- The SPIS_RXREG is driving the'bus'
					INSTR_REG_LD <= '1';						-- INSTR_REG <= SPIS_RX[15..12]					
					OPER_REG_LD  <= '1';						-- OPER_REG  <= SPIS_RX[11..0 ]
					state <= S02;
					
				when S02=>	
					-- Waite state for the INSTR register to feed the next state
					-- INSTR_REG and OPER_REG need a few ns to settle before they can be read
					state <= S03;
					
				when S03 =>
					-- Now examine the instruction (wired directly to the INSTR input) and decode
					next_instruction := instruction_for(INSTR);	-- See the package ELEC241.vhd
					case next_instruction is
						when readback =>
							state <= READBACK_01;
						when leds_and_switches =>
							state <= LEDS_AND_SWITCHES_01;
						when illegal =>
							state <= ILLEGAL;
					end case;
					
				when READBACK_01 =>
					-- Echo operand data back to the SPI (on the next transaction)
					SEL <= select_source(operand);	-- The OPER_REG is driving the'bus'
					SPI_SLAVE_TXREG_LD <= '1';			-- SPI_SLAVE_TXREG <= OPER_REG
					state <= RESET;				-- 	

					
				when LEDS_AND_SWITCHES_01 =>
					-- Write operand to the LEDs and echo the switches back to the SPI
					SEL <= select_source(operand);	-- The OPER_REG is driving the'bus'
					LED_REG_LD <= '1';					-- LED_RED <= OPER_REG
					SW_REG_LD  <= '1';					-- SW_RED <= switch hardware state
					state <= LEDS_AND_SWITCHES_02;
				
				when LEDS_AND_SWITCHES_02=>
					state <= LEDS_AND_SWITCHES_03;
					
				when LEDS_AND_SWITCHES_03 =>
					SEL <= select_source(switches);	-- The SW_REG is driving the'bus'
					SPI_SLAVE_TXREG_LD <= '1';			-- SPIS_TXREG <= SW_REG
					state <= RESET;
				
					
				when ILLEGAL =>
					state <= RESET;
			end case;
			
		end if;
		
	end process;

end rtl;
