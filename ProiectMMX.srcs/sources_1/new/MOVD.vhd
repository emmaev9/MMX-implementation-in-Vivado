library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOVD is
  Port (B: in std_logic_vector(31 downto 0);
        Result: out std_logic_vector(63 downto 0));
end MOVD;

architecture Behavioral of MOVD is
begin
    Result <= B and x"00000000ffffffff";
end Behavioral;
