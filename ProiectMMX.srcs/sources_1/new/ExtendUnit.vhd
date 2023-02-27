library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExtendUnit is
  Port (A: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(63 downto 0));
end ExtendUnit;

architecture Behavioral of ExtendUnit is
signal r: std_logic_vector(63 downto 0);
begin
    res(31 downto 0) <= A;
    res(63 downto 32) <= x"00000000";
end Behavioral;
