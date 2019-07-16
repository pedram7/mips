module IFIDreg(input clock , input [31:0]  instruction ,PcP4, output reg[31:0]IFIDoutInstruction ,IFIDoutPCP4);
  
  always@ (posedge clock)
  begin
   IFIDoutPCP4 = PcP4;
   IFIDoutInstruction = instruction;
  end
  
endmodule