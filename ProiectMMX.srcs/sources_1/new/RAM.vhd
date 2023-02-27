library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
entity RAM is
port(
 address: in std_logic_vector(4 downto 0); 
 data_in: in std_logic_vector(7 downto 0);
 write_in: in std_logic; 
 CLK: in std_logic; 
 data_out: out std_logic_vector(7 downto 0)
);
end RAM;
architecture Behavioral of RAM is
    type ram_array is array (0 to 10 ) of std_logic_vector (63 downto 0);
    signal ram_data: ram_array; 
    
    begin
        process(clk)
        begin
            if(rising_edge(clk)) then
                if(write_in='1') then 
                    ram_data(to_integer(unsigned(address))) <= data_in;
                end if;
            end if;
        end process;
    data_out <= ram_data(to_integer(unsigned(address)));

end Behavioral;