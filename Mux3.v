`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:01 03/23/2023 
// Design Name: 
// Module Name:    Mux3 
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
module Mux3 (ReadData, ALUOut, MemtoReg, WriteData_Reg);

	input [31:0] ReadData;
	input [31:0] ALUOut;
	input MemtoReg;	
	
	output reg [31:0] WriteData_Reg;
	
	always @(*) begin
		if(MemtoReg==0)
		 WriteData_Reg <= ALUOut ;
		else
		 WriteData_Reg <= ReadData;
	end
endmodule