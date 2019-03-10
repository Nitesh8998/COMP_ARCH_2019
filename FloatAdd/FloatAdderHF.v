`include "splitter.v"
`include "Shifters/rshifter.v"
`include "Shifters/lshifter.v"
`include "Shifters/Mux2x1_11.v"
`include "Shifters/Mux2x1_5.v"
`include "Shifters/Mux2x1_16.v"
`include "Adder/sum11bit.v"
`include "lzd11.v"

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    
// Design Name:  Floating point adder 16 bit  
// Module Name:    Main Module Adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This is only the adder module for subtraction another top
// module will be built
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: The input should be given in floating point format
//  			also input are non zero
//  			i am keeping the shifted mantissa as B (effective) 
//////////////////////////////////////////////////////////////////////////////////


module FloatingAdderHF(a,b,op,res);

	
	input [15:0] a;
	input [15:0] b;
	input op;   /// op is 0 if we want to add else 1
	output  [15:0] res;
	wire  [15:0] nres;
	wire opeff; // effective operation

	wire sa;
	wire sA;
	wire [4:0]ea;
	wire [10:0]ma;
	wire [10:0]wsubA;
	wire [10:0]mA; // effective MA
	wire [10:0]subA; // effective mA for sub
	wire zeroa;
	wire [15:0]azero;
	//
	wire sb;
	wire esb;
	wire sB;
	wire [4:0]eb;
	wire [10:0]mb;
	wire [10:0]wsubB;
	wire [10:0]wb;
	wire [10:0]mB; // effective MB
	wire [10:0]subB; // effective mB for sub
	wire zerob;
	wire [15:0]bzero;
	//
	
	// for addition path
	wire sadd;
	wire [4:0]eadd;
	wire [4:0]weadd;
	wire [4:0]shweadd; // shifted
	wire [11:0]wadd;
	wire [10:0]madd;

	// for subtraction path
	wire ssub;
	wire [5:0]esub;
	wire [4:0]wesub;
	//wire [5:0]shwesub; // total exp
	wire [11:0]wsub;
	wire [11:0]wsubc;
	wire [10:0]mSub;
	wire [10:0]msub;
	wire [15:0] anssub;
	wire subzero;
	
	wire [15:0]reszero;
	wire [15:0]wreszero1;
	wire [15:0]wreszero2;
	wire [3:0]lzdshift;

	// ---- spliting into mantissa sign and exponents for each-------
	
	splitter a1(a,sa,ea,ma);
	splitter b1(b,sb,eb,mb);

	
	 or(zeroa,a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]); 

	 or(zerob,b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4],b[3],b[2],b[1],b[0]);


	
	
	

	// -- shitfting the lesser one to  greater one---
	// to find lesser we subtract ie add 2s compliment and carry in is g
	//
	// lets do it
 	wire [5:0]expdiff;

	wire samesign;

	assign samesign = sa ^ sb;

	assign opeff = samesign ^ op;

	// change the sign bit of the second operand based on the the operation 
	assign esb = opeff ^ sb;

	Mux2x1_16 mzeroa({esb,b[14:0]},{16{1'b0}},zerob,wreszero1);
	Mux2x1_16 mzerob({8{2'b00}},a,zerob,wreszero2);
	
	Mux2x1_16 mzero(wreszero2,wreszero1,zeroa,reszero);

	sum5bit s1(ea,~eb,2'b01,expdiff); // sending 2s compliment of eb

	wire [5:0]expdiffc;
	wire [5:0]shift;
	assign  expdiffc = ~expdiff + 1;

	Mux2x1_5 shifteff(expdiff[4:0],expdiffc[4:0],expdiff[4],shift[4:0]);

	Mux2x1_11 m1(ma,mb,expdiff[4],wb); // carry is zero means ea is greater than eb and vice versa
	Mux2x1_11 m2(ma,mb,~expdiff[4],mA);


	rshifter rs(wb,shift[3:0],mB);

	// effective signs after shifting
	Mux2x1 effsignB(sa,esb,expdiff[4],sB);
	Mux2x1 effsignA(sa,esb,~expdiff[4],sA);


	assign wsubA = ~mA + 1;
	assign wsubB = ~mB + 1;
	// effective mantissas for subtraction
	Mux2x1_11 effsubA(wsubA,mA,sA,subA);
	Mux2x1_11 effsubB(wsubB,mB,sB,subB);
	



	// sub done
	sum11bit sub(subA,subB,2'b00,wsub);

	assign wsubc = ~wsub + 1;

	Mux2x1_11 m4(wsub[10:0],wsubc[10:0],wsub[11],msub);
	
	Mux2x1 sdiff(sA,sB,wsub[11],ssub);
	

	or(subzero,msub[0],msub[1],msub[2],msub[3],msub[4],msub[5],msub[6],msub[7],msub[8],msub[9],msub[10]);

	lzd11 lzd(msub,lzdshift);

	// writing the greater exp to exp of sub
	Mux2x1_5 grsub(eb,ea,expdiff[4],wesub);

	lshifter ls(msub,lzdshift,mSub);

	// add remaining to exponent
	sum5bit expsum(wesub,~{1'b0,lzdshift},2'b01,esub);

	Mux2x1_16 subans({ssub,esub[4:0],mSub[9:0]},{8{2'b00}},subzero,anssub);
	


	///
	// writing the greater exp to exp of sum
	Mux2x1_5 gradd(eb,ea,expdiff[4],weadd);

	assign shweadd = weadd + 1;

	sum11bit add(mA,mB,2'b00,wadd);
	
	//added exp is selected if we get a carry else no
	Mux2x1_5 nm(shweadd,weadd,wadd[11],eadd);

	// if we get a carry then shifted oone is selected(pruned from lsb
	// else we dont need the sifted one (pruned from msb)
	Mux2x1_11 m3(wadd[11:1],wadd[10:0],wadd[11],madd);


//  the final result
	Mux2x1_16 mend(anssub,{sa,eadd,madd[9:0]},opeff,nres);

	and(fzero,zeroa,zerob);
	Mux2x1_16 final(nres,reszero,fzero,res);
endmodule





	
		

	

	
