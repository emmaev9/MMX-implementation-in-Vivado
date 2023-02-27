library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCMPEQW_test is
--  Port ( );
end PCMPEQW_test;

architecture Behavioral of PCMPEQW_test is
component PCMPEQW 
  Port (A, B: in std_logic_vector(63 downto 0);
        Res: out std_logic_vector(63 downto 0)); -- o sa fie inlocuit B cu rezultatul
end component;
signal A,B,Res: std_logic_vector(63 downto 0);
begin
    p: pcmpeqw port map (A=>A,B=>B,Res=>Res);
    process
    begin
        A <= x"1607_1200_a000_7007";
        B <= x"0307_f080_a000_effa";
        wait for 100 ns;
        A <= x"00003321a22a5321";
        B <= x"02011321aaaa3213";
        wait for 100 ns;
    end process;
end Behavioral;
