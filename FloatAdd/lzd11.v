


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


module lzd11(in,pos);
	
	input [10:0] in;
	output reg [3:0] pos;

	always @(in)
	begin 
	casex (in)
		11'b00000000001: pos = 4'b1010;
		11'b0000000001x: pos = 4'b1001;
		11'b000000001xx: pos = 4'b1000;
		11'b00000001xxx: pos = 4'b0111;
		11'b0000001xxxx: pos = 4'b0110;
		11'b000001xxxxx: pos = 4'b0101;
		11'b00001xxxxxx: pos = 4'b0100;
		11'b0001xxxxxxx: pos = 4'b0011;
		11'b001xxxxxxxx: pos = 4'b0010;
		11'b01xxxxxxxxx: pos = 4'b0001;
		11'b1xxxxxxxxxx: pos = 4'b0000;
		default: pos =4'b0xx0;
	endcase
	end
	endmodule	
