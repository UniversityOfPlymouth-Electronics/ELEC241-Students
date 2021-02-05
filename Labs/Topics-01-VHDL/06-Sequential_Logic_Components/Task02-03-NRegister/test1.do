vsim work.uop_dregister

add wave -position insertpoint D CLK RESET LOAD Q

force RESET 0
run 10 ps

force -freeze sim:/uop_dregister/CLK 1 0, 0 {50 ps} -r 100

run 200 ps

force D 1010101011111111
force LOAD 0
force RESET 1

run 250 ps

force LOAD 1
run 100 ps
force LOAD 0
run 100 ps
force D 0000000000000000
run 200 ps
