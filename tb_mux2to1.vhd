library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux2to1 is
end entity tb_mux2to1;

architecture Behavioral of tb_mux2to1 is

    signal D0 : std_logic := '0';
    signal D1 : std_logic := '0';
    signal S  : std_logic := '0';
    signal Y  : std_logic;

begin

    DUT: entity work.mux2to1
        port map(
            D0 => D0,
            D1 => D1,
            S  => S,
            Y  => Y
        );

    stimulus: process
    begin

        -- S = 0 selecciona D0
        D0 <= '0';
        D1 <= '1';
        S  <= '0';
        wait for 10 ns;

        assert Y = '0'
            report "ERROR: MUX no selecciona D0"
            severity error;

        -- S = 0 y D0 = 1
        D0 <= '1';
        D1 <= '0';
        S  <= '0';
        wait for 10 ns;

        assert Y = '1'
            report "ERROR: MUX no entrega D0"
            severity error;

        -- S = 1 selecciona D1
        D0 <= '0';
        D1 <= '1';
        S  <= '1';
        wait for 10 ns;

        assert Y = '1'
            report "ERROR: MUX no selecciona D1"
            severity error;

        -- S = 1 y D1 = 0
        D0 <= '1';
        D1 <= '0';
        S  <= '1';
        wait for 10 ns;

        assert Y = '0'
            report "ERROR: MUX no entrega D1"
            severity error;

        report "Simulacion del MUX finalizada correctamente."
            severity note;

        wait;

    end process;

end architecture Behavioral;
