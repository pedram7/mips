module StageEX(input[31:0] PcP4 , readData1 , readData2 ,signExtendedInstruction , input[4:0] RegDst0 , RegDst1 ,input RegDstSelect , AluSrcSelect , input[1:0] ALUOp , input[5:0] opcode , output zero,lt,gt , output[31:0] ALUresult,AddResult,SecondReadData , output[4:0] writeReg);

  wire[31:0] data2;
  wire[3:0] opration;
  aluControl myAluControl(signExtendedInstruction[5:0],ALUOp, opcode,opration);
  MUX2 AluSrcMUX(readData2 ,signExtendedInstruction, AluSrcSelect , data2);
  ALU myALU(readData1,data2 , opration, ALUresult, zero,lt,gt);
  fivebitMUX2 WriteRegMUX(RegDst0,RegDst1 ,RegDstSelect,writeReg);

  assign SecondReadData = readData2;
  assign AddResult = (signExtendedInstruction<<2) + PcP4;

endmodule
