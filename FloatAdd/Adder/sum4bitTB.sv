

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh
// 
// Create Date:     01/06/2019 
// Design Name: 
// Module Name:    sum4bit
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
module sum4bitTB();
	reg [3:0] a;
	reg    [3:0] b;
	reg [1:0] kIn;
       	
	wire [3:0] sum ;
	//wire     [1:0] kOut;
	
	sum4bit s1(a,b,kIn,  sum);//,kOut);
	initial
	begin
		a <= 4'b1101;
		b <= 4'b1010;
		kIn <= 2'b00;	
	end
initial 	$display ("a=%b\nb=%b \tkIn=%b",s1.a,s1.b,s1.kIn);	
	initial $monitor ("sum=%b",sum);	
endmodule
