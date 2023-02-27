
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift1bit_test is
--  Port ( );
end shift1bit_test;

architecture Behavioral of shift1bit_test is
component shift1bit
  Port (b: in std_logic;
        OrOut: out std_logic_vector(31 downto 0));
end component;
signal b: std_logic;
signal orOut: std_logic_vector(31 downto 0);
begin
    p: shift1bit port map(b=>b,orout=>orout);
    process
    begin
        b <= '1';
        wait for 100 ns;
        b <= '0';
        wait for 100 ns;
    end process;


end Behavioral;
