add wave -position insertpoint  \
sim:/dlatch_behavioural/D \
sim:/dlatch_behavioural/EN \
sim:/dlatch_behavioural/Q

force EN 0
force D 0
run 100 ns

force D 1
run 100 ns

force D 0
run 100 ns

force D 1
run 100 ns

force D 0
run 100 ns


force EN 1
run 50 ns


force D 0
run 100 ns

force D 1
run 100 ns

force D 0
run 100 ns


force D 1
run 100 ns




force EN 0
run 50 ns


force D 0
run 100 ns

force D 1
run 100 ns

force D 0
run 100 ns

force D 1
run 100 ns

force D 0
run 100 ns




