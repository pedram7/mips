module my_processor(input clock);

  wire myCpuMEMtIFPcSelect;
  wire[31:0] myCpuPcBrAddress , myCpuIFinstruction , myCpuIFpcp4 ,  myCpuIFIDtIDinstruction , myCpuIFIDpcp4 , myCpuWBtIDwriteData;
  wire myCpuMEMWBtIDRegWrite;
  wire[4:0] myCpuMEMWBtIDWriteRegister;


  wire[31:0] myCpuIDtIDEXsignExtendedInstruction,myCpuIDtIDEXreadData1,myCpuIDtIDEXreadData2;
  wire[4:0] myCpuIDtIDEXRegDst0,myCpuIDtIDEXRegDst1;
  //control unit outputs
  wire myCpuIDtIDEXaluOp ,myCpuIDtIDEXRegDstSelect,myCpuIDtIDEXJump,myCpuIDtIDEXBranch,myCpuIDtIDEXMemRead,myCpuIDtIDEXMemToReg,myCpuIDtIDEXMemWrite,myCpuIDtIDEXAluSrcSelect,myCpuIDtIDEXRegWrite;

  wire[1:0]myCpuIDtIDEXALUOp;
  wire[5:0] myCpuIDtIDEXopCode;

    wire[31:0] myCpuIDEXsignExtendedInstruction,myCpuIDEXreadData1,myCpuIDEXreadData2;
    wire[4:0] myCpuIDEXRegDst0,myCpuIDEXRegDst1;
    //control unit outputs
    wire myCpuIDEXaluOp ,myCpuIDEXRegDstSelect,myCpuIDEXJump,myCpuIDEXBranch,myCpuIDEXMemRead,myCpuIDEXMemToReg,myCpuIDEXMemWrite,myCpuIDEXAluSrcSelect,myCpuIDEXRegWrite;wire[1:0]myCpuIDEXALUOp;wire[5:0] myCpuIDEXopCode;

    wire myCpuEXtEXMEMzero,myCpuEXtEXMEMlt,myCpuEXtEXMEMgt; wire[31:0] myCpuEXtEXMEMALUresult,myCpuEXtEXMEMAddResult,myCpuEXtEXMEMSecondReadData ; wire[4:0] myCpuEXtEXMEMwriteReg;

    wire myCpuEXMEMtMEMzero,myCpuEXMEMtMEMlt,myCpuEXMEMtMEMgt; wire[31:0] myCpuEXMEMtMEMALUresult,myCpuEXMEMtMEMAddResult,myCpuEXMEMtMEMSecondReadData ; wire[4:0] myCpuEXMEMtMEMwriteReg;

    wire myCpuEXMEMtMEMBranch,myCpuEXMEMtMEMMemWrite,myCpuEXMEMtMEMMemRead,myCpuEXMEMtMEMMemToReg,myCpuEXMEMtMEMRegWrite;

  wire[31:0] myCpuMEMtMEMWBMemReadData , myCpuMEMtMEMWBaddress;

  wire myCpuMEMWBtWBMemToReg ; wire [31:0] myCpuMEMWBtWBMemReadData , myCpuMEMWBtWBaddress;

  StageIF ifs(
    //inputs
    clock,myCpuMEMtIFPcSelect,myCpuPcBrAddress,
    //outputs
    myCpuIFinstruction,myCpuIFpcp4);

  IFIDreg if_id_r(
    //inputs
    clock , myCpuIFinstruction , myCpuIFpcp4,
    //outputs
    myCpuIFIDtIDinstruction,myCpuIFIDpcp4);

  StageID ids(
    //inputs
    clock ,myCpuMEMWBtIDRegWrite,myCpuMEMWBtIDWriteRegister, myCpuIFIDtIDinstruction,myCpuWBtIDwriteData,
    //ouputs
    myCpuIDtIDEXsignExtendedInstruction,myCpuIDtIDEXreadData1,myCpuIDtIDEXreadData2,myCpuIDtIDEXRegDst0,myCpuIDtIDEXRegDst1,myCpuIDtIDEXRegDstSelect,myCpuIDtIDEXJump,myCpuIDtIDEXBranch,myCpuIDtIDEXMemRead,myCpuIDtIDEXMemToReg,myCpuIDtIDEXMemWrite,myCpuIDtIDEXAluSrcSelect,myCpuIDtIDEXRegWrite,myCpuIDtIDEXALUOp,myCpuIDtIDEXopCode);

  IDEXreg id_ex_r(
    //inputs
    clock,myCpuIDtIDEXsignExtendedInstruction,myCpuIDtIDEXreadData1,myCpuIDtIDEXreadData2,myCpuIFIDpcp4,myCpuIDtIDEXRegDst0,myCpuIDtIDEXRegDst1,myCpuIDtIDEXRegDstSelect,myCpuIDtIDEXJump,myCpuIDtIDEXBranch,myCpuIDtIDEXMemRead,myCpuIDtIDEXMemToReg,myCpuIDtIDEXMemWrite,myCpuIDtIDEXAluSrcSelect,myCpuIDtIDEXRegWrite,myCpuIDtIDEXALUOp,myCpuIDtIDEXopCode,

    //outputs
    myCpuIDEXsignExtendedInstruction,myCpuIDEXreadData1,myCpuIDEXreadData2,myCpuIFIDpcp4,myCpuIDEXRegDst0,myCpuIDEXRegDst1,myCpuIDEXRegDstSelect,myCpuIDEXJump,myCpuIDEXBranch,myCpuIDEXMemRead,myCpuIDEXMemToReg,myCpuIDEXMemWrite,myCpuIDEXAluSrcSelect,myCpuIDEXRegWrite,myCpuIDEXALUOp,myCpuIDEXopCode

    );
  StageEX exs(

    //inputs
    myCpuIFIDpcp4,myCpuIDEXreadData1,myCpuIDEXreadData2,myCpuIDEXsignExtendedInstruction,myCpuIDEXRegDst0,myCpuIDEXRegDst1,myCpuIDEXRegDstSelect,myCpuIDEXAluSrcSelect,myCpuIDEXALUOp,myCpuIDEXopCode,
    //outputs
    myCpuEXtEXMEMzero,myCpuEXtEXMEMlt,myCpuEXtEXMEMgt ,myCpuEXtEXMEMALUresult,myCpuEXtEXMEMAddResult,myCpuEXtEXMEMSecondReadData , myCpuEXtEXMEMwriteReg

    );
  EXMEMReg ex_mem_r(

    //inputs
    clock,myCpuEXtEXMEMzero,myCpuEXtEXMEMlt,myCpuEXtEXMEMgt,myCpuIDEXBranch,myCpuIDEXMemWrite,myCpuIDEXMemRead,myCpuIDEXMemToReg,myCpuIDEXRegWrite,myCpuEXtEXMEMALUresult,myCpuEXtEXMEMAddResult,myCpuEXtEXMEMSecondReadData,myCpuEXtEXMEMwriteReg,
    //outputs
    myCpuEXMEMtMemzero,myCpuEXMEMtMEMlt,myCpuEXMEMtMEMgt,myCpuEXMEMtMEMBranch,myCpuEXMEMtMEMMemWrite,myCpuEXMEMtMEMMemRead,myCpuEXMEMtMEMMemToReg,myCpuEXMEMtMEMRegWrite,myCpuEXMEMtMEMALUresult,myCpuPcBrAddress,myCpuEXMEMtMEMSecondReadData,myCpuEXMEMtMEMwriteReg

    );



  StageMEM mems(

    //inputs
    myCpuEXMEMtMemzero,myCpuEXMEMtMEMlt,myCpuEXMEMtMEMgt,myCpuEXMEMtMEMBranch,myCpuEXMEMtMEMMemWrite,myCpuEXMEMtMEMMemRead,myCpuEXMEMtMEMALUresult,myCpuEXMEMtMEMSecondReadData,
    //outputs
    myCpuMEMtMEMWBMemReadData , myCpuMEMtMEMWBaddress,myCpuMEMtIFPcSelect
    );
  MEMWBReg mem_wb_r(
    clock,
    //inputs
    myCpuEXMEMtMEMMemToReg,myCpuEXMEMtMEMRegWrite,  myCpuMEMtMEMWBMemReadData , myCpuMEMtMEMWBaddress,myCpuEXMEMtMEMwriteReg,

    myCpuMEMWBtWBMemToReg,myCpuMEMWBtIDRegWrite, myCpuMEMWBtWBMemReadData , myCpuMEMWBtWBaddress,myCpuMEMWBtIDWriteRegister
    );
  StageWB wbs(
  //inputs
   myCpuMEMWBtWBMemReadData,myCpuMEMWBtWBaddress,myCpuMEMWBtWBMemToReg,
  //outputs
  myCpuWBtIDwriteData);

endmodule




module test();
  reg clock=0;
  integer i=0;
  my_processor cpu(clock);
  initial begin
    for(i=0; i<30; i = i+1)begin
      #10 clock = ~clock;
    end
  end
endmodule
