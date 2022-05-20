--Mohamed Osama_164755
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY SIX_BIT_ODD_PARTY_CHECK IS
	PORT(A		: IN std_logic_vector(5 downto 0);
		  PARTY_O: OUT STD_logic_vector(6 downto 0));
END SIX_BIT_ODD_PARTY_CHECK;

ARCHITECTURE BEHAVIORAL OF SIX_BIT_ODD_PARTY_CHECK IS

signal three_bit_output: std_logic_vector(1 downto 0);

component three_bit_odd_party_check is
	port(a: in std_logic_vector(2 downto 0);
		  odd_detect: out std_logic);
end component;

BEGIN

gen: for i in 0 to 1 generate
	  u: three_bit_odd_party_check port map(a(2 downto 0) => A((2 + 3*i) downto (0 + 3*i)), 
												       odd_detect => three_bit_output(i));
end generate; 

PARTY_O(5 downto 0) <= A(5 downto 0);
ParTY_O(6) <= three_bit_output(0) xnor three_bit_output(1);

END BEHAVIORAL;