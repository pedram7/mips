module StageIF(input clock,input PCselect , input[31:0] PcBranchAddress , output[31:0] instruction , output[31:0] PcPlus4);

  wire memread = 1'b1;
  wire [31:0] PCsource;
  //PC
  reg[31:0] PC = 32'd32; // initial instr address?

  //PCMUX
  wire[31:0]PCsourceMUXin[1:0];
  assign PCsourceMUXin[0] = PC + 4;
  assign PCsourceMUXin[1] = PcBranchAddress;
  MUX2 PCsourceMUX(PCsourceMUXin[0],PCsourceMUXin[1],PcSelect , PCsrc);


  //Output
  assign PcPlus4 = PC + 4;

  IMemBank instructionMemory(memread , PC , instruction);

always @ ( posedge clock ) begin
  if(PCsrc >= 32'd0)
    PC = PCsrc;
  else
    PC = PC+4;
end

endmodule
