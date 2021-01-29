# FPGA Slave Lab


Below is a timing diagram for the SPI Client spi_bmh.vhd

![Timing Diagram](/img/spi_bhm_timing.png)

A. Before the first transaction, it is possible to (asynchronously) pre-load a return value into the output shift register. This allows a value to be returned on the very first transaction after CS is pulled LOW.

B. In anticipation of the next frame, the FPGA should present data_tx on the falling edge of the busytx signal. This allows the maximum time until it is loaded into the internal shift register

C. On the last falling edge of sclk (for the current frame), the data presented on data_tx is synchronously loaded into the output shift register. The busy_tx signal is raised HIGH half a clock cycle before and after this occurs. it is critical that data_tx is held stable while busy_tx is HIGH (to avoid metastability)

D. One the last rising edge of sclk (for the current frame), the output register data_rx is synchronously loaded, presenting the received value from the Master (MCU). The busy_rx signal is raised HIGH half a clock cycle before and after this occurs. It is critical that data_rx is not read which busy_tx is HIGH (to avoid metastability). A suggestion is to read data_rx on the falling edge of busy_rx
