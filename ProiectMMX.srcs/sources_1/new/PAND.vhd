library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PAND is
  Port (A,B: in std_logic_vector(63 downto 0);
        result: out std_logic_vector(63 downto 0));
end PAND;

architecture Behavioral of PAND is
component AND_g
  Port (A,B: in std_logic;
        res: out std_logic);
end component;
begin
   forGen: for i in 0 to 63 generate
   p:  AND_g port map(A=>A(i),B=>B(i),res=>result(i));
   end generate forGen; 


end Behavioral;
