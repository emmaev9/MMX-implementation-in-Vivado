library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
  Port (a,b: in std_logic_vector(63 downto 0);
        sel: in std_logic;
        result: out std_logic_vector(63 downto 0) );
end mux2to1;

architecture Behavioral of mux2to1 is

begin
    process(sel,a,b)
    begin
        if sel = '0' then
            result <=a;
        else
            result <=b;
        end if;
    end process;

end Behavioral;
