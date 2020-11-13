library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity led_blink is
port(clk_25mhz : in  std_logic;  -- Default clock is 25MHz
     led       : out std_logic_vector(7 downto 0)); -- Blinking LED
end entity led_blink;

-- LED blinker at 1Hz
architecture rtl of led_blink is
constant MAX_VALUE    : natural := 12500000;
signal   counter    : natural range 0 to MAX_VALUE;
signal   led0_toggle : std_logic := '0';
signal   w_LED_SELECT : std_logic;
begin
    blink_at_1hz : process (clk_25mhz) is
    begin
        if rising_edge(clk_25mhz) then
            if counter = MAX_VALUE-1 then
                led0_toggle <= not led0_toggle;
                counter    <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process blink_at_1hz;
    led(0) <= led0_toggle;
end architecture rtl;