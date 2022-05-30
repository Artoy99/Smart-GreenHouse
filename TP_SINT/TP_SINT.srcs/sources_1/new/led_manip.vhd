library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.CanBus;
use work.CanLite;

library ws2812b;
use ws2812b.all;

entity led_manip is
	port(
		clk           : in  std_logic;
		rst_hw        : in  std_logic;
		btn_n         : in  std_logic;
		so            : out std_logic;
		
		Can_TX_pin    : out std_logic;
		Can_RX_pin    : in std_logic
	);
end entity led_manip;

architecture RTL of led_manip is
	constant F_CLK     : integer := 100000000;
	constant F_SYSTICK : integer := 2
	-- pragma translate_off
	-- pragma synthesis_off
	* 10
--pragma translate_on
-- pragma synthesis_on
;
	constant LENGTH : integer := 120
	-- pragma translate_off
	-- pragma synthesis_off
	/ 10
--pragma translate_on
-- pragma synthesis_on
;
	constant INCREMENT   : integer := 10;
	constant PIXDATA_MAX : integer := 100; -- Must be a multiple of INCREMENT

	signal rst : std_logic;

	signal pixData_red         : unsigned(7 downto 0);
	signal pixData_green       : unsigned(7 downto 0);
	signal pixData_blue        : unsigned(7 downto 0);
	signal pixData_red_corr    : std_logic_vector(7 downto 0);
	signal pixData_green_corr  : std_logic_vector(7 downto 0);
	signal pixData_blue_corr   : std_logic_vector(7 downto 0);
	signal pixData_red_start   : unsigned(7 downto 0);
	signal pixData_green_start : unsigned(7 downto 0);
	signal pixData_blue_start  : unsigned(7 downto 0);
	signal pixData_valid       : std_logic;
	signal pixData_next        : std_logic;

	type color_transition_t is (RY, YG, GC, CB, BP, PR);
	signal color_transition_live  : color_transition_t;
	signal color_transition_start : color_transition_t;
	signal pixCount               : integer range 0 to LENGTH - 1;
	signal render_active          : std_logic;
	
	type luminosite_t is (OFF, ON1, ON2, ON3, ON4, ON5);
	signal luminosite_live  : luminosite_t;
	signal luminosite_start : luminosite_t;

	signal systick : std_logic;
	
	signal Clock   : std_logic;
	signal Reset_n : std_logic;
	signal RxFrame : CanBus.Frame;
	signal RxFifoWriteEnable : std_logic;
	signal RxFifoFull : std_logic;
	signal TxFrame : CanBus.Frame;
	signal TxFifoReadEnable : std_logic;
	signal TxFifoEmpty : std_logic;
	signal TxAck : std_logic;
	signal Status : CanBus.Status;
	signal CanRx : std_logic;
	signal CanTx : std_logic;
	
begin
	rst <= not rst_hw;
	
	-- Instance du CAN
	CanBus_inst : entity work.canlite 
		generic map (
		BAUD_RATE_PRESCALAR		=> 10,
		SYNCHRONIZATION_JUMP_WIDTH  	=> 3,
		TIME_SEGMENT_1			=> 4,
		TIME_SEGMENT_2			=> 5,
		TRIPLE_SAMPLING 			=> true)
		port map (
			Clock => Clock,
			Reset_n => Reset_n,
			RxFrame => RxFrame,
			RxFifoWriteEnable => RxFifoWriteEnable, 
			RxFifoFull => RxFifoFull,
			TxFrame => TxFrame,
			TxFifoReadEnable => TxFifoReadEnable, 
			TxFifoEmpty => TxFifoEmpty, 
			TxAck => TxAck,
			Status => Status,
			CanRx => CanRx,
			CanTx => CanTx
			);

	-- WS2812B PHY
	ws2812b_phy_inst : entity work.ws2812b_phy
		generic map(
			f_clk => F_CLK
		)
		port map(
			clk           => clk,
			rst           => rst,
			so            => so,
			pixData_red   => pixData_red_corr,
			pixData_green => pixData_green_corr,
			pixData_blue  => pixData_blue_corr,
			pixData_valid => pixData_valid,
			pixData_next  => pixData_next
		);
		
    -- Division de la fréquence pour descendre à 24 MHz (arrondi à 25)
    clk_div : process(clk, rst) is
        variable count : integer range 0 to 4;
    begin
        if rst = '1' then
			count     := 0;
			Clock <= '0';
		elsif rising_edge(clk) then
			if count = 4 then
				count     := 0;
				Clock <= not Clock;
			else
				count := count + 1;
			end if;
		end if;
	end process clk_div;

	-- Gamma correction
	ws2812b_gamma_red_inst : entity work.ws2812b_gamma
		port map(
			pixelData_in  => std_logic_vector(pixData_red),
			pixelData_out => pixData_red_corr
		);

	ws2812b_gamma_green_inst : entity work.ws2812b_gamma
		port map(
			pixelData_in  => std_logic_vector(pixData_green),
			pixelData_out => pixData_green_corr
		);

	ws2812b_gamma_blue_inst : entity work.ws2812b_gamma
		port map(
			pixelData_in  => std_logic_vector(pixData_blue),
			pixelData_out => pixData_blue_corr
			);

	-- Timebase to advance the animation
	systick_p : process(clk, rst) is
		constant cmax : integer := (F_CLK / F_SYSTICK);
		variable cnt  : integer range 0 to cmax;
	begin
		if rst = '1' then
			cnt     := 0;
			systick <= '0';
		elsif rising_edge(clk) then
			systick <= '0';
			if cnt = cmax then
				cnt     := 0;
				systick <= '1';
			else
				cnt := cnt + 1;
			end if;
		end if;
	end process systick_p;
    
    on_message_receive : process(clk, RxFifoWriteEnable, rst) is
    
        procedure luminosite(next_luminosite : in luminosite_t; is_live : boolean; lum : unsigned) is
		begin
			pixData_red_start <= lum;
			pixData_green_start <= lum;
			pixData_blue_start <= lum;
			
			if is_live then
				luminosite_live <= next_luminosite;
			else
				luminosite_start <= next_luminosite;
			end if;
		end procedure;
	begin
	
	   if rst = '1' then
			pixData_red            <= to_unsigned(PIXDATA_MAX, pixData_red'length);
			pixData_green          <= to_unsigned(PIXDATA_MAX, pixData_red'length);
			pixData_blue           <= to_unsigned(PIXDATA_MAX, pixData_red'length);
			pixData_red_start      <= to_unsigned(PIXDATA_MAX, pixData_red'length);
			pixData_green_start    <= to_unsigned(PIXDATA_MAX, pixData_red'length);
			pixData_blue_start     <= to_unsigned(PIXDATA_MAX, pixData_red'length);
			luminosite_live  <= OFF;
			luminosite_start <= OFF;
			pixCount               <= 0;
			render_active          <= '0';
			
	   elsif RxFifoWriteEnable = '1' then
	       if(RxFrame.Id = X"13") then
	           if (RxFrame.Data(0) = X"15") then
	               case RxFrame.Data(4) is
	                   when X"0" =>
	                       luminosite_live <= OFF;
	                       luminosite_start <= OFF;
	                   when X"1" =>
	                       luminosite_live <= ON1;
	                       luminosite_start <= ON1;
	                   when X"2" =>
	                       luminosite_live <= ON2;
	                       luminosite_start <= ON2;
	                   when X"3" =>
	                       luminosite_live <= ON3;
	                       luminosite_start <= ON3;
	                   when X"4" =>
	                       luminosite_live <= ON4;
	                       luminosite_start <= ON4;
	                   when X"5" =>
	                       luminosite_live <= ON5;
	                       luminosite_start <= ON5;
	               end case;
	           end if;
	       end if;
	       RxFifoWriteEnable <= '0';
	   
	   elsif rising_edge(clk) then
			-- Render one strip
			if render_active = '1' then
				if pixData_next = '1' then
					if pixCount = LENGTH - 1 then
						pixCount      <= 0;
						render_active <= '0';
					else
						pixCount <= pixCount + 1;
					end if;
				end if;
			end if;

			-- Advance image on trigger
			if systick = '1' then
				report "rainbow: render strobe" severity note;

				case luminosite_start is
					when OFF =>
						luminosite(ON1, false, "00000000");
					when ON1 =>
						luminosite(ON2, false, "01100100");
					when ON2 =>
						luminosite(ON3, false, "11001000");
					when ON3 =>
						luminosite(ON4, false, "11111111");
					when ON4 =>
						luminosite(ON5, false, "11001000");
					when ON5 =>
						luminosite(OFF, false, "01100100");
				end case;

				render_active <= '1';
				if render_active = '0' then
					pixData_red           <= pixData_red_start;
					pixData_green         <= pixData_green_start;
					pixData_blue          <= pixData_blue_start;
					color_transition_live <= color_transition_start;
				end if;
			end if;
		end if;
	
	
		
	end process on_message_receive;
	pixData_valid <= render_active;
end architecture RTL;
