library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPA_en is
  Port (x,y: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic;
        enable: in std_logic
     );
end CPA_en;

architecture Behavioral of CPA_en is
component FullAdder_en
    Port ( x,y: in std_logic;
           cin: in std_logic;
           cout: out std_logic;
           s: out std_logic;
           enable: in std_logic
           );
end component;
signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: std_logic;
signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16: std_logic;
begin
    p0: FullAdder_en port map(x=>x(0), y=>y(0), cin=>cin,cout=>c1, s => s(0), enable=>enable);
    p1: FullAdder_en port map(x=>x(1), y=>y(1), cin=>c1,cout=>c2, s => s(1), enable =>enable);
    p2: FullAdder_en port map(x=>x(2), y=>y(2), cin=>c2,cout=>c3, s => s(2), enable=>enable);
    p3: FullAdder_en port map(x=>x(3), y=>y(3), cin=>c3,cout=>c4, s => s(3), enable=>enable);
    p4: FullAdder_en port map(x=>x(4), y=>y(4), cin=>c4,cout=>c5, s => s(4), enable =>enable);
    p5: FullAdder_en port map(x=>x(5), y=>y(5), cin=>c5,cout=>c6, s => s(5), enable =>enable);
    p6: FullAdder_en port map(x=>x(6), y=>y(6), cin=>c6,cout=>c7, s => s(6), enable =>enable);
    p7: FullAdder_en port map(x=>x(7), y=>y(7), cin=>c7,cout=>cout, s => s(7), enable=>enable);

end Behavioral;
