`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:04:31
// Design Name: 
// Module Name: NextPC
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


module NextPC( PC, Immediate, JumpPC, PCSrc, NextPC,Reset);
input Reset;
input [31:0] PC, Immediate,JumpPC;
input [1:0] PCSrc;
output reg [31:0] NextPC;

always @( PCSrc or JumpPC or Immediate) begin
    if(Reset ==0) NextPC=PC+4;
     begin
        case(PCSrc)
            2'b00: NextPC = PC+4;
            2'b01: NextPC = PC+4 +(Immediate<<2);
            2'b10: begin
                NextPC = JumpPC;
            end
            2'b11:NextPC = PC;
            endcase
    end
end
endmodule
