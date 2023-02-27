library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
      
entity Comp_16bit is
  Port (a,b: in std_logic_vector(15 downto 0);
        eq: out std_logic_vector(15 downto 0)
        );
end Comp_16bit;

architecture Behavioral of Comp_16bit is
signal s: std_logic_vector(15 downto 0);
signal eqq: std_logic;
begin
    s(0)<= a(0) xnor b(0);
    s(1)<= a(1) xnor b(1);
    s(2)<= a(2) xnor b(2);
    s(3)<= a(3) xnor b(3);
    s(4)<= a(4) xnor b(4);
    s(5)<= a(5) xnor b(5);
    s(6)<= a(6) xnor b(6);
    s(7)<= a(7) xnor b(7);
    s(8)<= a(8) xnor b(8);
    s(9)<= a(9) xnor b(9);
    s(10)<= a(10) xnor b(10);
    s(11)<= a(11) xnor b(11);
    s(12)<= a(12) xnor b(12);
    s(13)<= a(13) xnor b(13);
    s(14)<= a(14) xnor b(14);
    s(15)<= a(15) xnor b(15);
    
    eqq <= s(15) and s(14) and s(13) and s(12) and s(11) and s(10) and s(9) and s(8) and s(7) and s(6) and s(5) and s(4) and s(3) and s(2) and s(1) and s(0);
   process(eqq)
    begin
        if eqq = '0' then
            eq <= x"0000";
        else
            eq <= X"FFFF";
        end if;
    end process;
    

end Behavioral;
