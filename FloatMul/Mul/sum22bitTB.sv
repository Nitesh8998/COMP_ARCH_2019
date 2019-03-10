




`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh
// 
// Create Date:     01/06/2019 
// Design Name: 
// Module Name:    sum4bit
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
module sum22bitTB();
	reg [21:0] a;
	reg    [21:0] b;
	reg [1:0] kIn;
       	integer i;
	wire [22:0] sum ;
	//wire     [1:0] kOut;
	
	sum22bit s1(a,b,kIn,  sum);//,kOut);
	initial
	begin
		a <= {{4{5'b10001}},2'b00};
		b <= {{4{5'b01011}},2'b01};
		kIn <= 2'b00;
	//	#5 $finish;	
	end
	initial begin
		$monitor ("a=%b\nb=%b \n kpgIn=%b sum=%b",a,b,s1.kpgIn[22],sum);
	for(i=0;i<23;i=i+1) 
		begin
	#20	$display ("kpgIn[%d]=%b",i,s1.wl1[i]);
	//	$display ("%bkpgIn=%b",i,a[i]);
		end
	end	
//	initial $monitor ("sum=%b",sum);	
endmodule
