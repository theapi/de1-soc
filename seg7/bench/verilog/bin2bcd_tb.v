module bin2bcd_tb;

    // Input
    reg [7:0] bin;
    // Output
    wire [11:0] bcd;
    // Extra variables
    reg [8:0] i;

    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;
    
    assign ones = bcd[3:0];
    assign tens = bcd[7:4];
    assign hundreds = bcd[11:8];
    
    // Instantiate the Unit Under Test (UUT)
    bin2bcd uut (
        .bin(bin), 
        .bcd(bcd)
    );


    initial begin
    //A for loop for checking all the input combinations.
        for(i = 0; i<256; i = i+1) begin
            bin = i; 
            #10; //wait for 10 ns.
        end 
    end
      
endmodule
