Library IEEE;
use IEEE.std_logic_1164.all;

ENTITY IN_PRIORITY IS
	PORT(I0, I2, I3 : IN std_logic;
		  INPUT      : IN std_logic_vector(3 downto 0);
		  OUTPUT     : OUT std_logic);
END IN_PRIORITY;

ARCHITECTURE DATA_FLOW OF IN_PRIORITY IS

BEGIN

OUTPUT <= INPUT(0) when I0 = '1' else
			 INPUT(1) when I2 = '1' else
			 INPUT(2) when I3 = '1' else
			 INPUT(3);

END DATA_FLOW;