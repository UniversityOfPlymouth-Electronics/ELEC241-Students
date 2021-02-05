vsim work.my_counter

add wave -position insertpoint sim:/my_counter/CLK \
-radix unsigned \
sim:/my_counter/Y1 \
sim:/my_counter/Y2

force -freeze sim:/my_counter/CLK 1 0, 0 {50 ps} -r 100

run 1100 ps
