module MUX2(input[31:0] a , b ,input s , output[31:0] m2out);
  assign m2out = s?b:a;
endmodule

module fivebitMUX2(input[4:0] a , b ,input s , output[4:0] m2out);
  assign m2out = s?b:a;
endmodule
