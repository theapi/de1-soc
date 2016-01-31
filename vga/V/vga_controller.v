module vga_controller(
    input reset,
    input vga_clk,
    output blank_n,
    output HS,
    output VS,
    output [7:0] red,
    output [7:0] green,  
    output [7:0] blue
);

    wire [10:0] pixel_h;
    wire [10:0] pixel_v;
    reg [7:0] r_red;
    reg [7:0] r_green;
    reg [7:0] r_blue;

    vga_sync_generator vga_sync(
        .reset(reset),
        .vga_clk(vga_clk),
        .blank_n(blank_n),
        .next_pixel_h(pixel_h),
        .next_pixel_v(pixel_v),
        .HS(HS),
        .VS(VS)
    );
    

    
    always@(posedge vga_clk) begin
        if (!blank_n) begin
            // black during blanking
            r_red <= 8'b0;
            r_green <= 8'b0;
            r_blue <= 8'b0;
        end else begin
            // Draw a single square.
            if (pixel_h >= 100 && pixel_h <= 200 && pixel_v >= 100 && pixel_v <= 200) begin
                r_red <= 8'b1111_1111;
                r_green <= 8'b0;
                r_blue <= 8'b0;
            end 
            else begin
                r_red <= 8'b0;
                r_green <= 8'b0;
                r_blue <= 8'b1111_1111;
            end
        end
    end
    
    assign red   = r_red;
    assign green = r_green;
    assign blue  = r_blue;
    
endmodule
    