vsim work.uop_dlatch

add wave -position insertpoint  \
sim:/uop_dlatch/D \
sim:/uop_dlatch/EN \
sim:/uop_dlatch/Q

force EN 0
force D 0
run 100 ps

force D 1
run 100 ps

force D 0 
run 100 ps

force EN 1
run 100 ps

force EN 0
run 100 ps

force D 1
run 100 ps

force D 0
run 200 ps

force D 1
run 100 ps

force EN 1
run 50 ps
force EN 0
run 50 ps

force D 0
run 100 ps

force D 1
run 100 ps

force D 0
run 100 ps

force EN 1
run 50 ps

force EN 0
run 150 ps

force D 1
run 100 ps

force D 0
run 100 ps


