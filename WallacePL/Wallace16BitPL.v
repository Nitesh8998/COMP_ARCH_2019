
`include "Wallace8BitPL.v"
`include "CarrySave8bit.v"
`include "Adder/sum24bit.sv"
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
// Additional Comments: uses 24 bit carry lookahead adder and 8 bit wallace
// tree multiplier 
//
//////////////////////////////////////////////////////////////////////////////////

module Wallace16BitPL(a,b,p,clk);

	input [15:0] a;
	input [15:0] b;
	input clk;
	output reg [32:0] p;
	
	// one extra due to my 8bit wallace and carry lookahead
	wire [16:0] prodLowLow;
	wire [24:8] prodHighLow;
	wire [24:8] prodLowHigh;
	wire [32:16] prodHighHigh;

	reg [16:0] prodLowLow_reg;
	reg [24:8] prodHighLow_reg;
	reg [24:8] prodLowHigh_reg;
	reg [32:16] prodHighHigh_reg;
	reg [32:16] prodHighHigh_reg_2;

	Wallace8BitPL w1(a[7:0],b[7:0],prodLowLow,clk);
	Wallace8BitPL w2(a[15:8],b[7:0],prodHighLow,clk);
	Wallace8BitPL w3(a[7:0],b[15:8],prodLowHigh,clk);
	Wallace8BitPL w4(a[15:8],b[15:8],prodHighHigh,clk);

	wire [32:0] outu;
////	wire outu24;
//	wire car;
	wire [15:8] u1;
	wire [16:9] v1;
	wire [23:16] u2;
	wire [24:17] v2;

	reg [15:8] u1_reg;
	reg [16:9] v1_reg;
	reg [23:16] u2_reg;
	reg [24:17] v2_reg;


	//wire [13:0] kpgIn;
//	wire [11:0] w1;
//	wire [9:0]  w2;
//	wire [5:0]
	//wire [13:0] kpgOut;
	//wire [1:0] kWire2;
	//wire [1:0] kWire2;
	//wire [1:0] kWire2;

	reg [7:0]prodLowLow_reg_2;
	

	assign outu[7:0] = prodLowLow_reg_2;
	
	
	//assign outu[31:23] = prodHighHigh[31:23];
	
        CarrySave8Bit c1(prodLowLow_reg[15:8],prodHighLow_reg[15:8],prodLowHigh_reg[15:8],u1,v1);
        CarrySave8Bit c2(prodHighLow_reg[23:16],prodLowHigh_reg[23:16],prodHighHigh_reg[23:16],u2,v2);

//        sum16bit s1({u2,u1},{v2[23:17],v1,{1'b0}},2'b00,outu[24:8]);
 //  sum16bit s1({prodHighHigh[31:24],u2},{v2,v1},2'b00,outu[24:8]);
       sum24bit s1({prodHighHigh_reg_2[31:24],u2_reg,u1_reg},{{7{1'b0}},v2_reg,v1_reg,{1'b0}},2'b00,outu[32:8]);


always @ clk
begin

	//5
	prodHighHigh_reg <=prodHighHigh;
	prodHighLow_reg <= prodHighLow;
	prodLowHigh_reg <= prodLowHigh;
	prodLowLow_reg <= prodLowLow;


	//6
	prodHighHigh_reg_2<= prodHighHigh_reg; 

	u1_reg<=u1;
	u2_reg<=u2;

	v1_reg<=v1;
	v2_reg<=v2;


	prodLowLow_reg_2 <=prodLowLow_reg;
	// temp2 <= temp1;



	
    p<= outu; 
end
endmodule
