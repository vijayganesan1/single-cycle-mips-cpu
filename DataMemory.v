`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:46 03/23/2023 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory (reset, clock, address, MemWrite, MemRead, WriteData, ReadData);

	input clock;
	input reset;
	input [31:0] address;
	input MemWrite, MemRead;
	input [31:0] WriteData; 
	
	output reg [31:0] ReadData;

	reg [7:0] Mem [127:0]; //32 bits memory with 128 entries

	always @ (posedge clock, negedge reset) 
	begin
		if (reset == 0)begin
			Mem[0]=0;
			Mem[1]=0;
			Mem[2]=0;
			Mem[3]=0;
			Mem[4]=0;
			Mem[5]=0;
			Mem[6]=0;
			Mem[7]=0;
			Mem[8]=0;
			Mem[9]=0;
			Mem[10]=0;
			Mem[11]=0;
			Mem[12]=0;
			Mem[13]=0;
			Mem[14]=0;
			Mem[15]=0;
			Mem[16]=0;
			Mem[18]=0;
			end
		else if (MemWrite == 1)begin
			Mem[address+3] <= WriteData[7:0];
            Mem[address+2] <= WriteData[15:8];
            Mem[address+1] <= WriteData[23:16];
            Mem[address] <= WriteData[31:24];
            end
         end
   always @ (negedge clock)
	begin		
	if (MemRead == 1)
			ReadData <= {Mem[address],Mem[address+1],Mem[address+2],Mem[address+3]} ;
	end	
endmodule