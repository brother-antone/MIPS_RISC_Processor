library IEEE;
use IEEE.STD_Logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Add4 is
	Port(
		presum : in std_logic_vector(31 downto 0);
		postsum : out std_logic_vector(31 downto 0)
		);
		
end Add4;

architecture Behavioral of Add4 is
begin
	process(presum)
	begin
		postsum <= std_logic_vector(unsigned(presum(29 downto 0) & "00") + 4);
	end process;
end Behavioral;