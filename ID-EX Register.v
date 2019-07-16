module IDEXreg(

input clock,
input[31:0] signExtendedInstruction,readData1,readData2,PcP4,
input[4:0] RegDst0,RegDst1,
//control inputs
input RegDstSelect,Jump,Branch,MemRead,MemToReg,MemWrite,AluSrcSelect,RegWrite,input[1:0]ALUOp,input[5:0] opCode,

output reg[31:0]  IDEXOutsignExtendedInstruction, IDEXOutreadData1, IDEXOutreadData2, IDEXOutPcP4,
output reg[4:0]  IDEXOutRegDst0, IDEXOutRegDst1,
//control outputs
output reg  IDEXOutRegDstSelect, IDEXOutJump, IDEXOutBranch, IDEXOutMemRead, IDEXOutMemToReg, IDEXOutMemWrite, IDEXOutAluSrcSelect, IDEXOutRegWrite,output reg[1:0] IDEXOutALUOp,output reg[5:0]  IDEXOutopCode
);

  always @(posedge clock)
  begin
    IDEXOutsignExtendedInstruction=signExtendedInstruction;
    IDEXOutreadData1=readData1;
    IDEXOutreadData2=readData2;
    IDEXOutPcP4=PcP4;
    IDEXOutRegDst0=RegDst0;
    IDEXOutRegDst1=RegDst1;
  //control inputs
    IDEXOutRegDstSelect=RegDstSelect;
    IDEXOutJump=Jump;
    IDEXOutBranch=Branch;
    IDEXOutMemRead=MemRead;
    IDEXOutMemToReg=MemToReg;
    IDEXOutMemWrite=MemWrite;
    IDEXOutAluSrcSelect=AluSrcSelect;
    IDEXOutRegWrite=RegWrite;
    IDEXOutALUOp=ALUOp;
    IDEXOutopCode=opCode;
  end

endmodule
