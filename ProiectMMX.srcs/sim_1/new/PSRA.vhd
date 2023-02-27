
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSRA_test is
--  Port ( );
end PSRA_test;

architecture Behavioral of PSRA_test is
component PSRA 
  Port (
        CLK: std_logic;
        A: in std_logic_vector(63 downto 0); 
        B: in std_logic_vector(63 downto 0);
        sel: in std_logic_vector(7 downto 0);
        btn: in std_logic;
        reset: in std_logic;
        result: out std_logic_vector(63 downto 0)
        );
end component;

signal CLK: std_logic;
signal A: std_logic_vector(63 downto 0); 
signal B:  std_logic_vector(63 downto 0);
signal sel:  std_logic_vector(7 downto 0);
signal reset: std_logic;
signal button: std_logic;
signal result: std_logic_vector(63 downto 0);

begin
    p: PSRA port map(CLK=>CLK,A=>A,B=>B,sel=>sel,btn=>button,reset=>reset,result=>result);
    process
    begin
        CLK <= '1'; wait for 10 ns;
        CLK <= '0'; wait for 10 ns;
    end process;
    
    process
    begin
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 300 ns;
    end process;
    
    process
    begin
        A <= x"1607_1200_a000_7007";
      --  B <= x"1111111111111111";
        sel <= "11111111";
        wait for 300 ns;


         sel <= "10101010";
         wait for 300 ns;
         
   

         sel <= "10001000";
         wait for 300 ns;

          sel <= "10000000";
          wait for 300 ns;     
    end process;
    
    process
    begin
        B <= "0000000000000000000000000000000000000000000000000000000000001000";
        wait for 1000 ns;
    end process;
    
    process
    begin
        button <= '1'; wait for 20 ns;
        button <= '0'; wait for 20 ns;
        
        button <= '1'; wait for 20 ns;
            button <= '0'; wait for 20 ns;
            
            button <= '1'; wait for 20 ns;
                button <= '0'; wait for 20 ns;
                
                button <= '1'; wait for 20 ns;
                    button <= '0'; wait for 20 ns;
                    
                    button <= '1'; wait for 20 ns;
                        button <= '0'; wait for 20 ns;
                        
                        button <= '1'; wait for 20 ns;
                            button <= '0'; wait for 20 ns;
                            
                            button <= '1'; wait for 20 ns;
                                button <= '0'; wait for 20 ns;
                                
                                button <= '1'; wait for 20 ns;
                                    button <= '0'; wait for 20 ns;
                                    
                                    button <= '1'; wait for 20 ns;
                                        button <= '0'; wait for 20 ns;
                                        
                                        button <= '1'; wait for 20 ns;
                                            button <= '0'; wait for 20 ns;
        
        
       end process; 
     
    

        
        
    
end Behavioral;
