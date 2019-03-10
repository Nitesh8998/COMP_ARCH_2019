
`include"Mul/FullAdder.v"
`include"Mul/HalfAdder.v"

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

module CarryL1(m0, m1, m2, u,v);

	input  [10:0] m0 ;
	input  [11:1] m1 ;
	input  [12:2] m2;
	output [12:0] u; 
	output [12:2] v;
    

    assign u[0] = m0[0];
    HalfAdder h1(m0[1],m1[1],u[1],v[2]);

    generate
        genvar i;
        for (i=2; i<=10; i = i + 1) begin
            FullAdder fa0(m0[i],m1[i],m2[i],u[i],v[i+1]);
            
        end
    endgenerate
    
    HalfAdder h2(m1[11],m2[11],u[11],v[12]);
	assign u[12] = m2[12];

endmodule