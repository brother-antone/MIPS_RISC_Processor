quit -sim

# Create a test wave file
vsim work.MUX_ALUorMEM

# Add signals to the waveform
add wave -position insertpoint \
    sim:/MUX_ALUorMEM/sel \
    sim:/MUX_ALUorMEM/input0 \
    sim:/MUX_ALUorMEM/input1 \
    sim:/MUX_ALUorMEM/output

# Apply test vectors
run 0 ns

# Test Case 1: sel = 0, input0 is selected
force -drive /MUX_ALUorMEM/sel 0
force -drive /MUX_ALUorMEM/input0 32'b00000000000000000000000000001111
force -drive /MUX_ALUorMEM/input1 32'b11111111111111111111111111110000
run 20 ns

# Test Case 2: sel = 1, input1 is selected
force -drive /MUX_ALUorMEM/sel 1
run 20 ns

# Test Case 3: sel = 0, input0 with a different value
force -drive /MUX_ALUorMEM/sel 0
force -drive /MUX_ALUorMEM/input0 32'b10101010101010101010101010101010
run 20 ns

# Test Case 4: sel = 1, input1 with a different value
force -drive /MUX_ALUorMEM/sel 1
force -drive /MUX_ALUorMEM/input1 32'b01010101010101010101010101010101
run 20 ns

# Test Case 5: sel = 0, input0 and input1 are equal
force -drive /MUX_ALUorMEM/sel 0
force -drive /MUX_ALUorMEM/input0 32'b11110000111100001111000011110000
force -drive /MUX_ALUorMEM/input1 32'b11110000111100001111000011110000
run 20 ns

# Test Case 6: sel = 1, input0 and input1 are equal
force -drive /MUX_ALUorMEM/sel 1
run 20 ns


