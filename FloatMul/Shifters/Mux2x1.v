


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    1/21/19
// Design Name: Floating Point Adder    
// Module Name:     Mux2x1
// Project Name:   Floating Point Adder
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

module Mux2x1(i1,i0,sel,out);
	input i1;
	input i0;
	input sel;
	input clk;
	output out;

	wire w1;
	wire w2;

	and(w1,i0,~sel);
	and(w2,i1,sel);

	//always @ (posedge clk)
	//begin
	assign	out = w1 | w2;
	//end
endmodule
	
