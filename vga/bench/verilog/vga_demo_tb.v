`timescale 10ns/10ns


module vga_demo_tb();

    // Declare inputs as regs and outputs as wires
    reg VGA_CLK;
    reg RESET;
    wire [7:0] VGA_RED;
    wire [7:0] VGA_GREEN;
    wire [7:0] VGA_BLUE;
    wire VGA_HS;
    wire VGA_VS;
    wire BLANK_N;

    vga_demo vga_ins(
        .CLOCK_PIXEL(VGA_CLK),
        .RESET(RESET),
        .VGA_RED(VGA_RED),
        .VGA_GREEN(VGA_GREEN),
        .VGA_BLUE(VGA_BLUE),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .BLANK_N(BLANK_N)
    );

    initial begin
        RESET = 0;
        VGA_CLK = 0;
        
        #2
        RESET = 1;
        
        #2
        RESET = 0;

    
    end
    

    always begin
        #1 VGA_CLK = !VGA_CLK;
    end
 
endmodule
