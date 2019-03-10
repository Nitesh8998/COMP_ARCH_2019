
`include "Adder/sum5bit.v"
`include "Adder/FullAdder.v"
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

module sum11bit(a,b,kIn,sum);

	input [10:0] a;
        input [10:0] b;
	input [1:0] kIn;
	wire extra;
	output[11:0] sum;


	sum5bit s1(a[4:0],b[4:0],2'b00,sum[5:0]);
	
	sum5bit s2(a[9:5],b[9:5],s1.kpgOut[11:10],{extra,sum[9:5]});

	FullAdder f1(a[10],b[10],extra,sum[10],sum[11]);

	//assign sum = outsum;
	endmodule

