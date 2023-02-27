library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ROM is
  Port (addr: in std_logic_vector(2 downto 0);
        data_out: out std_logic_vector(31 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array(0 to 7) of std_logic_vector(31 downto 0);
signal rom: rom_type := (
    x"08240ff0",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000");
begin
    data_out <= rom(conv_integer(addr));
end Behavioral;
