`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:15 03/23/2023 
// Design Name: 
// Module Name:    programcounter 
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
module programcounter(clock, reset, inst);

	input clock, reset;
	output [31:0]inst;
	reg [31:0] PC;
	
instmem i1(reset, PC, inst);
	
	
	
	
	always @(posedge clock, negedge reset) 
	begin
		if (reset == 0) 
			PC <= 0;
		else 
			PC <= PC + 4; 
	end
endmodule
