`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/19 22:57:51
// Design Name: 
// Module Name: ALU
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


module ALU(InA, InB, ALUOp, zero, result);
	input [31:0] InA,InB;
	input [2:0] ALUOp;
	output zero;
	output reg [31:0] result;

	always @(ALUOp or InA or InB)
		begin
			case(ALUOp)
				//A + B
				3'b000:begin
				    result = (InA + InB);
				    end				
				3'b001:begin
				    result = (InA - InB);	
				    end			    
			    3'b010:begin
			         result = (InB << InA);
			         end  
			    3'b011:begin
			         result = (InA | InB);
			         end
			     3'b100:begin
			         result = (InA & InB);
			         end
			     3'b101:begin
			         result = (InA < InB) ? 1: 0;
			         end
			     3'b110:begin
			         if(InA < InB && InA[31] == InB[31]) result = 1;
			         else if (InA[31] ==1 && InB[31] == 0) result =1;
			         else result =0;
			         end
			     3'b111:begin
			         result = InA ^ InB;
			         end
			     default:begin
			         result =0;
			         end
			     endcase
		end
		assign zero = (result == 0) ? 1:0;   			         			         			        				
endmodule
