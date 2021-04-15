# Preparation for the P1 coursework

## Lab
Please ensure you have completed the [lab on SPI interfacing](/Labs/Topics-01-VHDL/08-CaseStudy-SPI)

This lab demonstrates controller-datapath approach to system design

* State machine as a controller
* Mux-tree, registers and I/O devices in the data-path

It also uses a state machines to make it possible to use just ONE SPI slave-component device.

## Examples
Before you begin the P1 coursework, you should study the following three examples. These are somewhat simpler than the lab task, but present alternatives approaches

[Example 1](Examples/SPI-Example-1) Simple **4-wire SPI** to control LEDs and read switches. This demonstrates the **full duplex** communication that is provided by the SPI standard

[Example 2](Examples/SPI-Example-2) An example of **3-wire SPI** to communicate with a ADXL345 accelerometer. Data is acquired from the on-board accelerometer and passed back to the Microcontroller to build a simple movement detector.

[Example 3](Examples/SPI-Example-3) An example of **multiple-SPI devices**, combining examples 1 and 2 into one system. Note how the data and clock lines are shared, but a separate chip select is used for each SPI slave-device. This is contrast with the controller-datapath example in the lab which only used one.

## Docs
This folder contains data sheets. Some of the more advanced tasks may require you read specific sections (see the spec).
