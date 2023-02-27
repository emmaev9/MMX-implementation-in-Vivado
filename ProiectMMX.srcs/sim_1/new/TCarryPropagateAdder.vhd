
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TCarryPropagateAdder is
--  Port ( );
end TCarryPropagateAdder;

architecture Behavioral of TCarryPropagateAdder is

component CarryPropagateAdder
  Port (x,y: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic;
        enable: in std_logic);
end component;
signal x,y: std_logic_vector(7 downto 0);
signal cin: std_logic;
signal s: std_logic_vector(7 downto 0);
signal cout: std_logic;
signal enable: std_logic;

begin
    p: CarryPropagateAdder port map(x,y,cin,s,cout,enable);
    process
    begin
        x <= "00001111";
        y <= "00011111";
        cin <= '0';
        enable <= '1';
        wait for 100 ns;
        
        enable <= '0';
        wait for 100 ns;

        x <= "00011000";
        y <= "00111100";
        cin <= '1';
        enable <= '1';
        wait for 100 ns;
        
        enable <= '0';
        wait for 100 ns;
    end process;


end Behavioral;
