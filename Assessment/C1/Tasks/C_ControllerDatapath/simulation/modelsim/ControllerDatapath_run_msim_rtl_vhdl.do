transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/C_ControllerDatapath/big_mux_4.vhd}
vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/C_ControllerDatapath/simplereg.vhd}
vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/C_ControllerDatapath/unsigned_adder_b.vhd}
vcom -93 -work work {C:/git/ELEC241-Students/Assessment/C1/Tasks/C_ControllerDatapath/constant_literal.vhd}

do "C:/git/ELEC241-Students/Assessment/C1/Tasks/C_ControllerDatapath/simulation/modelsim/build.do"
