module StageID(
input clock,
input RegWrite,
input[4:0] writeReg,
input[31:0] instruction , writeData,
output wire[31:0] signExtendedInstruction,readData1,readData2,
output[4:0] RegDst0,RegDst1,
//control unit outputs
output RegDstSelect,Jump,Branch,MemRead,MemToReg,MemWrite,AluSrcSelect,RegWriteOut,output[1:0]ALUOp,output[5:0] opCode
);

  //outputs assign
  assign signExtendedInstruction = {{16{instruction[15]}},instruction[15:0]};
  assign RegDst1 = instruction[15:11];
  assign RegDst0 = instruction[20:16];
  assign opCode = instruction[31:26];

  //reg input wires
  wire[4:0] readreg1 = instruction[25:21];
  wire[4:0] readreg2 = instruction[20:16];

  wire BranchNeqOut;
  RegFile myRegFile(clock , readreg1, readreg2, writeReg, writeData, RegWrite, readData1, readData2);

  ControlUnit myCU (instruction[31:26],RegDstSelect,Branch,BranchNeqOut,Jump,MemRead,MemWrite,MemToReg,ALUOp,AluSrcSelect,RegWriteOut);

endmodule



module ControlUnit(input[5:0] opCode, output reg regDst,BranchEq, BranchNeq , jump, memRead,memWrite,memToReg,
 output reg [1:0]ALUop, output reg  ALUsrc, RegWrite);

always @(opCode)begin
	if(opCode == 6'b000000)begin //R_format
		regDst = 1'b1;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 2'b10;
		memWrite = 1'b0;
		ALUsrc = 1'b0;
		RegWrite = 1'b1;
	end
	else if(opCode == 6'b001000)begin //addi
  $display("addi");
		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b11;
		memWrite = 1'b0;
		ALUsrc = 1'b1;
		RegWrite = 1'b1;
	end
	else if(opCode == 6'b001100)begin //andi
  $display("andi");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b11;
		memWrite = 1'b0;
		ALUsrc = 1'b1;
		RegWrite = 1'b1;
	end
	else if(opCode == 6'b001101)begin //ori
  $display("ori");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b11;
		memWrite = 1'b0;
		ALUsrc = 1'b1;
		RegWrite = 1'b1;
	end


	else if(opCode == 6'b001010)begin //slti
  $display("slti");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b11;
		memWrite = 1'b0;
		ALUsrc = 1'b1;
		RegWrite = 1'b1;
	end

	else if(opCode == 6'b100011)begin //lw
  $display("lw");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b1;
		memToReg = 1'b1;
		ALUop = 3'b00;
		memWrite = 1'b0;
		ALUsrc = 1'b1;
		RegWrite = 1'b1;
	end
	else if(opCode == 6'b101011)begin //st
  $display("st");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b00;
		memWrite = 1'b1;
		ALUsrc = 1'b1;
		RegWrite = 1'b0;
	end
	else if(opCode == 6'b000100)begin //breq
  $display("breq");

		regDst = 1'b0;
		BranchEq = 1'b1;
		BranchNeq = 1'b0;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b01;
		memWrite = 1'b0;
		ALUsrc = 1'b0;
		RegWrite = 1'b0;
	end
	else if(opCode == 6'b000101)begin //brneq
  $display("brneq");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b1;
		jump = 1'b0;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b01;
		memWrite = 1'b0;
		ALUsrc = 1'b0;
		RegWrite = 1'b0;
	end
	else if(opCode == 6'b000010)begin //jump
  $display("jump");

		regDst = 1'b0;
		BranchEq = 1'b0;
		BranchNeq = 1'b0;
		jump = 1'b1;
		memRead = 1'b0;
		memToReg = 1'b0;
		ALUop = 3'b01;
		memWrite = 1'b0;
		ALUsrc = 1'b0;
		RegWrite = 1'b0;
	end
end
endmodule

