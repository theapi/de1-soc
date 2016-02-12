/**
* Double Dabble to convert 8 bit binary to BCD for the seven segmant display.
*
* @see https://en.wikipedia.org/wiki/Double_dabble
* @see http://www.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
*/


module bin2bcd(
    input [7:0] bin,
    output reg [11:0] bcd
);

    reg [3:0] i;   
     
    // NB: not clocked.
    always @(bin) begin
        bcd = 0; //initialize bcd to zero.
        for (i = 4'd0; i < 4'd8; i = i + 4'd1) begin //run for 8 iterations
            bcd = {bcd[10:0], bin[7-i]}; //concatenation
                
            //if a hex digit of 'bcd' is more than 4, add 3 to it.  
            if (i < 4'd7 && bcd[3:0] > 4'd4) 
                bcd[3:0] = bcd[3:0] + 4'd3;
            if (i < 4'd7 && bcd[7:4] > 4'd4)
                bcd[7:4] = bcd[7:4] + 4'd3;
            if (i < 4'd7 && bcd[11:8] > 4'd4)
                bcd[11:8] = bcd[11:8] + 4'd3;  
        end
    end     

endmodule
