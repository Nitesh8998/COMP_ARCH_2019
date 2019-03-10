
`include "inc4bit.sv"

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

module inc16bit(pc,pcwire,clk); // output after 2 clks 
	input [15:0]pc;
	input clk;
	output  reg [15:0] pcwire;//[3:0] pcwire[3:0];
	

	wire [3:0] lwire [3:0];
	reg [3:0] outwire[3:0];
	wire [3:0] temp;
	wire [3:0] temp2;
	wire [15:0] temp3;
	integer i;
	wire [2:0]j;
	assign lwire [0] = pc[3:0];
	assign lwire [1] = pc[7:4];
	assign lwire [2] = pc[11:8];
	assign lwire [3] = pc[15:12];	
	//wire 	[3:0] lli;
	//wire	[7:4] lhi;
	//wire	[11:8] hli;
	//wire	[15:12]hhi;

	wire [3:0]incb;
	wire [3:0]inca;
	wire [2:0] zeropos;

	assign incb[0] = pc[3] & pc[2] & pc[1] & pc[0];
	assign incb[1] = pc[7] & pc[6] & pc[5] & pc[4];
	assign incb[2] = pc[11] & pc[10] & pc[9] & pc[8];
	assign incb[3]= pc[15] & pc[14] & pc[13] & pc[12];
	
	assign zeropos[0] =  (~incb[1]&incb[0]);
	assign zeropos[1] = ~incb[2] & incb[1] & incb[0]; 
	assign zeropos[2] = incb[2] & incb[1] & incb[0]; 
	
	inc4bit inc(lwire[zeropos],temp);

	assign j = zeropos;
	
	always @( posedge clk)
	begin
	//j <= zeropos;
	outwire[j] <= temp;
	for(i=j+1;i<4;i = i+1)
		begin
		outwire[i] <=lwire[i];
		
		end
	for(i=j-1;i>=0; i = i -1)
		begin
		outwire[i] <= 4'b0000;
		end
	
	pcwire[3:0] <= outwire[0];
	pcwire[7:4] <= outwire[1];
	pcwire[11:8] <= outwire[2];
	pcwire[15:12] <= outwire[3];


	end	

	//inc4bit b1(pc[3:0],lli);
	//inc4bit b2(pc[7:4],lhi);
	//inc4bit b3(pc[11:8],hli);
	//inc4bit b4(pc[15:12],hhi);

	//inc4bit ba(incb,inca);


endmodule
