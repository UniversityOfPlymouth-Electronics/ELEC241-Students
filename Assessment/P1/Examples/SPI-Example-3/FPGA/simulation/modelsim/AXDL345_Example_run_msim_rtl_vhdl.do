transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/git/ELEC241-Staff/assignments/2020-21/P1/SPI-Example-2/FPGA/strobe_sync.vhd}

