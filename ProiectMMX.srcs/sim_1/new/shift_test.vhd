
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_test is
--  Port ( );
end shift_test;

architecture Behavioral of shift_test is
component shift  
  port(CLK: in std_logic;
       reset: in std_logic;
       sel: in std_logic_vector(1 downto 0);
       SI: in std_logic;
       ALOAD : in std_logic; 
       D   : in std_logic_vector(7 downto 0); 
       o: out std_logic_vector(7 downto 0);
       SO  : out std_logic); 
end component; 
signal CLK,reset,SI, SO, ALOAD: std_logic;
signal D,o: std_logic_vector(7 downto 0);
signal sel: std_logic_vector(1 downto 0);

begin

    p: shift port map(CLK=>CLK, reset=>reset, sel=>sel, SI=>SI, ALOAd=>ALOAD, D=>D,o=>o, SO=>SO);
    process
    begin
        CLK <= '1'; wait for 10 ns;
        CLK <= '0'; wait for 10 ns;
    end process;
    
    process
    begin
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 200 ns;
    end process;
    
    process
    begin
          D <= "01011101";
          ALOAD <= '1';
          wait for 30 ns;
          
          ALOAD <= '0';
          wait for 200 ns;
     end process;   
          
    
    process
    begin
        SI<='0';
        sel<="10"; 
        wait for 100 ns;
        
        sel<="11";
        SI <= '1';
        wait for 100 ns;
        
        sel <= "11";
        SI <= '0';
        wait for 100 ns;
        
    end process;


end Behavioral;
