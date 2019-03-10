

//`include "Mux2x1.v"


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
module lshifter(in,sel,out);

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

			Mux2x1 ml0(in[9-i],in[10-i],sel[0],l1[10-i]);
		end
	endgenerate
	
			Mux2x1 m00(zero,in[0],sel[0],l1[0]);
	
	generate
		genvar j;
		for(j=0;j<9;j=j+1)
		begin

			Mux2x1 ml1(l1[8-j],l1[10-j],sel[1],l2[10-j]);
		end
	endgenerate

 			Mux2x1 m10(zero,l1[1],sel[1],l2[1]);
			Mux2x1 m11(zero,l1[0],sel[1],l2[0]);
			

		//	Mux2x1 ml2(l2[0],l2[4],sel[2],shifted[4]);
	
			
	generate
		//genvar j;
		for(j=0;j<6;j=j+1)
		begin

			Mux2x1 ml2(l2[6-j],l2[10-j],sel[2],l3[10-j]);
		end
	endgenerate

	generate
		genvar k;
		for(k=0;k<4;k=k+1)
		begin

			Mux2x1 ml2(zero,l2[3-k],sel[2],l3[3-k]);
		end
	endgenerate
	generate
		//genvar k;
		for(k=0;k<3;k=k+1)
		begin

			Mux2x1 ml2(l3[2-k],l2[10-k],sel[3],shifted[10-k]);
		end
	endgenerate


	generate
	//always @(posedge clk)
		//genvar k;
		for(k=0;k<8;k=k+1)
		begin

			Mux2x1 ml1(zero,l2[7-k],sel[3],shifted[7-k]);
		end
	endgenerate

	//always @(posedge clk)
//		begin
		assign	out = shifted;
//		end
	
endmodule

