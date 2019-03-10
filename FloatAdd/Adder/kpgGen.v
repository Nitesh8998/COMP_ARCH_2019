`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Engineer: Nitesh 
// 
// Create Date:     01/05/2019 
// Design Name: 
// Module Name:    kgpGenTB 
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
module kpgGen(a, b, out);
    input a;
    input b;
	 wire w1, w2;
	 output [1:0] out;
	 
	 xor(w1,a,b);
	 and(w2,a,b);
	 
	 //always @(w1 or w2)
	 //begin 
	//	if(w1) begin
	//			out <= 2'b10;
	//			end
	//	else begin
//			if(w2) begin
//				out <= 2'b01;
//				end
//			else begin
//				out <= 2'b00;
//				end
//			end
//	 end
	assign out[1] = w1;
	assign out[0] = ~w1 & w2;
	 endmodule
