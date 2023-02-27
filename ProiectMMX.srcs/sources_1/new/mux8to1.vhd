library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1 is
  Port (sel: in std_logic_vector(2 downto 0);
        a,b,c,d,e,f,g,h: in std_logic_vector(63 downto 0);
        aluMuxOut: out std_logic_vector(63 downto 0)
   );
end mux8to1;

architecture Behavioral of mux8to1 is
begin
    process(sel)
    begin
        case sel is
            when "000" => aluMuxOut <= a;
            when "001" => aluMuxOut <= b;
            when "010" => aluMuxOut <= c;
            when "011" => aluMuxOut <= d;
            when "100" => aluMuxOut <= e;
            when "101" => aluMuxOut <= f;
            when "110" => aluMuxOut <= g;
            when "111" => aluMuxOut <= h;
            when others => aluMuxOut <= x"0000000000000000";
         end case;
    end process;
           
end Behavioral;
