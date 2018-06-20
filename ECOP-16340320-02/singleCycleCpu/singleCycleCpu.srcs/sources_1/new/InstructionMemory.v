`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 00:49:30
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(InsMemRW,IDataIn,IAddr,Out);
input InsMemRW;
input [31:0] IDataIn,IAddr;
output reg [31:0] Out;
integer i;
reg [7:0] Memory[0:99];
initial begin
    $readmemb("C:/Users/Administrator/singleCycleCpu/CPUInsMem.txt",Memory);
    for(i=0;i<24;i=i+1)  $display("%h%h%h%h",Memory[i*4+0],Memory[i*4+1],Memory[i*4+2],Memory[i*4+3]);
end

always @(IAddr or InsMemRW) begin
    begin
        Out[31:24]=Memory[IAddr];
        Out[23:16]=Memory[IAddr+1];
        Out[15:8]=Memory[IAddr+2];
        Out[7:0]=Memory[IAddr+3];
     end
end

endmodule
