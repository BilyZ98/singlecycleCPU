`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 17:41:28
// Design Name: 
// Module Name: PC
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


module PC(CLK, Reset, PCWre, NextPC, IAddr);
input CLK, Reset;
input [31:0] NextPC;
input PCWre;
output reg[31:0] IAddr;

initial begin
    IAddr =0;
end

always @(posedge CLK or negedge Reset)
begin 

    if (Reset == 0) IAddr<=32'hFFFFFFFC;
    else if (PCWre == 1 || NextPC == 0) IAddr <= NextPC;
end
endmodule
