`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:32 03/23/2023 
// Design Name: 
// Module Name:    instmem 
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
module instmem(reset, address, inst);

	input reset;
	input [31:0] address;
	
	output [31:0]	inst;
	
	reg [7:0] Mem [63:0]; //32 memory locations for instructions of width 32 bit
	always@(reset)
	begin
	
	if (reset ==0)
	begin
		Mem[0] = 8'b00000001; Mem[1] = 8'b00101000; Mem[2] = 8'b01010000; Mem[3] = 8'b00100000; //add $t2, $t1, $t0
		Mem[4] = 8'b00000001; Mem[5] = 8'b00101000; Mem[6] = 8'b01010000; Mem[7] = 8'b00100010; //sub $t2, $t1, $t0
		Mem[8] = 8'b00000001; Mem[9] = 8'b00101000; Mem[10] = 8'b01010000; Mem[11] = 8'b00100100; //and $t2, $t1, $t0
		Mem[12] = 8'b10101110; Mem[13] = 8'b00001001; Mem[14] = 8'b00000000; Mem[15] = 8'b00000100; //sw $t1, 4($s0)
        Mem[16] = 8'b10001110; Mem[17] = 8'b00001010; Mem[18] = 8'b00000000; Mem[19] = 8'b00000100; //lw $t2, 4($s0)
        Mem[20] = 8'b00000001; Mem[21] = 8'b00101010; Mem[22] = 8'b01011000; Mem[23] = 8'b00100000; //add $t3, $t1, $t2     to check if the value is getting updated in $t2

		
	end
	end
	
	assign inst = {Mem[address], Mem[address+1], Mem[address+2], Mem[address+3]}; //bigendian 
endmodule 
