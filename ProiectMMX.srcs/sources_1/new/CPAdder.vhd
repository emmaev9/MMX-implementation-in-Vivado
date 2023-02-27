
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CP32_Adder is
  Port (x,y: in std_logic_vector(31 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(31 downto 0);
        cout: out std_logic
     );
end CP32_Adder;

architecture Behavioral of CP32_Adder is

component FullAdder
    Port ( x,y: in std_logic;
           cin: in std_logic;
           cout: out std_logic;
           s: out std_logic
           );
end component;
signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: std_logic;
signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16: std_logic;
signal c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c17,c18,c19,c20: std_logic;
signal s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s17,s18,s19,s20: std_logic;
begin
    p0: FullAdder port map(x=>x(0), y=>y(0), cin=>cin,cout=>c1, s => s(0));
    p1: FullAdder port map(x=>x(1), y=>y(1), cin=>c1,cout=>c2, s => s(1));
    p2: FullAdder port map(x=>x(2), y=>y(2), cin=>c2,cout=>c3, s => s(2));
    p3: FullAdder port map(x=>x(3), y=>y(3), cin=>c3,cout=>c4, s => s(3));
    p4: FullAdder port map(x=>x(4), y=>y(4), cin=>c4,cout=>c5, s => s(4));
    p5: FullAdder port map(x=>x(5), y=>y(5), cin=>c5,cout=>c6, s => s(5));
    p6: FullAdder port map(x=>x(6), y=>y(6), cin=>c6,cout=>c7, s => s(6));
    p7: FullAdder port map(x=>x(7), y=>y(7), cin=>c7,cout=>c8, s => s(7));
     p8: FullAdder port map(x=>x(8), y=>y(8), cin=>c8,cout=>c9, s => s(8));
       p9: FullAdder port map(x=>x(9), y=>y(9), cin=>c9,cout=>c10, s => s(9));
       p10: FullAdder port map(x=>x(10), y=>y(10), cin=>c10,cout=>c11, s => s(10));
       p11: FullAdder port map(x=>x(11), y=>y(11), cin=>c11,cout=>c12, s => s(11));
       p12: FullAdder port map(x=>x(12), y=>y(12), cin=>c12,cout=>c13, s => s(12));
       p13: FullAdder port map(x=>x(13), y=>y(13), cin=>c13,cout=>c14, s => s(13));
       p14: FullAdder port map(x=>x(14), y=>y(14), cin=>c14,cout=>c15, s => s(14));
       p15: FullAdder port map(x=>x(15), y=>y(15), cin=>c15,cout=>c16, s => s(15));
        p16: FullAdder port map(x=>x(16), y=>y(16), cin=>c16,cout=>c17, s => s(16));
          p17: FullAdder port map(x=>x(17), y=>y(17), cin=>c17,cout=>c18, s => s(17));
          p18: FullAdder port map(x=>x(18), y=>y(18), cin=>c18,cout=>c19, s => s(18));
          p19: FullAdder port map(x=>x(19), y=>y(19), cin=>c19,cout=>c20, s => s(19));
          p20: FullAdder port map(x=>x(20), y=>y(20), cin=>c20,cout=>c21, s => s(20));
          p21: FullAdder port map(x=>x(21), y=>y(21), cin=>c21,cout=>c22, s => s(21));
          p22: FullAdder port map(x=>x(22), y=>y(22), cin=>c22,cout=>c23, s => s(22));
          p23: FullAdder port map(x=>x(23), y=>y(23), cin=>c23,cout=>c24, s => s(23));
           p24: FullAdder port map(x=>x(24), y=>y(24), cin=>c24,cout=>c25, s => s(24));
             p25: FullAdder port map(x=>x(25), y=>y(25), cin=>c25,cout=>c26, s => s(25));
             p26: FullAdder port map(x=>x(26), y=>y(26), cin=>c26,cout=>c27, s => s(26));
             p27: FullAdder port map(x=>x(27), y=>y(27), cin=>c27,cout=>c28, s => s(27));
             p28: FullAdder port map(x=>x(28), y=>y(28), cin=>c28,cout=>c29, s => s(28));
             p29: FullAdder port map(x=>x(29), y=>y(29), cin=>c29,cout=>c30, s => s(29));
             p30: FullAdder port map(x=>x(30), y=>y(30), cin=>c30,cout=>c31, s => s(30));
             p31: FullAdder port map(x=>x(31), y=>y(31), cin=>c31,cout=>cout, s => s(31));
  
end Behavioral;