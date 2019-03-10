


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

module FloatingAdderHFTB();
	
	reg [15:0] a;
	reg [15:0] b;
	reg op;
	wire [15:0] res;

	FloatingAdderHF f(a,b,op,res);

	initial begin

		a <= 16'b0000000000000000;
		b <= 16'b0100100010000000;
		op <= 1;
	end	

	initial $monitor("a=%b\nb=%b\nexpdiff=%b,opeff%b,,shift=%b\naddA=%b,addB=%b\nsA=%b subA=%b,sB=%b subB=%b\nwsub=%b subnsh=%b  subshift=%b\nres=%b",a,b,f.expdiff,f.opeff,f.shift,f.mA,f.mB,f.sA,f.subA,f.sB,f.subB,f.wsub,f.msub,f.mSub,res);

	endmodule
