library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCMPEQW is
  Port (A,B: in std_logic_vector(63 downto 0);
        Res: out std_logic_vector(63 downto 0));
end PCMPEQW;

architecture Behavioral of PCMPEQW is

component Comp_16bit
  Port (a,b: in std_logic_vector(15 downto 0);
        eq: out std_logic_vector(15 downto 0)
        );
end component;
begin
    word1: Comp_16bit port map(a=>A(15 downto 0), b=>B(15 downto 0), eq => Res(15 downto 0));
    word2: Comp_16bit port map(a=>A(31 downto 16), b=>B(31 downto 16), eq => Res(31 downto 16));
    word3: Comp_16bit port map(a=>A(47 downto 32), b=>B(47 downto 32), eq => Res(47 downto 32));
    word4: Comp_16bit port map(a=>A(63 downto 48), b=>B(63 downto 48), eq => Res(63 downto 48));
end Behavioral;
