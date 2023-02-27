
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1_1bit is
 Port (a: in std_logic;
       sel: in std_logic;
       muxOut:out std_logic);
end mux2to1_1bit;

architecture Behavioral of mux2to1_1bit is

begin
    process(sel)
    begin
        if sel = '1' then
            muxOut <= a;
        else
            muxOut <= '0';
        end if;
   end process;
end Behavioral;
