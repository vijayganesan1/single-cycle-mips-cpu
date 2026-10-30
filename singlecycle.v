`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:38 03/23/2023 
// Design Name: 
// Module Name:    singlecycle 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module singlecycle(
    input clk,
    input rst,
    output [31:0] ALUresult
);

wire [31:0] instruction;
wire [31:0] reg_write_data;
wire RegDst, RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch;
wire [1:0] ALUOp;
wire [4:0]  WriteReg;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [31:0] Extend32;
wire [31:0] ALU_B;
wire [2:0] ALUcontrol;
wire Zero;
wire [31:0] ReadData;


//Instruction fetch unit
programcounter pc_0(clk, rst,instruction);
	
//generation of main control signals
MainControl main_control_0(instruction[31:26], RegDst, RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch, ALUOp);

//MUX with RegDst as select line	
mux1 mux1_0(instruction[20:16], instruction[15:11], RegDst, WriteReg);

//register file
RegFlie regfile_0(rst, clk, RegWrite, instruction[25:21], instruction[20:16], WriteReg, reg_write_data, ReadData1, ReadData2);


//sign extension module	
SignExtend sign_extend_0(instruction[15:0], Extend32);

//MUX with ALUSrc as select line	
Mux2 mux2_0(ALUSrc, ReadData2,Extend32, ALU_B);

//generation of control signals for ALU
controlALU alu_control_0(ALUOp, instruction[5:0], ALUcontrol);
	
//ALU
ALU alu_0(ReadData1, ALU_B, ALUcontrol, ALUresult, Zero);
	
//DataMemory
DataMemory  data_memory_0(rst, clk, ALUresult, MemWrite, MemRead, ReadData2, ReadData);
	
//MUX with MemtoReg as select line
Mux3 mu3_0(ReadData, ALUresult, MemtoReg, reg_write_data);

	

endmodule
