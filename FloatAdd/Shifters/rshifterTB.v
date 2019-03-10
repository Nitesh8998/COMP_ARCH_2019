


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    
// Design Name:    
// Module Name:    rshifter 
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

module rshifterTB();

	reg [10:0] in;
        reg [3:0 ] sel;
	//reg clk;
	wire [10:0] out;

	rshifter rs(in,sel,out);
	initial 
		begin
			in <= {3'b111,{2{4'b1011}}};
			sel <= 4'b0110;
//			clk <= 1'b0;
			
			#25 $finish;
		end	
	
	always #5 sel[1] <= ~sel[2];
	//always #2 clk = ~clk;


	always #5 sel <= ~sel;

	initial $monitor($time,"in=%b\tsel=%b\tshifted=%b,,,%b",in,sel,out,rs.l3);

endmodule
