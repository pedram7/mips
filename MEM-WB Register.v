module MEMWBReg(
input clock ,

input MemToReg,RegWrite,input[31:0] MemReadData , address,input[4:0] writeReg,

output reg MEMWBOutMemToReg,MEMWBOutRegWrite , output reg [31:0]  MEMWBOutMemReadData , MEMWBOutaddress , output reg[4:0] MEMWBOutwriteReg
);

always @ ( posedge clock ) begin
MEMWBOutMemToReg = MemToReg;
MEMWBOutRegWrite = RegWrite;
MEMWBOutMemReadData = MemReadData;
MEMWBOutaddress = address;
MEMWBOutwriteReg =writeReg;
end
endmodule
