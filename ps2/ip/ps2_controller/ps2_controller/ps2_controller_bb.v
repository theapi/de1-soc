
module ps2_controller (
	clk,
	reset,
	PS2_CLK,
	PS2_DAT,
	command,
	command_valid,
	command_ready,
	data_ready,
	data,
	data_valid);	

	input		clk;
	input		reset;
	inout		PS2_CLK;
	inout		PS2_DAT;
	input	[7:0]	command;
	input		command_valid;
	output		command_ready;
	input		data_ready;
	output	[7:0]	data;
	output		data_valid;
endmodule
