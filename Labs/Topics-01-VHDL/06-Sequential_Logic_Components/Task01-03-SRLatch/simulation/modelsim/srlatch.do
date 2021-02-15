vsim work.uop_srlatch

add wave -position insertpoint  \
sim:/uop_srlatch/S \
sim:/uop_srlatch/R \
sim:/uop_srlatch/Q

run 100 ps

force S 1
force R 0
run 50 ps
force S 0
run 150 ps

force R 1
run 50 ps
force R 0
run 150 ps

force S 1
force R 1
run 50 ps
force S 0
force R 0
