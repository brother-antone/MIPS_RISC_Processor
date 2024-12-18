library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX_DRSelect is
	Port(
		sel				: in std_logic;
		input0, input1	: in std_logic_vector(4 downto 0);
		output 			: out std_logic_vector(4 downto 0)
		);
end entity;

architecture Behavioral of MUX_DRSelect is
begin
	process(sel, input0, input1)
	begin
		if sel = '0' then
			output <= input0;
		else
			output <= input1;
		end if;
	end process;
end Behavioral;

		