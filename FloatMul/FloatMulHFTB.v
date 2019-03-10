


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    
// Design Name:    
// Module Name: test bench     
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

module FloatingMulHFTB();
	
	reg [15:0] a;
	reg [15:0] b;
	// reg op;
	wire [15:0] res;

	FloatingMulHF f(a,b,res);

	initial begin

		a <= 16'b1100010100000000;
		b <= 16'b0011100000000000;
		// op <= 1;
	end	

	initial $monitor("a=%b\nb=%b\nea=%b eb=%b ...%b.... expsum =%b\nexpeff=%b   exp0=%b Expeff=%b shexp=%b \nma=%b   mb=%b p=%b\nres=%b",a,b,f.ea,f.eb,f.s1.kpgOut,f.expsum, f.expeff,f.expo,f.shexp,f.expeff,f.ma,f.mb,f.p,res);

	endmodule
