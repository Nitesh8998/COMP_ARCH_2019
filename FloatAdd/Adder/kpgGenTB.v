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
module kgpGenTB();
	reg a , b ;
	wire [1:0]out;
	
	 kpgGen h1(a, b, out);
	
	initial
	begin
		a = 0;
		b = 0;	
	end
	always 
	begin
	#2 a = ~a;
   #2 b = ~b;
	end
	initial $monitor ($time,"a=%b,b=%b,out=%b",a,b,out);
	initial #16 $finish;
endmodule
