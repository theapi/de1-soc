

module DE1_SOC(

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,


      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

      ///////// SW /////////
      input       [9:0]  SW

);

    // The BCD code generted from the binary input.
    wire [11:0] bcd;
    
    // Read the first 8 switches as binary inputs.
    bin2bcd bin2bcd(
        .bin(SW[7:0]),
        .bcd()
    );

    // Ones
    seven_segment seg0(
        .val(bcd[3:0]),
        .out(HEX0)
    );

    // Tens
    seven_segment seg1(
        .val(bcd[7:4]),
        .out(HEX1)
    );

    // Hundreds
    seven_segment seg2(
        .val(bcd[11:8]),
        .out(HEX2)
    );

    seven_segment seg3(
        .val(4'hf),
        .out(HEX3)
    );

    seven_segment seg4(
        .val(4'hf),
        .out(HEX4)
    );

    seven_segment seg5(
        .val(4'hf),
        .out(HEX5)
    );


endmodule

