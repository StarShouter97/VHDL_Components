Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY ALU IS
	PORT(A: IN std_logic_vector(3 downto 0);
	     B: IN std_logic_vector(3 downto 0);
		  S: IN std_logic_vector(1 downto 0);
		  O: OUT std_logic_vector(4 downto 0));
END ALU;

ARCHITECTURE DATA_FLOW OF ALU IS

BEGIN

O <= ('0'&A) + ('0'&B)   when S = "00" else
	  ('0'&A) - ('0'&B)   when S = "01" else
	  ('0'&A) and ('0'&B) when S = "10" else
	  ('0'&A) or ('0'&B)  when S = "11" else
	  (others => 'X');

END DATA_FLOW;