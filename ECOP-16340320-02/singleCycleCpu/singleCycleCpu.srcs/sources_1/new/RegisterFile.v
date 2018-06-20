`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 19:28:57
// Design Name: 
// Module Name: RegisterFile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegisterFile(ReadReg1, ReadReg2, WriteData, WriteReg, ReadData1, ReadData2, WE, CLK);
input[4:0] ReadReg1, ReadReg2, WriteReg;
input WE, CLK;
input [31:0] WriteData;
output [31:0] ReadData1, ReadData2;

integer i;
reg [31:0] Register[0:31];
initial begin
for(i=0;i<32;i=i+1)
    Register[i]=0;
end;

assign ReadData1 = Register[ReadReg1];
assign ReadData2 = Register[ReadReg2];

always @(negedge CLK)
begin
   if (WE ==1 && WriteReg!=0) Register[WriteReg]<=WriteData;
end
endmodule
