library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_gate is
end entity tb_and_gate;

architecture Behavioral of tb_and_gate is

    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal Y : std_logic;

begin

    DUT: entity work.and_gate
        port map(
            A => A,
            B => B,
            Y => Y
        );

    stimulus: process
    begin

        -- Caso 1: 0 AND 0
        A <= '0';
        B <= '0';
        wait for 10 ns;

        assert Y = '0'
            report "ERROR: 0 AND 0 deberia ser 0"
            severity error;

        -- Caso 2: 0 AND 1
        A <= '0';
        B <= '1';
        wait for 10 ns;

        assert Y = '0'
            report "ERROR: 0 AND 1 deberia ser 0"
            severity error;

        -- Caso 3: 1 AND 0
        A <= '1';
        B <= '0';
        wait for 10 ns;

        assert Y = '0'
            report "ERROR: 1 AND 0 deberia ser 0"
            severity error;

        -- Caso 4: 1 AND 1
        A <= '1';
        B <= '1';
        wait for 10 ns;

        assert Y = '1'
            report "ERROR: 1 AND 1 deberia ser 1"
            severity error;

        report "Simulacion de AND finalizada correctamente."
            severity note;

        wait;

    end process;

end architecture Behavioral;
