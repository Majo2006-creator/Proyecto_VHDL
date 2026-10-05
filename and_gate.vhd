library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port(
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end entity and_gate;

architecture Dataflow of and_gate is
begin

    Y <= A and B;

end architecture Dataflow;
