`include "Adder/kpgGen.v"
`include "Adder/prefixCircuit.v"

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
module sum4bit(a,b,kIn,  sum); // kin and kout are fro future purpose
    input [3:0] a;
    input  [3:0] b;
    input  [1:0] kIn;

    wire [7:0] kpgIn; // [9:0] having one extra out
    wire [7:0] kpgOut;
  //  wire [1:0] kWire;
    output reg [3:0] sum;
 
    
    //parameter k = 2'b00, g = 2'b01;

    // first carry value is always kill ie k
	
    assign kpgIn[1:0] = kIn; // in the top most one i have to remove this


    
    kpgGen g1(a[0],b[0],kpgIn[3:2]);
    kpgGen g2(a[1],b[1],kpgIn[5:4]);
    kpgGen g3(a[2],b[2],kpgIn[7:6]);
    
//    kpgGen g4(a[3],b[3],kWire);
    
  //  always @(kWire) begin
//	  kOut <= kWire; 
 // end
    prefixCircuit pc1(kpgIn,kpgOut);



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

//	   else if(kpgOut[7:6] == g) begin
//		    sum[3] <= ~(a[3]^b[3]);
//	    	end

//	kOut <=kWire;	   
    end	  
  


endmodule	
