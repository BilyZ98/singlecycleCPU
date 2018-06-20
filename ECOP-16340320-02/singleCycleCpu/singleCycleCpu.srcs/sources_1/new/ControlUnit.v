`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 00:35:43
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(Op, zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel, PCSrc, ALUOp );
input [5:0] Op;
input zero;
output PCWre,ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel;
output [1:0] PCSrc;
output [2:0] ALUOp;

assign PCWre = (Op == 6'b111111)?0:1;
assign ALUSrcA = (Op== 6'b011000)?1:0;
assign ALUSrcB = ((Op == 6'b000001) || (Op == 6'b010000) || (Op == 6'b011011) || (Op ==6'b100110) || (Op == 6'b100111) ) ? 1:0;
assign DBDataSrc = (Op == 6'b100111)?1:0;
assign RegWre = ((Op == 6'b110000) || (Op == 6'b110001) || (Op == 6'b100110) || (Op == 6'b111111) ||(Op == 6'b111000)) ? 0: 1;
assign InsMemRW = 0;
assign mRD = (Op == 6'b100111) ?1:0;
assign mWR  = (Op == 6'b100110) ?1:0;
assign RegDst = ((Op == 6'b000001) || (Op==6'b010000) || (Op == 6'b100111) || (Op==6'b011011))?0:1;
assign ExtSel = (Op == 6'b010000)?0:1;
assign PCSrc[0] = ((Op == 6'b110000 && zero == 1) || (Op == 6'b110001 && zero == 0) || (Op==6'b111111)) ?1:0;
assign PCSrc[1] = ((Op == 6'b111000) || (Op == 6'b111111)) ?1:0;
assign ALUOp[2] = ((Op == 6'b010001) || (Op == 6'b010011) || (Op == 6'b010100) || (Op == 6'b010101) ||(Op == 6'b011100)||(Op == 6'b110000) ||(Op == 6'b110001) ||(Op==6'b011011))?1:0;
//assign ALUOp[2]=((Op==6'b010001)||(Op==6'b010011)||(Op==6'b010100)||(Op==6'b010101)||(Op==6'b011100)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;
assign ALUOp[1] = ((Op == 6'b010000) ||(Op == 6'b010010) ||(Op==6'b010100) ||(Op==6'b010101) |||(Op==6'b011000) ||(Op==6'b110000) ||(Op==6'b110001) ||(Op==6'b011011))?1:0;
//assign ALUOp[1]=((Op==6'b010000)||(Op==6'b010010)||(Op==6'b010100)||(Op==6'b010101)||(Op==6'b011000)||(Op==6'b011100)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;
assign ALUOp[0] =((Op == 6'b000010) || (Op == 6'b010000) ||(Op == 6'b010010) ||(Op == 6'b010100) ||(Op == 6'b010101) || (Op==6'b110000) ||(Op==6'b110001))?1:0;
//assign ALUOp[0]=((Op==6'b000010)||(Op==6'b010000)||(Op==6'b010010)||(Op==6'b010100)||(Op==6'b010101)||(Op==6'b110000)||(Op==6'b110001)||(Op==6'b110010))?1:0;
endmodule
