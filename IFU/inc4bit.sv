


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
//

module inc4bit(in,out);

	input [3:0] in;
	output [3:0] out;

	assign out[0] = ~in[0];
	assign out[1] = in[1] ^ in[0];
	assign out[2] = (~(in[2]) & in[1] & in[0]) | (in[2] & ~in[1]) | (in[2] & ~in[0]);
       assign out[3] =(~in[3] & in[2] & in[1] & in[0]) | (in[3] & ~in[2]) | (in[3] & ~in[1]) | (in[3] &~in[0]);

       endmodule       
