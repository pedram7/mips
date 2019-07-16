//memory unit
module IMemBank(input memread, input [7:0] address, output reg [31:0] readdata);

  reg [31:0] mem_array [63:0];

  integer i;
  initial begin
      for (i=0; i<64; i=i+1)
        mem_array[i]=i*10;


      i=32; //initial
      mem_array[32] = 32'b10001100111010000000000000000011;
      /*000000
      00111
      01000
      01001
      00000
      100000*/
      for(i=32;i<=42;i=i+4)begin
        // instructions ??? mem_array[i] =
      end
  end

  always@(memread, address, mem_array[address])
  begin
    if(memread)begin
      readdata=mem_array[address];
    end
  end

endmodule
