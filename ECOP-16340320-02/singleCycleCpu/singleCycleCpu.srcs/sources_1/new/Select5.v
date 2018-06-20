`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:30:52
// Design Name: 
// Module Name: Select5
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


module Select5(
    input Select,
    input [4:0] DataA, DataB,
    output [4:0] Data
    );
    assign Data = Select?DataB:DataA;
endmodule
