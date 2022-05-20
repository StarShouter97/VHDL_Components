library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY THREE_BIT_ODD_PARTY_CHECK IS
	PORT(A			: IN std_logic_vector(2 downto 0);
		  ODD_DETECT: OUT std_logic);
END THREE_BIT_ODD_PARTY_CHECK;

ARCHITECTURE DATA_FLOW OF THREE_BIT_ODD_PARTY_CHECK IS

BEGIN

ODD_DETECT <= (not A(0) and not A(1) and not A(2)) or (not A(0) and A(1) and A(2)) or 
				  (A(0) and not A(1) and A(2)) or (A(0) and A(1) and not A(2));

END DATA_FLOW; 