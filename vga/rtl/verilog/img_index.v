
/*
 * Example 12-14: Single-Clock Synchronous RAM with Old Data Read‐During‐Write Behavior
 *
 * Quartus II handbook
 * https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/qts/quartusii_handbook.pdf
 *
 */
 
module img_index (
    output reg [23:0] q,
    input [7:0] d,
    input [7:0] write_address, read_address,
    input we, clk
);
    
    (* ramstyle = "M10K" *)
    reg [23:0] mem [255:0] /* synthesis ram_init_file = "index_logo.mif" */;
    //reg [23:0] mem [255:0] /* synthesis ram_init_file = "heart_index.mif" */;
    
    always @ (posedge clk) begin
        if (we)
            mem[write_address] <= d;
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
    
endmodule
