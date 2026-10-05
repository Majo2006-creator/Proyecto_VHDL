library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decoder2to4 is
end entity tb_decoder2to4;

architecture Behavioral of tb_decoder2to4 is

    signal A : std_logic_vector(1 downto 0);
    signal Y : std_logic_vector(3 downto 0);

begin

    DUT: entity work.decoder2to4
        port map(
            A => A,
            Y => Y
        );

    stimulus: process
    begin

        A <= "00";
        wait for 10 ns;

        assert Y = "0001"
            report "ERROR: Entrada 00"
            severity error;

        A <= "01";
        wait for 10 ns;

        assert Y = "0010"
            report "ERROR: Entrada 01"
            severity error;

        A <= "10";
        wait for 10 ns;

        assert Y = "0100"
            report "ERROR: Entrada 10"
            severity error;

        A <= "11";
        wait for 10 ns;

        assert Y = "1000"
            report "ERROR: Entrada 11"
            severity error;

        report "Simulacion del decodificador finalizada correctamente."
            severity note;

        wait;

    end process;

end architecture Behavioral;
