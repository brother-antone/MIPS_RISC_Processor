library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sign_Extend is
	Port(
		imm_in	: in std_logic_vector(15 downto 0);
		imm_out	: out std_logic_vector(31 downto 0)
		);
end entity;
		
architecture Behavioral of Sign_Extend is
begin
	process(imm_in)
	begin
		if imm_in(15) = '1' then
			imm_out <= "1111111111111111" & imm_in;
		else
			imm_out <= "0000000000000000" & imm_in;
		end if;
	end process;
end Behavioral;
		