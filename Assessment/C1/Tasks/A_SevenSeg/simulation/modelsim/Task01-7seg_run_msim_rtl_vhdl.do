transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/A_SevenSeg/binary_counter.vhd}
vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/A_SevenSeg/seven_seg_decode.vhd}

vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/A_SevenSeg/simulation/modelsim/seven_seg_decode.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  seven_seg_decode

add wave *
view structure
view signals
run -all
