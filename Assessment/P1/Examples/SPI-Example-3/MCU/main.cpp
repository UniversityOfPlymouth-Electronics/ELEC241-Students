#include "uop_msb_2_0_0.h"
#include "mbed.h"
#include "ADXL345.h"
#include <cstdint>

// Rate in milliseconds
#define DELAY_RATE     1000ms

//Function prototypes
void print_every(uint16_t N, double p);
void conditional_beep(double p);
void barDisplay(SPI& spi, float p);

//objects
Timer tmr;

//Digital Inputs
DigitalIn Protect_this_pin_from_5V(PB_12);// !!!!!!!! NB Inputs are 5VDC tolerant from DE0 NANO FPGA Supply !!!!!!!!!

// **************************************************************************
// *                      SPARE DigitalIO - CAREFUL!!!!                     *
// **************************************************************************
// *   Leave these as inputs. Check with the module staff before changing   *
// **************************************************************************
DigitalOut CS_LEDSW(PB_15,'1'); //Important that is is initialised HIGH so the device is not selected on power-on
DigitalIn Spare2(PB_13);
DigitalIn Spare3(PA_15);
DigitalIn Spare4(PC_7);
DigitalIn Spare5(PB_8);
DigitalIn Spare6(PB_9);

// **************************************************************************
//   spi_(mosi, miso, sck), nCS_(cs) 
ADXL345 accelerometer(PA_7, PA_6, PA_5, PC_6);

//Buzzer
uop_msb_200::Buzzer buzz;

 int main() {
 
    int readings[3] = {0, 0, 0};
    SPI& spi = accelerometer.spi();

    printf("Starting ADXL345 test...\n");

    accelerometer.setDataFormatControl(ADXL345_3_WIRE);             //Set to 3 wire mode   

    printf("Device ID is: 0x%02x\n", accelerometer.getDevId());     //Read device ID (address 0)

     //Go into standby mode to configure the device.
    accelerometer.setPowerControl(0x00);                            //Stop constant reading

    //resolution, +/-2g NB MUST 'OR' with ADXL_3_WIRE as this is same reg else will revert to 4 wire! MRS
    accelerometer.setDataFormatControl(ADXL345_3_WIRE|ADXL345_2g);  //10 bit resolution (2g range)
    
    //400 Hz data rate
    accelerometer.setDataRate(ADXL345_400HZ);   //Sampling rate (400 3xbytes / second) 
 
    //Measurement mode.
    accelerometer.setPowerControl(0x08);                            // Start sampling
 
    double x_mean=0.0, y_mean=0.0, z_mean=0.0;
    double mu = 0.99;
    printf("Callibrating.....\n");
    wait_us(1000000);
    bool settled = false;

    while (1) {

        //Read sensor data
        accelerometer.getOutput(readings);
        float x = 4.0f*(float)(int16_t)readings[0]/1023.0f;
        float y = 4.0f*(float)(int16_t)readings[1]/1023.0f;
        float z = 4.0f*(float)(int16_t)readings[2]/1023.0f;
        //printf("x,y,z=%6.4f,%6.4f,%6.4f\n",x,y,z);

        //Estimate running mean (nice little trick this one!)
        x_mean = mu*x_mean + (1.0-mu)*x;
        y_mean = mu*y_mean + (1.0-mu)*y;
        z_mean = mu*z_mean + (1.0-mu)*z;

        //Subtract mean
        x -= x_mean;
        y -= y_mean;
        z -= z_mean;

        //Estimate instantatious power
        float power = x*x + y*y + z*z;

        //Display on LEDs
        barDisplay(spi, power);

        //Wait for mean to settle
        if (settled == false) {
            if (power < 0.005) {
                settled = true;
                printf("Move the DE-0 Nano.\n");
            }
            continue;   //I leave the students to find out what this does :)
        }

        //Display the power (once every 10)
        //print_every(10, power);

        //Decide if the board has been moved
        conditional_beep(power);

        //Approx. sampling interval (not accurate!)
        wait_us(10000);
 
    }
 }

// Display magnitude on LED display
// This uses the second SPI device connected to the same SPI master
// Use a different chip select
void barDisplay(SPI& spi, float p)
{
    static float peak = 0.0f;
    if (p > peak) {
        peak = p;
    } else {
        peak = (peak > 0.01f) ? (peak - 0.01f) : 0.0f;
    }
    float level = 8.0f*peak;
    uint16_t uLevel = floor(level); // 0..7

    //Write to the SPI interface - NOTE the chip select is different to the motion sensor
    CS_LEDSW = 0; wait_us(1);
    spi.write((1<<uLevel)-1); wait_us(1);
    CS_LEDSW = 1; wait_us(1);    
}

// Print value p on every N calls
 void print_every(uint16_t N, double p)
 {
     //Note this is STATIC - so retains it's value with each call
     static uint32_t _count = 0;
     if (_count++ == 0) {
         printf("%4.6f\n", p);
     }
     //Wrap back to zero when equal to N
     _count %= N;
 }

// Finite state machine to switch on buzzer when the accelerometer detects a movement
// Has built in hysteresis and debounce
// Uses rapid polling of a timer (Non blocking)
void conditional_beep(double p)
{
    //Note this is STATIC - so retains it's value and is only initialised on the first instance
    static enum {OFF, TMR1, ON, TMR2} state = OFF;

    switch (state) {
        case OFF:
            //Has there been movement?
            if (p > 0.05) {     //Upper threshold
                printf("Beep %4.4f\n", p);
                tmr.reset();
                tmr.start();
                buzz.playTone("F");
                state = TMR1;
            }
        break;

        case TMR1:
            //Allow tone to play for 250ms, then stop
            if (tmr.elapsed_time() > 250ms) {
                buzz.rest();
                tmr.stop();
                state = ON;
            }
        break;

        case ON:
            //Has the movement stopped?
            if (p < 0.005) {    //Lower threshold
                tmr.reset();
                tmr.start();
                state = TMR2;                
            }
        break;

        case TMR2:
            //Wait for 100ms before checking again for movement
            if (tmr.elapsed_time() > 100ms) {
                tmr.stop();
                state = OFF;
            }
        break;
    }

}