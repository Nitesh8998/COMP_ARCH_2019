// `include "Mul/kpgGen.v"
// `include "Mul/kpgCmp.v"

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

module sum22bit(a,b,kIn,sum);
	input [21:0] a;
	input [21:0] b;
	input [1:0] kIn;
	wire [22:0] sumwire;
	output [22:0]sum;

	wire [1:0] kpgIn [22:0];
	wire [1:0] wl1 [22:1];
	wire [1:0] wl2 [22:2];
	wire [1:0] wl3 [22:4];
	wire [1:0] wl4 [22:8];
	wire [1:0] wl5 [22:16];
	wire [1:0] kpgOut[22:0];

	wire [22:0] temp;
	assign kpgIn [0] = kIn;	
	generate
		genvar i;
		//genvar j;
		for(i =0;i<22; i = i + 1)
		begin
			kpgGen gen(a[i],b[i],kpgIn[i+1]);
		end
		// l1
		for(i=0;i<22;i = i +1)
		begin
			kpgCmp cmp(kpgIn[i+1],kpgIn[i],wl1[i+1]);
		end
		//l2
		for(i=1;i<21;i = i +1)
		begin
			kpgCmp cmp(wl1[i+2],wl1[i],wl2[i+2]);
		end
		//l3	
		
		for(i=2;i<19;i = i +1)
		begin
			kpgCmp cmp(wl2[i+4],wl2[i],wl3[i+4]);
		end
	
		//l4
		
		for(i=4;i<15;i = i +1)
		begin
			kpgCmp cmp(wl3[i+8],wl3[i],wl4[i+8]);
		end

	endgenerate

	// layer one to layer 2 first In
	kpgCmp l12(wl1[2],kpgIn[0],wl2[2]);

	// layer 2 to layer 3 first In
	kpgCmp l231(wl2[4],kpgIn[0],wl3[4]);
	kpgCmp l232(wl2[5],wl1[1],wl3[5]);

	// layer 3 to layer 4 first In
	
	kpgCmp l341(wl3[8],kpgIn[0],wl4[8]);
	kpgCmp l342(wl3[9],wl1[1],wl4[9]);
	kpgCmp l343(wl3[10],wl2[2],wl4[10]);
	kpgCmp l344(wl3[11],wl2[3],wl4[11]);

	// layer 4 to layer 5 first In	
	kpgCmp l451(wl4[16],kpgIn[0],kpgOut[16]);
	kpgCmp l452(wl4[17],wl1[1],kpgOut[17]);
	kpgCmp l453(wl4[18],wl2[2],kpgOut[18]);
	kpgCmp l454(wl4[19],wl2[3],kpgOut[19]);
	kpgCmp l455(wl4[20],wl3[4],kpgOut[20]);
	kpgCmp l456(wl4[21],wl3[5],kpgOut[21]);
	kpgCmp l457(wl4[22],wl3[6],kpgOut[22]);

	//assign kpgOut[22:16] = wl5;

	assign kpgOut[15]= wl4[15];
	assign kpgOut[14]= wl4[14];
	assign kpgOut[13]= wl4[13];
	assign kpgOut[12]= wl4[12];
	assign kpgOut[11]= wl4[11];
	assign kpgOut[10]= wl4[10];
	assign kpgOut[9]= wl4[9];
	assign kpgOut[8]= wl4[8];
	assign kpgOut[7]= wl3[7];
	assign kpgOut[6]= wl3[6];
	assign kpgOut[5]= wl3[5];
	assign kpgOut[4]= wl2[4];
	assign kpgOut[3]= wl2[3];
	assign kpgOut[2]= wl2[2];
	assign kpgOut[1]= wl1[1];
	assign kpgOut[0]= kpgIn[0];



	generate
	genvar j;
	
	for(j=0;j<22;j=j+1)
		begin
			or(temp[j],kpgOut[j][0],kpgOut[j][1]);
			xor(sum[j],a[j],b[j],temp[j]);
		end
	endgenerate

	assign sum[22] = kpgOut[22][0] | kpgOut[22][1];
			

	endmodule


