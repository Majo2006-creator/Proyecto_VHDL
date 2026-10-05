library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder_2bit is
    port(
        A     : in  std_logic_vector(1 downto 0);
        B     : in  std_logic_vector(1 downto 0);
        SUM   : out std_logic_vector(1 downto 0);
        CARRY : out std_logic
    );
end entity adder_2bit;

architecture Dataflow of adder_2bit is

    signal TEMP : unsigned(2 downto 0);

    -- Señales para demostrar operadores lógicos
    signal logic_check : std_logic;

begin

    -- Operador aritmético
    TEMP <= ('0' & unsigned(A)) + ('0' & unsigned(B));

    SUM   <= std_logic_vector(TEMP(1 downto 0));
    CARRY <= TEMP(2);

    -- Operador lógico
    logic_check <= A(0) xor B(0);

end architecture Dataflow;
