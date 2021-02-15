vsim work.uop_dflipfop_vhd_tst

add wave -position insertpoint  \
sim:/uop_dflipfop_vhd_tst/CLK \
sim:/uop_dflipfop_vhd_tst/D \
sim:/uop_dflipfop_vhd_tst/Q

run -all
