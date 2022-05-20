library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Blink_LED is 
 Port (
       Clk  : in  STD_LOGIC;
       LED  : out STD_LOGIC
	   );
end Blink_LED;

architecture Behavioral of Blink_LED is
 
 signal pulse          : STD_LOGIC := '0';
 signal count          : integer range 0 to 50000000 := 0;
 
begin 
 
 counter : process(Clk)
 begin 
   
  if Clk'event and Clk = '1' then
    if count = 49999 then
	 
	   count      <= 0;
		pulse      <= not pulse;
		 
	 else
	 
	   count <= count + 1;
		
	 end if;
	 
  end if;
  
 end process;
  
 LED <= pulse;
  

end Behavioral;	 