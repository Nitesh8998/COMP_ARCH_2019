
`include "Shifters/Mux2x1.v"


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    
// Design Name: Floating Point Adder    
// Module Name:     rshifter
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
module rshifter(in,sel,out);

	input [10:0] in;
//	input clk;
	input [3:0] sel;
        output  [10:0] out;

	wire [10:0] l1;
	wire [10:0] l2;
	wire [10:0] l3; 
	wire  [10:0] shifted;

	parameter zero = 1'b0;
	//Mux2x1 m0(in[1],in[0],sel[0],clk,l1[0]);
	//Mux2x1 m1(in[2],in[1],sel[0],clk,l1[1]);
//	Mux2x1 m2(in[3],in[2],sel[0],clk,l1[2]);
//	Mux2x1 m3(in[4],in[3],sel[0],clk,l1[3]);

	generate
		genvar i;
		for(i=0;i<10;i=i+1)
		begin

			Mux2x1 ml0(in[i+1],in[i],sel[0],l1[i]);
		end
	endgenerate
	
			Mux2x1 m00(zero,in[10],sel[0],l1[10]);
	
	generate
		genvar j;
		for(j=0;j<9;j=j+1)
		begin

			Mux2x1 ml1(l1[j+2],l1[j],sel[1],l2[j]);
		end
	endgenerate

 			Mux2x1 m10(zero,l1[10],sel[1],l2[10]);
			Mux2x1 m11(zero,l1[9],sel[1],l2[9]);
			
	generate
		//genvar j;
		for(j=0;j<7;j=j+1)
		begin

			Mux2x1 ml2(l2[j+4],l2[j],sel[2],l3[j]);
		end
	endgenerate

	generate
		genvar k;
		for(k=0;k<4;k=k+1)
		begin

			Mux2x1 ml2(zero,l2[k+7],sel[2],l3[k+7]);
		end
	endgenerate

			
	generate
		//genvar j;
		for(j=0;j<3;j=j+1)
		begin

			Mux2x1 ml2(l3[j+8],l3[j],sel[3],shifted[j]);
		end
	endgenerate

	generate
		//genvar k;
		for(k=0;k<8;k=k+1)
		begin

			Mux2x1 ml2(zero,l3[k+3],sel[3],shifted[k+3]);
		end
	endgenerate

	//always @(posedge clk)
	//always @(posedge clk)
//		begin
		assign	out = shifted;
//		end
	
endmodule

