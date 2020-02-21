-- SPI Slave (behavioural model)
-- v1.0
-- Nicholas Outram (University of Plymouth)
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity object
entity spi_bhm is

	generic ( N : natural := 8	);

	port (
		sclk   : in std_logic;     --SPI Clock
		cs     : in std_logic;     --Chip select
		mosi   : in std_logic;	   --Master Out Slave In  (MOSI)
		miso   : out std_logic;	   --Master In  Slave Out (MISO)
	   reset  : in std_logic;     --Asynchronous Reset
		
		data_tx  : in  std_logic_vector(N-1 downto 0);	--Parallel N-bit data to return back to the master
		data_rx : out std_logic_vector(N-1 downto 0);   --Parallel N-bit data recevied from the master
		busyrx   : out std_logic;								--Do not read data_rx while high
		busytx   : out std_logic                        --Do not write data_tx while high
	);

end entity;

architecture v1 of spi_bhm is

	signal sregin:  std_logic_vector(N-1 downto 0) := (others => '0');	--Shift register for incoming data
	signal rx    :  std_logic_vector(N-1 downto 0) := (others => '0');	--Recieve Register
	signal sregout: std_logic_vector(N-1 downto 0) := (others => '0');	--Shft register for outgoing data
	signal busytx_sync : std_logic; --Synchronous busy signal
	signal sof         : std_logic; --Start of frame internal signal
begin
receive:
	--Clock incoming data in on the rising edge of SCLK and store in data_rx once all N bits are received
	process (sclk, reset, cs)
	variable state : integer range 0 to N := 0;	--The FSM state, keeping track of the bit position
	begin
		--Asynchronous reset
		if (reset = '0') then
			sregin  <= (others=>'0');
			rx      <= (others=>'0');
			state   := 0;
		--When not selected
		elsif (cs = '1') then
			sregin  <= (others=>'0');
			state   := 0;
			busyrx <= '0';
		--When selected, update internal state on a rising edge
		elsif (rising_edge(sclk)) then

			--Clock in mosi and update shift register
			sregin <= sregin(N-2 downto 0) & mosi;
			
			--For the last bit, update the receive register
			if (state = (N-1)) then
				rx <= sregin(N-2 downto 0) & mosi;
				state := 0;
			else
				state := state + 1;
			end if;
			--The busy bit is pull high 1/2 SCLK cycle either side of the rx register being updated
			--This is to avoid metastability when interfacing with the FPGA clock domain
		elsif (falling_edge(sclk)) then
			if state = (N-1) then
				busyrx <= '1';
			else
				busyrx <= '0';
			end if;	
		end if;	
	end process;
	
	data_rx <= rx;
	
transmit:
	process (sclk, reset, cs, data_tx)
	variable state : integer range 0 to N := 0;
	
	begin
		--Asynchronous reset
		if (reset = '0') then
			sregout <= (others => 'Z');	--reset internal shift register to all zeros
			state := 0;							--Reset state
			
		--When not selected, allow the shift register to be pre-loaded in preparation
		elsif (cs = '1') then

			--Parallel data in is asynchronously loaded into the shift register
			sregout <= data_tx(N-1 downto 0);       --Pre-load shift register  
			state := 0;				--Reset state
			busytx_sync <= '0';			--Allow FPGA to update data_tx

		elsif falling_edge(sclk) then			
			
			if (state = (N-1)) then
				--Last bit (lsb) reload the shift register with the new value from the FPGA
				sregout <= data_tx;
				state := 0;
			else
				-- Logically shift internal SR and hence update MISO
				sregout <= sregout(N-2 downto 0) & '0'; -- shift left
				state := state + 1;
			end if;
		elsif rising_edge(sclk) then
			--The busy bit will be high 1/2 SLKC cycle around the the shiftreg being loaded
			if (state = (N-1)) then
				busytx_sync <= '1';
			else
				busytx_sync <= '0';
			end if;
		end if;
	
	end process;
	
first:
	process(cs, reset, sclk)
	begin
		if (reset='0') or (cs = '1') then
			sof <= '0';
		elsif rising_edge(sclk) then
			sof <= '1';
		end if;
	end process;


	--FPGA is advised to update data_tx on falling edge of this signal to allow 
	--maximum time until the device is busy once more.
	busytx <= ((not CS) and (not sof)) or busytx_sync;

	--Output mappings - not that MISO is high impendance when this component is not selected
	miso <= sregout(N-1) when cs = '0' else
		     'Z';

end v1;
