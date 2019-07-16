module StageMEM(

  input zero,lt,gt,Branch ,MemWrite,MemRead, input[31:0] AluResult , readData2,
  output[31:0] MemReadData , address , output PcSrc);

  assign address = AluResult;
  assign PcSrc = Branch & zero;

  DMemBank memory( MemRead,  MemRead, AluResult , readData2 , MemReadData);

endmodule
