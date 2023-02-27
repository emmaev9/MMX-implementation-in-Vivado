library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PAND_test is
--  Port ( );
end PAND_test;

architecture Behavioral of PAND_test is
component PAND 
  Port (A,B: in std_logic_vector(63 downto 0);
        result: out std_logic_vector(63 downto 0));
end component;
signal A,B,result: std_logic_vector(63 downto 0);
begin
    p: PAND port map(A,B,result);
    process
    begin
        A <= x"00050f3104130000";
        B <= x"010204430fea1211";
        wait for 100 ns;
        
         A <= x"00050f3444430000";
         B <= x"011111110fea1211";
         wait for 100 ns;
    end process;
end Behavioral;
