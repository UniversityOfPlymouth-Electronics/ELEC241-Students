#include "mbed.h"
#include <cstdint>
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


// **************************************************************************
// *                      SPARE DigitalIO - CAREFUL!!!!                     *
// **************************************************************************
// *   Leave these as inputs. Check with the module staff before changing   *
// **************************************************************************
DigitalIn Spare1(PB_15);
DigitalIn Spare2(PB_13);
DigitalIn Spare3(PA_15);
DigitalIn Spare4(PC_7);
DigitalIn Spare5(PB_8);
DigitalIn Spare6(PB_9);
// **************************************************************************

// **************************************** Function prototypes *********************************************
uint16_t spi_readwrite(uint16_t data);  
// **********************************************************************************************************

// Use a struct and bit fields to access individual bits
union {

    struct {
        uint16_t KEY1 : 1;      //bit 0
        uint16_t      : 11;     //bits 1-11
        uint16_t SW1  : 1;      //bit 12
        uint16_t SW2  : 1;      //bit 13
        uint16_t SW3  : 1;      //bit 14
        uint16_t SW4  : 1;      //bit 15
    } bit;

    uint16_t u16;

} inputData;

// **********************************************************************************************************
// Main function    
// **********************************************************************************************************

int main() {
    cs = 1;                     // Chip must be deselected, Chip Select is active LOW
    spi.format(16,0);           // Setup the DATA frame SPI for 16 bit wide word, Clock Polarity 0 and Clock Phase 0 (0)
    spi.frequency(1000000);     // 1MHz clock rate
    wait_us(10000);

    //Flash all LEDs On and Off
    for (unsigned int n=0; n<5; n++) {
        spi_readwrite(0x00FF);
        wait_us(100000);
        spi_readwrite(0x0000);  //ALL OFF
        wait_us(100000);
    }

    printf("ELEC241-P1 2021 Example 1\n\r");

    while(true)                 //Loop forever Knight Rider Display on FPGA
    {
        //LED Chaser display KIT lives on!
        for (uint16_t i=1;i<=128;i*=2) {
            inputData.u16 = spi_readwrite(i);
            if (inputData.bit.KEY1 == 1) {
                wait_us(40000);
            } else {
                wait_us(10000);
            }
        }
        for (uint16_t i=128;i>=1;i/=2) {
            inputData.u16 = spi_readwrite(i);
            if (inputData.bit.KEY1 == 1) {
                wait_us(40000);
            } else {
                wait_us(10000);
            }
        }

        printf("\n\n------------\n");
        printf("Switch 1 = %u\n", inputData.bit.SW1);
        printf("Switch 2 = %u\n", inputData.bit.SW2);
        printf("Switch 3 = %u\n", inputData.bit.SW3);
        printf("Switch 4 = %u\n", inputData.bit.SW4);
        printf("KEY 1 = %u\n",    inputData.bit.KEY1);

        //Wait for 0.5 second
        wait_us(500000);
    }
}


// **********************************************************************************************************
// uint16_t spi_readwrite(uint16_t data)
//
// Function for writing to the SPI with the correct timing
// data - this parameter is the data to be sent from the MCU to the FPGA over the SPI interface (via MOSI)
// return data - the data returned from the FPGA to the MCU over the SPI interface (via MISO)
// **********************************************************************************************************

uint16_t spi_readwrite(uint16_t data) { 
    cs = 0;                                                 //Select the device by seting chip select LOW
    uint16_t rx = (uint16_t)spi.write(data);                //Send the data - ignore the return data
    wait_us(1);                                                 //wait for last clock cycle to clear
    cs = 1;                                                 //De-Select the device by seting chip select HIGH
    wait_us(1);
    return rx;
}
