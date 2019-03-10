


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
module sum5bitTB();
	reg [4:0] a;
	reg    [4:0] b;
	reg [1:0] kIn;
       	
	wire [5:0] sum ;
	//wire     [1:0] kOut;
	
	sum5bit s1(a,b,kIn,  sum);//,kOut);
	initial
	begin
		a <= 5'b10111;
		b <= 5'b01011;
		kIn <= 2'b00;	
	end
initial 	$display ("a=%b\nb=%b \tkIn=%b",s1.a,s1.b,s1.kIn);	
	initial $monitor ("sum=%b",sum);	
endmodule
