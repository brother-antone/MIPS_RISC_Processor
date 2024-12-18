library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
	Port(
		CLK, reset 	: in std_logic;
		instruction : in std_logic_vector(31 downto 0); 
		DRSelect, REGorIMM, ALUorMEM, FetchDorI, RegWrite, MemCS, MemWrite, pc_write, rst : out std_logic;
		ALUOp 		: out std_logic_vector(2 downto 0)
	);
end entity;

architecture Behavioral	of Control_Unit is

	type StateType is (InstructFetch, Waiting, Decode, EX_R, EX_I, MEM_LW, MEM_SW, WB);
	signal current_state, next_state : StateType;
	signal opcode : std_logic_vector(5 downto 0);
	signal funct  : std_logic_vector(5 downto 0);
	
begin
	
	opcode <= instruction(31 downto 26);
	funct <= instruction(5 downto 0);
	
	process(CLK, reset)
	begin
		if reset = '1' then
			rst <= '1';
			current_state <= InstructFetch;
		
		elsif rising_edge(CLK) then
			current_state <= next_state;
			rst <= '0';
		end if;
	end process;
	
	process(current_state, opcode)
	begin
		case current_state is
			when InstructFetch =>
				next_state <= Waiting;

			when Waiting =>
				next_state <= Decode;
				
			when Decode =>
			
				case opcode is
					when "000000" => next_state <= EX_R;
					when "001000" => next_state <= EX_I;
					when "001100" => next_state <= EX_I;
					when "001101" => next_state <= EX_I;
					when "100011" => next_state <= MEM_LW;
					when "101011" => next_state <= MEM_SW;
					when others => next_state <= InstructFetch;
				end case;
			
			when EX_R =>
				next_state <= InstructFetch;
				
			when EX_I =>
				next_state <= InstructFetch;
				
			when MEM_LW =>
				next_state <= WB;
				
			when MEM_SW =>
				next_state <= WB;

			when WB =>
				next_state <= InstructFetch;
				
		end case;
	end process;
		
	process(current_state, funct, opcode)
	begin
		DRSelect <= '0';	 -- Default Signals
		REGorIMM <= '0';	 
 		ALUorMEM <= '0'; 	 
		FetchDorI <= '0';  
		RegWrite <= '0'; 	 
		MemCS <= '0';	 	 
		MemWrite <= '0'; 	 
		pc_write <= '0'; 	 		 	 
		ALUOp <= "000";	
		
		case current_state is
			when InstructFetch =>
				MemCS <= '1';
				pc_write <= '1'; 

			when Waiting =>
				
			when Decode =>
			
			when EX_R => 
				DRSelect <= '1'; -- DR is the destination register
				ALUorMEM <= '1'; -- ALU product is used to write to register
				RegWrite <= '1';
				case funct is
					when "100000" => ALUOp <= "011"; -- Adding
					when "100010" => ALUOp <= "100"; -- Subtracting
					when "100100" => ALUOp <= "001"; -- Anding
					when "100101" => ALUOp <= "010"; -- Oring
					when "000000" => ALUOp <= "101"; -- Logical Shift Left
					when "000010" => ALUOp <= "110"; -- Logical Shift Right
					when others => ALUOp <= "000";   -- Error Handling
				end case;

			when EX_I =>
				REGorIMM <= '1'; -- Using Immeadiate
				ALUorMEM <= '1'; -- ALU ouput used as result
				RegWrite <= '1';
				case opcode is
					when "001000" => ALUOp <= "011"; -- Adding Immediate
					when "001100" => ALUOp <= "001"; -- Anding Immediate
					when "001101" => ALUOp <= "010"; -- Oring Immediate
					when others => ALUOp <= "000";
				end case;
				
			when MEM_LW =>
				REGorIMM <= '1';
				FetchDorI <= '1';
				MemCS <= '1';
				ALUOp <= "011";
				
			when MEM_SW =>
				REGorIMM <= '1';
				FetchDorI <= '1';
				MemCS <= '1';
				MemWrite <= '1';
				ALUOp <= "011";

			when WB =>
				case opcode is
					when "100011" => 
						RegWrite <= '1';
						-- MemCS <= '1';
					when "101011" => 
						MemWrite <= '1';
						MemCS <= '1';
						FetchDorI <= '1';
						ALUOp <= "011";
						REGorIMM <= '1';
					when others => 
				end case;
			end case;
				
	end process;
end Behavioral;			
				
				
				
				
				
				
				
		
				
		