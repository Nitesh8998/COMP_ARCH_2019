
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Engineer: Nitesh 
// 
// Create Date:     01/05/2019 
// Design Name: 
// Module Name:    kgpCmpTB 
//
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
module kgpCmpTB();
	reg [1:0] xi;
       	reg [1:0] xi1;
	wire [1:0]out;
	
	 kpgCmp cmp1(xi, xi1, out);
	initial
	begin
		xi= 2'b00;
		xi1= 2'b00;	
	end
	always	#32 xi1[1]= ~xi1[1];
	always #16 xi1[0] = ~xi1[0];
	always #8 xi[1] = ~xi[1];
	always #4 xi[0] = ~xi[0];	

	initial $monitor ($time,"xi1=%b,xi=%b,out=%b",xi1,xi,out);
	initial #128 $finish;
endmodule
