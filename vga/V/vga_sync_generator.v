module vga_sync_generator(
    input reset,
    input vga_clk,
    output reg blank_n,
    output reg [10:0] next_pixel_h,
    output reg [10:0] next_pixel_v,
    output reg HS,
    output reg VS
);


/*
--VGA Timing
--Horizontal :
--                ______________                 _____________
--               |              |               |
--_______________|  VIDEO       |_______________|  VIDEO (next line)

--___________   _____________________   ______________________
--           |_|                     |_|
--            B 
--              <-C-><----D----><-E->
--           <------------A--------->
--The Unit used below are pixels;  
--  B->Sync                         :H_sync
--  C->Back_porch                   :hori_back 
--  D->Visable Area                 :hori_visible
--  E->Front porch                  :hori_front
--  A->horizontal line total length :hori_line
--Vertical :
--               ______________                 _____________
--              |              |               |          
--______________|  VIDEO       |_______________|  VIDEO (next frame)
--
--__________   _____________________   ______________________
--          |_|                     |_|
--           P 
--             <-Q-><----R----><-S->
--          <-----------O---------->
--The Unit used below are horizontal lines;  
--  P->Sync                         :V_sync
--  Q->Back_porch                   :vert_back 
--  R->Visable Area                 :vert_visible
--  S->Front porch                  :vert_front
--  O->vertical line total length :vert_line
*/

    //parameter
    /*
    parameter hori_line  = 800;                           
    parameter hori_back  = 144;
    parameter hori_front = 16;
    parameter vert_line  = 525;
    parameter vert_back  = 34;
    parameter vert_front = 11;
    parameter H_sync_cycle = 96;
    parameter V_sync_cycle = 2;
*/
    
    parameter hori_visible  = 800;                           
    parameter hori_back  = 47; 
    parameter hori_front = 40;
    parameter vert_visible  = 480;
    parameter vert_back  = 31;
    parameter vert_front = 13;
    parameter H_sync = 88;
    parameter V_sync = 3;
    
    
//=======================================================
//  REG/WIRE declarations
//=======================================================

    reg [10:0] h_cnt;
    reg [10:0]  v_cnt;
    wire cHD,cVD,cDEN,hori_valid,vert_valid;
    wire [10:0] hori_line;
    wire [10:0] vert_line;


//=======================================================
//  Structural coding
//=======================================================

    assign hori_line = hori_back + hori_visible + hori_front;
    assign vert_line = vert_back + vert_visible + vert_front;

    // Count the pixels including those in porches.
    always@(negedge vga_clk, posedge reset) begin
        if (reset) begin
            h_cnt <= 11'd0;
            v_cnt <= 11'd0;
        end else begin
            if (h_cnt == hori_line - 1) begin 
                h_cnt <= 11'd0;
            if (v_cnt == vert_line - 1)
                v_cnt <= 11'd0;
            else
                v_cnt <= v_cnt + 1;
        end else
             h_cnt <= h_cnt + 1;
        end
    end

    // Next pixel values.
    always@(negedge vga_clk, posedge reset) begin
        if (reset) begin
            next_pixel_h <= 11'd0;
            next_pixel_v <= 11'd0;
        end else if (cDEN) begin // Active part of the screen
            if (next_pixel_h == hori_visible) begin
                next_pixel_h <= 11'd0;
                if (next_pixel_v == vert_visible) begin
                    next_pixel_v <= 11'd0;
                end else begin
                    next_pixel_v <= next_pixel_v + 11'd1;
                end
            end else begin
                next_pixel_h <= next_pixel_h + 11'd1;
            end
        end
    end

    // Sync pulses
    assign cHD = (h_cnt < H_sync) ? 1'b0 : 1'b1;
    assign cVD = (v_cnt < V_sync) ? 1'b0 : 1'b1;

    // Valid when not in the porches.
    assign hori_valid = (h_cnt > (H_sync + hori_back) && h_cnt < hori_front) ? 1'b1 : 1'b0;
    assign vert_valid = (v_cnt > (V_sync + vert_back) && v_cnt < vert_front) ? 1'b1 : 1'b0;

    assign cDEN = hori_valid && vert_valid;

    always@(negedge vga_clk) begin
        HS <= cHD;
        VS <= cVD;
        blank_n <= cDEN;
    end

endmodule

