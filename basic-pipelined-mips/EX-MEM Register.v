module EXMEMReg(

  input clock,

  input zero,lt,gt,Branch ,MemWrite,MemRead,MemToReg,RegWrite, input[31:0] ALUresult,AddResult,SecondReadData , input[4:0] writeReg,

  output reg EXMEMOutzero,EXMEMOutlt,EXMEMOutgt,EXMEMOutBranch ,EXMEMOutMemWrite,EXMEMOutMemRead,EXMEMOutMemToReg,EXMEMOutRegWrite, output reg[31:0] EXMEMOutALUresult,EXMEMOutAddResult,EXMEMOutSecondReadData , output reg[4:0] EXMEMOutwriteReg

  );


always @ ( posedge clock ) begin
EXMEMOutzero = zero;
EXMEMOutlt = lt;
EXMEMOutgt = gt;
EXMEMOutBranch = Branch;
EXMEMOutMemWrite = MemWrite;
EXMEMOutMemRead = MemRead;
EXMEMOutMemToReg=MemToReg;
EXMEMOutRegWrite=RegWrite;
EXMEMOutALUresult = ALUresult;
EXMEMOutAddResult = AddResult;
EXMEMOutSecondReadData = SecondReadData;
EXMEMOutwriteReg = writeReg;
end

endmodule
