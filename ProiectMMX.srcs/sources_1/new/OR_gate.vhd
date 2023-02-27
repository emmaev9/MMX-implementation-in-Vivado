library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_gate is
  Port (A,B: in std_logic;
        gateOut: out std_logic);
end AND_gate;

architecture Behavioral of AND_gate is
begin
    gateOut <= A and B;
end Behavioral;
