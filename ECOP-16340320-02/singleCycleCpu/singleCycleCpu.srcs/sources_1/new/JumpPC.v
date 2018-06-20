`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 17:48:08
// Design Name: 
// Module Name: JumpPC
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

//这是为了jump 指令
module JumpPC(PC, InAddr, Out);
input [31:0] PC;
input [25:0] InAddr;
output reg [31:0] Out;

always @(PC or InAddr)
begin
    Out[31:28]=PC[31:28];
    Out[27:2] = (InAddr>>2);
    Out[1:0] = 0;
end
endmodule
