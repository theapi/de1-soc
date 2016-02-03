	ps2_controller u0 (
		.clk           (<connected-to-clk>),           //                     clk.clk
		.reset         (<connected-to-reset>),         //                   reset.reset
		.PS2_CLK       (<connected-to-PS2_CLK>),       //      external_interface.CLK
		.PS2_DAT       (<connected-to-PS2_DAT>),       //                        .DAT
		.command       (<connected-to-command>),       // avalon_ps2_command_sink.data
		.command_valid (<connected-to-command_valid>), //                        .valid
		.command_ready (<connected-to-command_ready>), //                        .ready
		.data_ready    (<connected-to-data_ready>),    //  avalon_ps2_data_source.ready
		.data          (<connected-to-data>),          //                        .data
		.data_valid    (<connected-to-data_valid>)     //                        .valid
	);

