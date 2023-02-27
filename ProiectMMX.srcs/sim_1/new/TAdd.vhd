library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TAdd is
end TAdd;

architecture Behavioral of TAdd is
component ADD 
  Port (A: in std_logic_vector(63 downto 0);
        B: in std_logic_vector(63 downto 0);
        sel: in std_logic_vector(7 downto 0);
        sum: out std_logic_vector(63 downto 0));
end component;

signal A: std_logic_vector(63 downto 0);
signal B: std_logic_vector(63 downto 0);
signal sel: std_logic_vector(7 downto 0);
signal sum: std_logic_vector(63 downto 0);
signal led: std_logic;

begin
    p: ADD port map(A,B,sel,sum);
    process
    begin
       A <= x"1607_1200_a000_7007";
       B <= x"0307_f080_a000_effa";
       sel <= "00000000";
       wait for 20 ns;
       
       sel <= "10101010";
        wait for 20 ns;
     
        sel <= "01110111";
        wait for 20 ns;
        
       
        sel <= "11111111";
        wait for 20 ns;

        
    end process;
        

        
    


end Behavioral;
