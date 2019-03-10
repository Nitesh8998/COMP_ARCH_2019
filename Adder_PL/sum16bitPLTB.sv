




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
module sum16bitPLTB();
	reg [15:0] a;
	reg    [15:0] b;
	reg [1:0] kIn;
    reg clk;
       	integer i;
	wire [16:0] sum ;
	wire     [1:0] kOut;
	
	sum16bitPL s1(a,b,kIn,  sum,clk);//,kOut);
	initial
	begin
		a <= {4{4'b1001}};
		b <= {4{4'b1111}};
		kIn <= 2'b00;
       clk <= 0;
		#30 $finish;	
	end

    always #5 clk = ~clk;
	// always #5 kIn[0] = ~kIn[0]; 
    always #5 a<=a+1;
    always #5 b<=b+1;
	initial begin
		$dumpfile("dumpfile_adder.vcd");
		$dumpvars (0,sum16bitPLTB);
		$monitor ($time," clk=%d  a=%d   b=%d temp=%b wl4[15]=%b\nsum=%d \n",clk,a,b,s1.temp,s1.wl4[15],sum);//,s1.sumwire);
	for(i=0;i<16;i=i+1) 
		begin
	#20	$display ("kpgIn[%d]=%b",i,s1.wl4[i]);
	//	$display ("%bkpgIn=%b",i,a[i]);
		end
	end	
//	initial $monitor ("sum=%b",sum);	
endmodule
