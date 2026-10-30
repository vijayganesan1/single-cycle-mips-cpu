`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:12 03/23/2023 
// Design Name: 
// Module Name:    Mux2 
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
module Mux2 (ALUSrc, ReadData2, Extend32, ALU_B);

	input ALUSrc;
	input [31:0] ReadData2;
	input [31:0] Extend32;	
	
	output reg [31:0] ALU_B;
	
	always @(*) 
	begin
	 if(ALUSrc==0)
	  ALU_B <= ReadData2 ;
	 else
	 ALU_B <= Extend32;

	end
endmodule