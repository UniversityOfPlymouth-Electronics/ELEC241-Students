vsim work.leading_ones
add wave -position insertpoint  \
sim:/leading_ones/X \
sim:/leading_ones/GO \
sim:/leading_ones/Y

radix signal Y showbase -unsigned
radix signal X showbase -binary

force GO 0
force X 1111000000000001
run 10 ps

force GO 1
run 10 ps

force X 1111111101000001
run 10 ps
