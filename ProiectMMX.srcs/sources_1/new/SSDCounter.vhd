library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.std_logic_unsigned.all;
  use IEEE.std_logic_arith.all;
entity SSDCounter is
  Port (CLK: in std_logic;
        button: in std_logic;
        reset: in std_logic;
        countOut: out std_logic_vector(2 downto 0) );
end SSDCounter;

architecture Behavioral of SSDCounter is

begin
    p0:process (button, reset, CLK) is
    variable count: unsigned (2 downto 0);
    begin
        if reset = '1' then
               count:= (others=>'0');
        elsif rising_edge(CLK) then
                if (button='1') then
                    count:=count+1;
                end if;
                if (count=4) then
                    count:=(others=>'0');
                end if;
        end if;
        countOut<=std_logic_vector(count);
    end process;

end Behavioral;
