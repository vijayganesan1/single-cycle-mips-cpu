`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:14 03/23/2023 
// Design Name: 
// Module Name:    RegFlie 
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
module RegFlie(rst, clk, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);

	input clk;
	input rst;
	input RegWrite;
	
	input [4:0] ReadReg1;
	input [4:0] ReadReg2;
	input [4:0] WriteReg;
	input [31:0] WriteData;
		
	output [31:0] ReadData1, ReadData2;
	
	reg [31:0] registers [31:0];
	
	assign ReadData1 = registers[ReadReg1];
	assign ReadData2 = registers[ReadReg2];
	
	always @(posedge clk, negedge rst) 
	begin
		if (rst == 0) begin
		registers[8]=1;   //$t0=1
		registers[9]=3;  //$t1=3
		registers[10]=2;  //$t2=2
		registers[16]=0;  //$s0=0
		end
		else if (RegWrite == 1)
			registers[WriteReg] <= WriteData;			
	end	
endmodule
