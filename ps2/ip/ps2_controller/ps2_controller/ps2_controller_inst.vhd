	component ps2_controller is
		port (
			clk           : in    std_logic                    := 'X';             -- clk
			reset         : in    std_logic                    := 'X';             -- reset
			PS2_CLK       : inout std_logic                    := 'X';             -- CLK
			PS2_DAT       : inout std_logic                    := 'X';             -- DAT
			command       : in    std_logic_vector(7 downto 0) := (others => 'X'); -- data
			command_valid : in    std_logic                    := 'X';             -- valid
			command_ready : out   std_logic;                                       -- ready
			data_ready    : in    std_logic                    := 'X';             -- ready
			data          : out   std_logic_vector(7 downto 0);                    -- data
			data_valid    : out   std_logic                                        -- valid
		);
	end component ps2_controller;

	u0 : component ps2_controller
		port map (
			clk           => CONNECTED_TO_clk,           --                     clk.clk
			reset         => CONNECTED_TO_reset,         --                   reset.reset
			PS2_CLK       => CONNECTED_TO_PS2_CLK,       --      external_interface.CLK
			PS2_DAT       => CONNECTED_TO_PS2_DAT,       --                        .DAT
			command       => CONNECTED_TO_command,       -- avalon_ps2_command_sink.data
			command_valid => CONNECTED_TO_command_valid, --                        .valid
			command_ready => CONNECTED_TO_command_ready, --                        .ready
			data_ready    => CONNECTED_TO_data_ready,    --  avalon_ps2_data_source.ready
			data          => CONNECTED_TO_data,          --                        .data
			data_valid    => CONNECTED_TO_data_valid     --                        .valid
		);

