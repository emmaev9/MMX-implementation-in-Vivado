library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.std_logic_unsigned.all;
  use IEEE.std_logic_arith.all;
  use ieee.numeric_std.all;
entity shiftCounter is
  Port (CLK: in std_logic;
        B: in std_logic_vector(4 downto 0);
        button: in std_logic;
        reset: in std_logic;
        enable: out std_logic);
end shiftCounter;

architecture Behavioral of shiftCounter is

signal count: std_logic_vector(4 downto 0); 
signal en: std_logic;
begin
    p0:process (button, reset,CLK) is
    begin
        if reset = '1' then
               count<= (others=>'0');
        elsif rising_edge(CLK) then
                
                if (button='1') then
                    en<='1';
                    count<=count+1;
                    if (count>=B) then
                       en <= '0'; 
                    end if;    
                else
                    en <= '0';
                end if;
        end if;
        enable <= en;
    end process;

end Behavioral;