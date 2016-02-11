

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

seven_segment seg0(
    .val(4'h5),
    .out(HEX0)
);

seven_segment seg1(
    .val(4'h4),
    .out(HEX1)
);

seven_segment seg2(
    .val(4'h3),
    .out(HEX2)
);

seven_segment seg3(
    .val(4'h2),
    .out(HEX3)
);

seven_segment seg4(
    .val(4'h1),
    .out(HEX4)
);

seven_segment seg5(
    .val(4'hf),
    .out(HEX5)
);


endmodule

