#include "mbed.h"

//Define an instance of SPI - this is a SPI master device
SPI spi(PA_7, PA_6, PA_5);      // Ordered as: mosi, miso, sclk could use forth parameter ssel

//We often use a separate signal for the chip select. It is VITAL that for each SPI port, only ONE SPI slave device is enabled.
DigitalOut cs(PC_6);            // Chip Select for Basic Outputs to illuminate Onboard FPGA DEO nano LEDs CN7 pin 1

// **************************************************************************
// ******************** NB the following line for F429ZI ******************** 
// *    The following line is essential when using this ribbon connector    *
// **************************************************************************
DigitalIn DO_NOT_USE(PB_12);    // MAKE PB_12 (D19) an INPUT do NOT make an OUTPUT under any circumstances !!!!! ************* !!!!!!!!!!!
                                // This Pin is connected to the 5VDC from the FPGA card and an INPUT that is 5V Tolerant
// **********************************************************************************************************


// **************************************** Function prototypes *********************************************
uint16_t read_switches(void);    //Read 4 Sliding switches on FPGA (Simulating OPTO-Switches from Motor(s)
uint16_t spi_readwrite(uint16_t data);  
// **********************************************************************************************************


// **********************************************************************************************************
// Main function	
// **********************************************************************************************************

int main() {
    cs = 1;                     // Chip must be deselected, Chip Select is active LOW
    spi.format(16,0);           // Setup the DATA frame SPI for 16 bit wide word, Clock Polarity 0 and Clock Phase 0 (0)
    spi.frequency(1000000);     // 1MHz clock rate

		printf("TEST\n\r");
    while(true)                 //Loop forever Knight Rider Display on FPGA
    {
				//Read switch state and write to PuTTY
        read_switches();
				
        //LED Chaser display KIT lives on!
        for (uint32_t i=1;i<=128;i*=2) {
            spi_readwrite(i);
            wait_ms(20);
        }
        for (uint32_t i=128;i>=1;i/=2) {
            spi_readwrite(i);
            wait_ms(20);
        }
				
				//Wait for 1 second
				wait_ms(1000);
    }
}

// **********************************************************************************************************
// Function to read back the state of the switches
//
// uint16_t read_switches(void)
// Return data - the data returned from the FPGA to the MCU over the SPI interface (via MISO)
// **********************************************************************************************************

uint16_t read_switches(void){
    uint16_t sw_val = spi_readwrite(0);	//Turn off all LEDs + read switches (in one full-duplex transaction)

    if (sw_val&(1<<0)){ printf("Switch 0 :"); }
    if (sw_val&(1<<1)){ printf("Switch 1 :"); }
    if (sw_val&(1<<2)){ printf("Switch 2 :"); }
    if (sw_val&(1<<3)){ printf("Switch 3 :"); }
    if (sw_val>0)     { printf("\r\n");       }
    return sw_val;    
}


// **********************************************************************************************************
// uint16_t spi_readwrite(uint16_t data)
//
// Function for writing to the SPI with the correct timing
// data - this parameter is the data to be sent from the MCU to the FPGA over the SPI interface (via MOSI)
// return data - the data returned from the FPGA to the MCU over the SPI interface (via MISO)
// **********************************************************************************************************

uint16_t spi_readwrite(uint16_t data) {	
	cs = 0;             									//Select the device by seting chip select LOW
	uint16_t rx = (uint16_t)spi.write(data);				//Send the data - ignore the return data
	wait_us(1);													//wait for last clock cycle to clear
	cs = 1;             									//De-Select the device by seting chip select HIGH
	return rx;
}
