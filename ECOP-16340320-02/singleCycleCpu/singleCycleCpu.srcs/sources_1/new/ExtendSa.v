`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:24:11
// Design Name: 
// Module Name: ExtendSa
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


module Extend_Sa(Sa, ExtendSa);
input [4:0] Sa;
output [31:0] ExtendSa;
assign ExtendSa[31:5] =0;
assign ExtendSa = Sa;
endmodule
