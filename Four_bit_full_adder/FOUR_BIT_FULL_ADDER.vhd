Library IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FOUR_BIT_FULL_ADDER IS
	PORT(A   : IN std_logic_vector(3 downto 0);
		  B   : IN std_logic_vector(3 downto 0);
		  Cin : IN std_logic;
		  S   : OUT std_logic_vector(3 downto 0);
		  Cout: OUT std_logic);
END FOUR_BIT_FULL_ADDER;

ARCHITECTURE STRUCTURE OF FOUR_BIT_FULL_ADDER IS

signal C: std_logic_vector(4 downto 0);

component TWO_BIT_FULL_ADDER is
	port(a   : in std_logic;
		  b   : in std_logic;
		  cin : in std_logic;
		  s   : out std_logic;
		  cout: out std_logic);
end component;

BEGIN

gen: for i in 0 to 3 generate
     unit: TWO_BIT_FULL_ADDER port map(a => A(i), b => B(i), cin => C(i), s => S(i), cout => C(i+1));		  
end generate;

C(0) <= Cin;
Cout <= C(4);

END STRUCTURE;