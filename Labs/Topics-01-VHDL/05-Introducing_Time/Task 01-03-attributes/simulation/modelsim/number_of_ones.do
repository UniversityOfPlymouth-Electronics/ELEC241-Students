vsim work.number_of_ones
add wave X GO Y

radix signal Y showbase -unsigned
radix signal X showbase -binary

force GO 0
force X 1111000000000001
run 10 ps

force GO 1
run 10 ps

force X 1111111101000001
run 10 ps
