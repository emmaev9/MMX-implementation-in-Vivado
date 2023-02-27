library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift1bit is
  Port (b: in std_logic;
        OrOut: out std_logic_vector(31 downto 0));
end shift1bit;

architecture Behavioral of shift1bit is

begin
    orOut(0) <= '0';
    orOut(1) <= b;
    orOut(31 downto 2) <= "000000000000000000000000000000";
end Behavioral;
