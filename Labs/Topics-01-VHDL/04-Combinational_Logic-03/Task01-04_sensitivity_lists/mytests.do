add wave -position insertpoint  \
sim:/clevergate_behavioural/A \
sim:/clevergate_behavioural/B \
sim:/clevergate_behavioural/mode \
sim:/clevergate_behavioural/Y

force A 0
force B 0
force mode 0
run 100 ns

force A 1
run 100 ns

force mode 1
run 100 ns

