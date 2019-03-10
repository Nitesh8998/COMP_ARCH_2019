`include "splitter.v"
`include "Shifters/rshifter.v"
`include "Shifters/lshifter.v"
`include "Shifters/Mux2x1_11.v"
`include "Shifters/Mux2x1_5.v"
`include "Shifters/Mux2x1_16.v"
`include "Mul/sum5bit.v"
// `include "lzd11.v"
`include "Mul/Wallace11Bit.v"

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

module FloatingMulHF(a,b,res);

	
	input [15:0] a;
	input [15:0] b;
	////input op;   /// op is 0 if we want to add else 1

	output  [15:0] res;
	wire  [15:0] nres;


    wire sa;
    wire [4:0]ea;
    wire [4:0]Ea;
	wire [10:0]ma;
    wire zeroa;
	wire [15:0]azero;

    wire sb;
    wire [4:0]eb;
	wire [10:0]mb;
    wire zerob;
	wire [15:0]bzero;

    wire [15:0]reszero;
    wire [5:0] expsum;
     wire [5:0] expeff;
     wire [5:0] Expeff;
     wire [5:0] expeffc;
     wire [5:0] shexp;
    wire [22:0] p;

    wire sp;
    wire [4:0]ep;
    //wire [4:0]Ep;
	wire [10:0]mp;
    
    // wire zeroa;
	// wire [15:0]azero;

    splitter a1(a,sa,ea,ma);
	splitter b1(b,sb,eb,mb);

	
	 or(zeroa,a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]); 

	 or(zerob,b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4],b[3],b[2],b[1],b[0]);


     assign zeroeff = zeroa & zerob;
     assign eA = eA;
     assign sp = sa ^ sb;

     Mux2x1_16 mzero({16{1'b1}},{16{1'b0}},zeroeff,reszero);

     sum5bit s1(ea,eb,2'b00,expsum);
     sum5bit s2(expsum[4:0],5'b10000,2'b01,expeff);
     
     wire temp;
     wire car;
     wire [5:0] expo;
     HalfAdder h1 (expeff[5],1'b1,temp,car);
     
     assign expo = {temp,expeff[4:0]};
    assign expeffc = ~expo + 1;

    Mux2x1_5  ee(expo[4:0],expeff[4:0],car,Expeff[4:0]);

     Wallace11Bit w(ma,mb,p);

     assign shexp[4:0] = Expeff[4:0] + 1;

     Mux2x1_11 m1(p[21:11],p[20:10],p[21],mp);
     Mux2x1_5  e(shexp[4:0],Expeff[4:0],p[21],ep);
     

     Mux2x1_16 final({sp,ep[4:0],mp[9:0]},reszero,zeroeff,res);
endmodule
     