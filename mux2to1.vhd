library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    port(
        D0 : in  std_logic;
        D1 : in  std_logic;
        S  : in  std_logic;
        Y  : out std_logic
    );
end entity mux2to1;

architecture Dataflow of mux2to1 is
begin

    with S select
        Y <= D0 when '0',
             D1 when '1',
             'X' when others;

end architecture Dataflow;
