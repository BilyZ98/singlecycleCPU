`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:52:52
// Design Name: 
// Module Name: SingleCycleCpu
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

//module SingleCycleCPU(CLK,Reset,curPC,nextPC,ReadData1,ReadData2,Rs,Rt,Rd,Sa,Result,DataOut,OpCode,InsOut,Immediate,A,B,Zero,Sign);
module SingleCycleCPU(CLK,Reset,curPC,nextPC,ReadData1,ReadData2,Rs,Rt,Result,DataOut,InsOut,A,B,ALUOp,PCSrc);
input CLK,Reset;
output [31:0] curPC,nextPC,ReadData1,ReadData2;//readdata1寄存器组的输出1，对应的rs的地址，readdata
output [4:0] Rs,Rt;
output [31:0] Result,DataOut;//result->ALU output, DataOut->DataMemory's output
output [31:0] InsOut;
output [31:0] A,B;
output [2:0] ALUOp;
output [1:0] PCSrc;

wire [2:0] ALUOp;
wire [1:0] PCSrc;  
wire [31:0] PC,IAddr,ExtOut, DataOut,IDataIn,Out,jumpPC,WriteData,result,dataout,readdata1,readdata2,tempreaddata2;
wire [31:0] ExtendSa,InA,InB;
wire [15:0] immediate;
wire [25:0] address;  
wire [4:0] rs, rt, rd,sa,WriteReg;
wire PCWre,ALUSrcA,ALUSrcB, DBDataSrc, RegWre, InsMemRW,RD,WR, RegDst, ExtSel;
wire zero;

assign IDataIn=0;

PC pc(.CLK(CLK),.Reset(Reset),.NextPC(PC),.PCWre(PCWre),.IAddr(IAddr));
//module module PC(CLK, Reset, PCWre, NextPC, IAddr);
InstructionMemory ins(.InsMemRW(InsMemRW),.IDataIn(IDataIn),.IAddr(IAddr),.Out(Out));
//module module InstructionMemory(InsMemRW,IDataIn,IAddr,Out);
ControlUnit control(.Op(Out[31:26]), .zero(zero),.PCWre(PCWre),.ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .DBDataSrc(DBDataSrc), .RegWre(RegWre), .InsMemRW(InsMemRW),.mRD(RD),.mWR(WR), .RegDst(RegDst), .ExtSel(ExtSel), .PCSrc(PCSrc),.ALUOp(ALUOp)); 
//modulemodule ControlUnit(Op, zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel, PCSrc, ALUOp );
Select5 selectreg(.Select(RegDst),.DataA(Out[20:16]),.DataB(Out[15:11]),.Data(WriteReg));
RegisterFile registerfile(.ReadReg1(Out[25:21]),.ReadReg2(Out[20:16]),.WriteData(WriteData),.WriteReg(WriteReg),.WE(RegWre),.CLK(CLK),.ReadData1(readdata1),.ReadData2(tempreaddata2));
//module RegisterFile(ReadReg1,ReadReg2,WriteData,WriteReg,WE,CLK,Reset,ReadData1,ReadData2);
Select32 tempselect(.Select(0),.DataA(tempreaddata2),.DataB(tempreaddata2),.Data(readdata2));
Extend_Sa saExtend(.Sa(Out[10:6]),.ExtendSa(ExtendSa));
//module Extend_Sa(Sa,ExtendSa);
Select32 selectA(.Select(ALUSrcA),.DataA(readdata1),.DataB(ExtendSa),.Data(InA));
SignZeroExtend ext(.Immediate(Out[15:0]), .ExtSel(ExtSel),.ExOut(ExtOut));
//module SignZeroExtend(Immediate,ExtSel,Sign,ExtOut);
Select32 selectB(.Select(ALUSrcB),.DataA(readdata2),.DataB(ExtOut),.Data(InB));
ALU alu(.InA(InA),.InB(InB),.ALUOp(ALUOp),.result(result),.zero(zero)); 
//module ALU(InA,InB,ALUOp,Result,Zero,Sign);
JumpPC jump(.PC(IAddr),.InAddr(Out[25:0]),.Out(jumpPC));
//module JumpPC(PC,InAddress,Out);
NextPC next(.PC(IAddr),.Immediate(ExtOut),.JumpPC(jumpPC),.PCSrc(PCSrc),.NextPC(PC),.Reset(Reset));
//module NextPC(Reset,PC,Immediate,JumpPC,PCSrc,NextPC );
DataMemory data(.CLK(CLK),.RD(RD),.WR(WR),.DAddr(result),.DataIn(readdata2),.DataOut(dataout));
//module DataMemory(CLK,RD,WR,DAddr,DataIn,DataOut);
Select32 selectData(.Select(DBDataSrc),.DataA(result),.DataB(dataout),.Data(WriteData));

assign curPC=IAddr;
assign nextPC=PC;
assign ReadData1=readdata1;
assign ReadData2=tempreaddata2;
assign Result=result;
assign DataOut=dataout;
//assign OpCode=Out[31:26];
assign Rs=Out[25:21];
assign Rt=Out[20:16];
//assign Rd=Out[15:11];
//assign Sa=Out[10:6];
//assign PCsrc=PCSrc;
assign InsOut=Out;
//assign Immediate=Out[15:0];
assign A=InA;
assign B=InB;
//assign Zero=zero;
//assign Sign=sign;
endmodule
