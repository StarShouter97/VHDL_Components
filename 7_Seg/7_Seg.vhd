library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Seven_Seg is
      port( Binary_input : in  STD_LOGIC_VECTOR(3 downto 0);
		      Enable       : out STD_LOGIC;
		      SEG          : out STD_LOGIC_VECTOR(6 downto 0)
		    );
end Seven_Seg;

architecture Behavioral of Seven_Seg is

 signal r_Hex_Encoding : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
 --signal Enable_pin     : STD_LOGIC_VECTOR := '1';

begin 

Binary_Num : process(Binary_input)

   begin
	
   case Binary_input is
        when "0000" =>
          r_Hex_Encoding <= X"7E";
        when "0001" =>
          r_Hex_Encoding <= X"30";
        when "0010" =>
          r_Hex_Encoding <= X"6D";
        when "0011" =>
          r_Hex_Encoding <= X"79";
        when "0100" =>
          r_Hex_Encoding <= X"33";          
        when "0101" =>
          r_Hex_Encoding <= X"5B";
        when "0110" =>
          r_Hex_Encoding <= X"5F";
        when "0111" =>
          r_Hex_Encoding <= X"70";
        when "1000" =>
          r_Hex_Encoding <= X"7F";
        when "1001" =>
          r_Hex_Encoding <= X"7B";
        when "1010" =>
          r_Hex_Encoding <= X"77";
        when "1011" =>
          r_Hex_Encoding <= X"1F";
        when "1100" =>
          r_Hex_Encoding <= X"4E";
        when "1101" =>
          r_Hex_Encoding <= X"3D";
        when "1110" =>
          r_Hex_Encoding <= X"4F";
        when "1111" =>
          r_Hex_Encoding <= X"47";
      end case;
end process;
	
  Enable <= '0';
  
  SEG(0) <= not r_Hex_Encoding(6);
  SEG(1) <= not r_Hex_Encoding(5);
  SEG(2) <= not r_Hex_Encoding(4);
  SEG(3) <= not r_Hex_Encoding(3);
  SEG(4) <= not r_Hex_Encoding(2);
  SEG(5) <= not r_Hex_Encoding(1);
  SEG(6) <= not r_Hex_Encoding(0);

end Behavioral;