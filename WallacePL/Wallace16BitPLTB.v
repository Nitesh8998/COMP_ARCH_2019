


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


module Wallace16BitTB();


	reg [15:0] a;
	reg [15:0] b;
	reg clk;
	wire [32:0] p;


	Wallace16BitPL  w(a,b,p,clk);
	initial 
	begin
		a <= {4{4'b1111}};
		b <= {4{4'b1111}};
		clk <= 1'b0;
		#50 $finish;
	end

	always #5 clk <= ~clk;
	always #5 a <= a +1;
	always #5 b <= b +1;

	initial $monitor($time,"clk=%b a=%b\nb=%b\nLL=%b\nLH=%b\nHL=%b\nHH=%b\noutu=%b\np=%b",clk,a,b,w.prodLowLow_reg,w.prodLowHigh_reg,w.prodHighLow_reg,w.prodHighHigh_reg,w.outu,p);
	endmodule
