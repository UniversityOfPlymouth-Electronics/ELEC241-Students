add wave -position insertpoint  \
sim:/bit_counter/DATA_WIDTH \
sim:/bit_counter/A \
sim:/bit_counter/Y \
sim:/bit_counter/res

force A "1010101010101010"
run 100 ns
force A "1111111111111111"
run 100 ns;
force A "0000000000000000"
run 100 ns;


