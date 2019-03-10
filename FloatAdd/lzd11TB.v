


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

module lzd11TB();
	
	reg [10:0] in;
	wire [3:0] pos;

	lzd11 lzd(in,pos);
	
	initial begin 
		in <= 11'b00000000101;
	end

	always @(*) $monitor("in=%b\npos=%b",in,pos);
endmodule
	
