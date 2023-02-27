
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PMADDWD_test is
--  Port ( );
end PMADDWD_test;

architecture Behavioral of PMADDWD_test is
component PMADDWD 
  Port (A,B: in std_logic_vector(63 downto 0);
        Res: out std_logic_vector(63 downto 0));
end component;
signal A,B,Res: std_logic_vector(63 downto 0);
begin
    p: PMADDWD port map(A=>A,B=>B, Res=>Res);
    process
    begin
          A<=x"1607_1200_a000_7007";
             B<=x"0307_f080_a000_effa";
        wait for 50 ns; 
        
        A <= x"00000032000100a3";
        B <= x"0000000100110004";
        wait for 50 ns; 
   end process;



end Behavioral;
