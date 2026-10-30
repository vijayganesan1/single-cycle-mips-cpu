`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:52 03/23/2023 
// Design Name: 
// Module Name:    mux1 
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
module mux1(rt, rd, RegDst, WriteReg);

	input [4:0] rt;
	input [4:0] rd;
	input RegDst;
	
	output reg [4:0] WriteReg;

	always @ (*) 
	begin
     if(RegDst==0) 
        WriteReg<=rt;
     else
        WriteReg<=rd;
	end
endmodule
