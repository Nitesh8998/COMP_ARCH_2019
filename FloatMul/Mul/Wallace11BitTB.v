
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

module Wallace8BitTB();

	reg [10:0] a;
	reg [10:0] b;
	wire[22:0] p;
//	wire[1:0] kOut;


	Wallace11Bit w(a,b,p);//kOut);
	initial begin

		a = {11'b10100000000};
		b = {11'b10100000000};
	end
//initial $monitor("m0=%b\nm1=%b\nm2=%b\nm3=%b\nm4=%b\nm5=%b\nm6=%b\nm7=%b\nm7=%b\n",w.m0,w.m1,w.m2,w.m3,w.m4,w.m5,w.m6,w.m7);
initial	$monitor("a =%b %d\nb=%b %d\nu3=%b\nv3=%b\nu4=%b\nv4=%b\nu5=%b\nv5=%b\np=%b %d",a,a,b,b,w.u1,w.v1,w.u2,w.v2,w.u3,w.v3,w.p,w.p);

	endmodule
