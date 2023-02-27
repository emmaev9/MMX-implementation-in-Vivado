library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.STD_LOGIC_UNSIGNED.all;
 use IEEE.std_logic_arith.all;

entity MPG is
    Port ( BTN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           enable : inout STD_LOGIC);
end MPG;

architecture Behavioral of MPG is

signal count_int : std_logic_vector(31 downto 0) :=x"00000000";
signal Q1 : std_logic;
signal Q2 : std_logic;
signal Q3 : std_logic;
begin
    enable <= Q2 AND (not Q3);

    process (CLK) 
    begin
        if CLK'event and CLK='1' then
            count_int <= count_int + 1;
        end if;
    end process;

    process (CLK)
    begin
        if CLK'event and CLK='1' then 
            if count_int(15 downto 0) = "1111111111111111" then 
                Q1 <= BTN;
            end if; 
        end if;
    end process;
    
    process (CLK)
    begin
        if CLK'event and CLK='1' then 
            Q2 <= Q1;
            Q3 <= Q2;
        end if;
    end process;

end Behavioral;
