module StageWB(input[31:0] MemReadData , AluResult, input MemtoReg , output[31:0] writeData);
  
  MUX2 MemToRegMUX(AluResult ,MemReadData,MemtoReg,writeData);
  
endmodule
