




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
		b <= {4{4'b0111}};
		kIn <= 2'b00;
       clk <= 0;
		#35 $finish;	
	end

    always #5 clk = ~clk;
    always #5 a[10:9] <= ~a[10:9];
    always #5 b[5] <= ~b[5];
	initial begin
		$monitor ($time," a=%b   b=%b \nsum=%b \n",a,b,sum);//,s1.sumwire);
	for(i=0;i<16;i=i+1) 
		begin
	#20	$display ("kpgIn[%d]=%b",i,s1.wl4[i]);
	//	$display ("%bkpgIn=%b",i,a[i]);
		end
	end	
//	initial $monitor ("sum=%b",sum);	
endmodule
