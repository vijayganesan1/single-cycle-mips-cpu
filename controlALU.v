`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:39 03/23/2023 
// Design Name: 
// Module Name:    controlALU 
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
module controlALU (
	input [1:0] alu_op,
	input [5:0] funct,
	output reg [2:0] Control
	);
	always @(alu_op, funct) begin
	if(alu_op == 2'b00)
		Control <= 3'b010;    //LW and SW use add
	else if(alu_op == 2'b01)
		Control <= 3'b110;		// branch use subtract
	else
		case(funct)
			6'b100000: Control <= 3'b010; //add
			6'b100010: Control <= 3'b110; //subtract		
			6'b100100: Control <= 3'b000; //and	
			6'b100101: Control <= 3'b001; //or	
			6'b101010: Control <= 3'b111; //slt
		endcase
	end
endmodule