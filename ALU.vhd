library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
	Port(
		A			: in std_logic_vector(31 downto 0);
		B			: in std_logic_vector(31 downto 0);
		ALUop		: in std_logic_vector(2 downto 0);
		Result	: out std_logic_vector(31 downto 0)
		);
end entity;

architecture Behavioral of ALU is
begin
	process(A, B, ALUop)
	begin
		case ALUop is
			when "001" => Result <= A and B;
			when "010" => Result <= A or B;
			when "011" => Result <= std_logic_vector(signed(A) + signed(B));
			when "100" => Result <= std_logic_vector(signed(A) - signed(B));
			when "101" => Result <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
			when "110" => Result <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
			when others => Result <= (others => '0');
		end case;
	end process;
end Behavioral;
			