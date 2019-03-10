


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

module splitter(a,sa,ea,ma);

	input [15:0]a;
	output sa;
	output [4:0]ea;
	output [10:0] ma; // one extra for implicit 1

	assign sa = a[15];
	assign ea = a[14:10];
	assign ma = {1'b1,a[9:0]};

	endmodule
	
