
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Engineer: Nitesh 
// 
// Create Date:     01/05/2019 
// Design Name: 
// Module Name:    kgpCmp 
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
// Additional Comments: i1 = i-1
//
//////////////////////////////////////////////////////////////////////////////////
module kpgCmp(xi,xi1,out);
    input [1:0] xi;
    input [1:0] xi1;
    //wire w1, w2, w3;
    output reg [1:0] out;
	 
    always @ (xi or xi1) 
    begin
	 //and(out[1], xi[1], xi1[1]);
	 out[1] <= xi[1] & xi1[1];
	 //and(w1, xi[0], xi[1], ~xi1[1])
	 //and(w
	out[0] <= (xi[0] & ~xi[1] & ~xi1[1]) | (xi[1] & ~xi[0] & xi1[0] & ~xi1[1]) | (xi[0] & ~xi[1] & xi1[1] & ~xi1[0]) ;
	end
endmodule	
