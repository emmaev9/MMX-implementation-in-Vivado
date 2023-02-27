library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity d_ff is
port(
    clk : in STD_LOGIC;
    din : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable: in std_logic;   
    dout : out STD_LOGIC
);
end d_ff;

architecture behave of d_ff is
signal o: std_logic;
begin

    process (din,clk,reset) is
    begin     
        if (clk'event and clk='1') then
       --    if enable = '1' then
             dout <= din;
       --    end if;
        end if;
    end process ;
  
    end behave;