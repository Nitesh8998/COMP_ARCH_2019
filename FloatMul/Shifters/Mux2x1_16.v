


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    
// Design Name:    
// Module Name:     
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
module Mux2x1_16(i1,i0,sel,out);
	input [15:0]i1;
	input [15:0]i0;
	input sel;
	//input clk;
	output [15:0]out;

	wire [15:0]w1;
	wire [15:0]w2;

	
	generate
		genvar i;
		for(i=0;i<16;i=i+1)
		begin
		nand(w1[i],i0[i],~sel);
		nand(w2[i],i1[i],sel);
		nand(out[i],w1[i],w2[i]);
		end
	endgenerate
	//always @ (posedge clk)
	//begin
	//assign	out = w1 | w2;
	//end
endmodule
	
