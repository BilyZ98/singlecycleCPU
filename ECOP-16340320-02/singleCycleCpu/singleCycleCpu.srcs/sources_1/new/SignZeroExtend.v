`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:38:19
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(Immediate,ExtSel, ExOut );
input [15:0] Immediate;
input ExtSel;
output [31:0] ExOut;

assign ExOut[15:0] = Immediate[15:0];
assign ExOut[31:16] = (ExtSel == 1 && (Immediate[15]==1))?16'hFFFF:16'h0000;
endmodule
