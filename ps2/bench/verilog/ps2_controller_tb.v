`timescale 10ns/10ns

module ps2_controller_tb();

    // Declare inputs as regs and outputs as wires
    reg clk, reset;
    reg ps2_clock, ps2_data;
    
    wire scan_ready;
    wire [7:0] scan_code;

    ps2_controller keyboard (
        .reset(reset),
        .clk(clk),
        .ps2_clock(ps2_clock),
        .ps2_data(ps2_data),
        .scan_ready(scan_ready),
        .scan_code(scan_code)
    );
    
    initial begin  
        clk = 0;
        reset = 0;
        ps2_clock = 1;
        
        // 8'h1e: r_ascii <= 8'd50;  // 2
        // 1_1_0001_1110_0 least significant bit first
        #2 ps2_data = 1'b0;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        
        
        #2 ps2_data = 1'b0;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        #2 ps2_data = 1'b1;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        #2 ps2_data = 1'b1;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        #2 ps2_data = 1'b1;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        
        #2 ps2_data = 1'b1;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        #2 ps2_data = 1'b0;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        #2 ps2_data = 1'b0;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        #2 ps2_data = 1'b0;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        
        
        #2 ps2_data = 1'b1;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;
        
        #2 ps2_data = 1'b1;
        #1 ps2_clock = 0;
        #1 ps2_clock = 1;

    end

    always begin
        #1 clk = !clk;
    end
    
endmodule
