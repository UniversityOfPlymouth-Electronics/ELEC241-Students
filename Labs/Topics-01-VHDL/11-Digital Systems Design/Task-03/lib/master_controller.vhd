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

		-- LEDs
		LEDREG_LD			  : out std_logic;	-- LOAD for the LED register		

		-- SWITCHESs
		SWREG_LD			  	  : out std_logic;	-- LOAD for the Switch register		

		-- operand register
		OPERAND_REG_LD : out std_logic; 			-- Holds the data payload sent by the MCU (via SPI)

		
		-- address decoder
		ADDR	     	  	: out std_logic_vector(2 downto 0);	-- Address of the device driving the bus: 00 is all HiZ; 01: SPI_MASTER_RXREG_OE; 02: SPI_SLAVE_RXREG_OE; 03: SWREG_OE; 04: OPERAND_REG_OE
		
		-- databus input
		databus			: in std_logic_vector(15 downto 0) -- All internal data is moved via this bus
		

	);

end entity;

architecture rtl of master_controller is


begin

	-- Logic to advance to the next state
	process (clk, areset)
		variable count : integer := 0;	
	begin
	
	
		if (areset = '0') then
			ADDR <= "000";
			count := 0;
			LEDREG_LD <= '0';
			SWREG_LD <= '0';
			OPERAND_REG_LD <= '0';
			
		elsif (rising_edge(clk)) then
		
			ADDR <= "000";
			LEDREG_LD <= '0';
			SWREG_LD <= '0';
			OPERAND_REG_LD <= '0';
		
			if (count = 0) then
				SWREG_LD <= '1';
				count := count + 1;
		
			elsif (count = 1) then
				ADDR <= address_of(switches);
				LEDREG_LD <= '1';
				count := count + 1;
			
			elsif (count = 2) then
				count := 0;
			end if;
		end if;
		
	end process;
	
	

end rtl;
