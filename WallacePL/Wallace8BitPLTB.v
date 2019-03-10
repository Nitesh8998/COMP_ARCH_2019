


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

module Wallace8BitPLTB();

	reg [7:0] a;
	reg [7:0] b;
	reg clk;
	wire[16:0] p;
//	wire[1:0] kOut;


	Wallace8BitPL w(a,b,p,clk);//kOut);
	initial begin

		a <= {2{4'b1111}};
		b <= {2{4'b1111}};
		clk <= 0;
		#75 $finish;
	end

	always #5 clk <= ~clk;
	always #5 a <= a + 1;
	always #5 b <= b + 1;
//initial $monitor("m0=%b\nm1=%b\nm2=%b\nm3=%b\nm4=%b\nm5=%b\nm6=%b\nm7=%b\nm7=%b\n",w.m0,w.m1,w.m2,w.m3,w.m4,w.m5,w.m6,w.m7);
initial	$monitor($time,"clk=%d a =%d  b=%d\n u=%b,v=%b sumwire=%b lp=%b   p=%d ",clk,a,b,w.pl4u6,w.pl4v6,w.s1.sumwire,w.lp,p);
//initial	$monitor("sumwire=%b lp=%b   p=%d ",w.s1.sumwire,w.lp,p);


	endmodule
