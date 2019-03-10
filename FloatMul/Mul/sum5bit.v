
`include "Mul/kpgGen.v"

`include "Mul/kpgCmp.v"

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
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
module sum5bit(a,b,kIn,  sum); // kin and kout are fro future purpose
    input [4:0] a;
    input  [4:0] b;
    input  [1:0] kIn;

    wire [11:0] kpgIn; // [9:0] having one extra out
    wire [11:0] kpgOut;
     wire [9:2] w1;
     wire [7:4] w2;
     
  //  wire [1:0] kWire;
    output reg [5:0] sum;
 
    
    //parameter k = 2'b00, g = 2'b01;

    // first carry value is always kill ie k
	
    assign kpgIn[1:0] = kIn; // kpgIn the top most one i have to remove this
    assign kpgOut[1:0]= kIn;

    
    kpgGen g1(a[0],b[0],kpgIn[3:2]);
    kpgGen g2(a[1],b[1],kpgIn[5:4]);
    kpgGen g3(a[2],b[2],kpgIn[7:6]);
    kpgGen g4(a[3],b[3],kpgIn[9:8]);
    kpgGen g5(a[4],b[4],kpgIn[11:10]);

    kpgCmp c1(kpgIn[3:2],kpgIn[1:0],kpgOut[3:2]);
    kpgCmp c2(kpgIn[5:4],kpgIn[3:2],w1[3:2]);
    kpgCmp c3(kpgIn[7:6],kpgIn[5:4],w1[5:4]);
    kpgCmp c4(kpgIn[9:8],kpgIn[7:6],w1[7:6]);
    kpgCmp c5(kpgIn[11:10],kpgIn[9:8],w1[9:8]);
    
    
    //kpgCmp c6(kpgIn[7:6],kpgIn[5:4],w1[5:4]);
    
    kpgCmp c6(w1[3:2],kpgIn[1:0],kpgOut[5:4]);
    kpgCmp c7(w1[5:4],kpgOut[3:2],kpgOut[7:6]);
    kpgCmp c8(w1[7:6],w1[3:2],w2[5:4]);
    kpgCmp c9(w1[9:8],w1[5:4],w2[7:6]);
    
    kpgCmp c10(w2[5:4],kpgOut[1:0],kpgOut[9:8]);
    kpgCmp c11(w2[7:6],kpgOut[3:2],kpgOut[11:10]);


//    kpgGen g4(a[3],b[3],kWire);
    
  //  always @(kWire) begin
//	  kOut <= kWire; 
 // end
    //prefixCircuit pc1(kpgIn,kpgOut);



    always @( *)//kpgOut) 
    begin
	    
	//:w
	//$display ("a\t=%bm\nb=%b sum=%b kpgIn=%b kpgOut=%b",a,b,sum,kpgIn,kpgOut);	
   
	 //   if(kpgOut[1:0] == k) begin
			sum[0] <=  a[0]^b[0]^(kpgOut[0]| kpgOut[1]);
	//	end

//	   else if(kpgOut[1:0] == g) begin
//		    sum[0] <= ~(a[0]^b[0]);
//	    	end

   
//	    if(kpgOut[3:2] == k) begin
//			sum[1] <=  a[1]^b[1];
//		end

			sum[1] <=  a[1]^b[1]^(kpgOut[3]| kpgOut[2]);
	   //else if(kpgOut[3:2] == g) begin
	//	    sum[1] <= ~(a[1]^b[1]);
	  //  	end

	   
   
	    //if(kpgOut[5:4] == k) begin
	//		sum[2] <=  a[2]^b[2];
	//	end

	     
			sum[2] <=  a[2]^b[2]^(kpgOut[5]| kpgOut[4]);

	  // else if(kpgOut[5:4] == g) begin
	//	    sum[2] <= ~(a[2]^b[2]);
	  //  	end

	   
   
//	    if(kpgOut[7:6] == k) begin
//			sum[3] <=  a[3]^b[3];
//		end

	
			
      sum[3] <=  a[3]^b[3]^(kpgOut[7]| kpgOut[6]);
      sum[4] <=  a[4]^b[4]^(kpgOut[9]| kpgOut[8]);
      sum[5] <=  (kpgOut[11]| kpgOut[10]);

//	   else if(kpgOut[7:6] == g) begin
//		    sum[3] <= ~(a[3]^b[3]);
//	    	end

//	kOut <=kWire;	   
    end	  
  


endmodule	
