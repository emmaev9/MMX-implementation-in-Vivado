
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_en is
    Port ( x,y: in std_logic;
           cin: in std_logic;
           cout: out std_logic;
           s: out std_logic;
           enable: in std_logic);
end FullAdder_en;

architecture Behavioral of FullAdder_en is
signal sum, carry: std_logic;
begin   
    process(enable,x,y,cin)
    begin
        if enable = '1' then
            sum <= (x xor y) xor cin;
            carry <= (x and y) or ((x or y)and cin);
        else
            sum <= '0';
            carry <= '0';
        end if;
    end process;
    s <= sum;
    cout <= carry;
end Behavioral;
