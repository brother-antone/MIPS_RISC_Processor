quit -sim

vsim -gui work.control_unit
# vsim -gui work.control_unit 
# Start time: 17:36:59 on Dec 07,2024
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.control_unit(behavioral)
add wave -position insertpoint  \
sim:/control_unit/ALUOp \
sim:/control_unit/ALUorMEM \
sim:/control_unit/CLK \
sim:/control_unit/current_state \
sim:/control_unit/DRSelect \
sim:/control_unit/FetchDorI \
sim:/control_unit/funct \
sim:/control_unit/instruction \
sim:/control_unit/MemCS \
sim:/control_unit/MemWrite \
sim:/control_unit/next_state \
sim:/control_unit/opcode \
sim:/control_unit/pc_write \
sim:/control_unit/REGorIMM \
sim:/control_unit/RegWrite \
sim:/control_unit/reset \
sim:/control_unit/rst
force -freeze sim:/control_unit/CLK 0 0
force -freeze sim:/control_unit/reset 1 0
force -freeze sim:/control_unit/reset 1 0
force -freeze sim:/control_unit/instruction 00000000001000100001100000100000 0
run
force -freeze sim:/control_unit/reset 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
force -freeze sim:/control_unit/instruction 00110100000000100000000000010010 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
force -freeze sim:/control_unit/instruction 10001011000010100000000001000100 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
force -freeze sim:/control_unit/instruction 11001011000010100000000001000100 0
run
force -freeze sim:/control_unit/instruction 10001100000010100000000001000100 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
force -freeze sim:/control_unit/instruction 10101100000001010000000001000010 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
run
force -freeze sim:/control_unit/CLK 1 0
run
force -freeze sim:/control_unit/CLK 0 0
