library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shiftCounter_test is
--  Port ( );
end shiftCounter_test;

architecture Behavioral of shiftCounter_test is
component shiftCounter 
  Port (CLK: in std_logic;
        B: in std_logic_vector(5 downto 0);
        button: in std_logic;
        reset: in std_logic;
        enable: out std_logic);
end component;

signal CLK, button, reset, enable: std_logic;
signal B: std_logic_vector(5 downto 0);

begin

p: shiftCounter port map(CLK=>CLK, B=>B, button=>button, reset=>reset, enable=>enable);
process
begin
    CLK <= '1'; wait for 10 ns;
    CLK <= '0'; wait for 10 ns;
 end process;
 
 
 process
 begin
    reset <= '1'; wait for 20 ns;
    reset <= '0'; wait for 1000 ns;
    
end process;

process
begin
    B <= "001000";
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
