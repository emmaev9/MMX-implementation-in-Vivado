
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
  Port (x,y: in std_logic;
           cin: in std_logic;
           cout: out std_logic;
           s: out std_logic );
end FullAdder;

architecture Behavioral of FullAdder is

begin
    s <= (x xor y) xor cin;
    cout <= (x and y) or ((x or y)and cin);


end Behavioral;
