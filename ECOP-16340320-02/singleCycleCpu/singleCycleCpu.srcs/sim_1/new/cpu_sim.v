`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 19:29:38
// Design Name: 
// Module Name: cpu_sim
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


module cpu_sim();
    reg Reset;
    reg CLK;
    wire [31:0] curPC,nextPC;
    wire [31:0] ReadData1,ReadData2,Result,DataOut;
    wire [4:0] Rs,Rt,Rd,Sa;
    wire [31:0] InsOut;
    wire [5:0] opCode;
    wire [15:0] Immediate;
    wire [25:0] Address;
    wire [31:0] InA,InB,JumpPC;
    wire [2:0] ALU;
    wire Zero;
    wire [1:0] pcSrc;

//module SingleCycleCPU(CLK,Reset,curPC,nextPC,ReadData1,ReadData2,Rs,Rt,Rd,Sa,Result,DataOut);   
    SingleCycleCPU cpu(
        .CLK(CLK),
        .Reset(Reset),
        .curPC(curPC),
        .nextPC(nextPC),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .Rs(Rs),
        .Rt(Rt),
//        .Rd(Rd),
//        .Sa(Sa),
        .Result(Result),
        .DataOut(DataOut),
//        .OpCode(opCode),
        .InsOut(InsOut),
//        .Immediate(Immediate),
        .A(InA),
        .B(InB),
        .ALUOp(ALU),
        .PCSrc(pcSrc)
//        .Zero(Zero),
//        .Sign(Sign)
    );
    
initial begin
    CLK = 0;
    Reset = 0;
    #50;
    begin 
        Reset=1;
        CLK=1;
    end
    forever #50 CLK=~CLK;
end
    
endmodule
