quit -sim
vsim work.ALU

add wave -position insertpoint \
	sim:/ALU/A \
	sim:/ALU/B \
	sim:/ALU/ALUop \
	sim:/ALU/Result

run 0 ns

#Test Case 1: Logical AND
#A = 2, B = 1
force -drive /ALU/A 32'b00000000000000000000000000000010
force -drive /ALU/B 32'b00000000000000000000000000000001
force -drive /ALU/ALUop "000"
run 20 ns

#Test Case 2: Logical OR
#A = 2, B = 1]
force -drive /ALU/ALUop "001"
run 20 ns

#Test Case 3: Addition
#A = 2, B = 3
force -drive /ALU/A 32'b00000000000000000000000000000010
force -drive /ALU/B 32'b00000000000000000000000000000011
force -drive /ALU/ALUop "010"
run 20 ns

#Test Case 4: Subtraction
#A = 3, B = 1
force -drive /ALU/A 32'b00000000000000000000000000000011
force -drive /ALU/B 32'b00000000000000000000000000000001
force -drive /ALU/ALUop "011"  
run 20 ns

# Test Case 5: Shift Left
# A = 1, B = 2
force -drive /ALU/A 32'b00000000000000000000000000000001
force -drive /ALU/B 32'b00000000000000000000000000000010
force -drive /ALU/ALUop "100" 
run 20 ns

# Test Case 6: Shift Right
# A = 8, B = 2
force -drive /ALU/A 32'b00000000000000000000000000001000
force -drive /ALU/B 32'b00000000000000000000000000000010
force -drive /ALU/ALUop "101" 
run 20 ns

# Test Case 7: Default Operation
# A = 0, B = 0
force -drive /ALU/A 32'b00000000000000000000000000000000
force -drive /ALU/B 32'b00000000000000000000000000000000
force -drive /ALU/ALUop "111"  
run 20 ns

# Test edge case with all ones
# A = 32'b11111111111111111111111111111111, B = 32'b00000000000000000000000000000001
force -drive /ALU/A 32'b11111111111111111111111111111111
force -drive /ALU/B 32'b00000000000000000000000000000001
force -drive /ALU/ALUop "010"  
run 20 ns

# Test Case 8: Large subtraction
# A = 32'b10000000000000000000000000000000, B = 32'b00000000000000000000000000000001
force -drive /ALU/A 32'b10000000000000000000000000000000
force -drive /ALU/B 32'b00000000000000000000000000000001
force -drive /ALU/ALUop "011" 
run 20 ns