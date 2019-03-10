`include "Mul/CarryL1.v"
`include "Mul/sum22bit.sv"


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Nitesh 
// 
// Create Date:    2/5/19
// Design Name: Wallace 11 Bit    
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
// Additional Comments: some statements can be replaced with initial
// statements and vise versa
//
//////////////////////////////////////////////////////////////////////////////////

module Wallace11Bit(a, b, p);//kOut);

	input  [10:0] a ;
	input  [10:0] b ;
    output [22:0] p;

	wire   [10:0] m0;
	wire   [11:1] m1;
	wire   [12:2] m2;
	wire   [13:3] m3;
	wire   [14:4] m4;
	wire   [15:5] m5;
	wire   [16:6] m6;
	wire   [17:7] m7;
    wire   [18:8] m8;
    wire   [19:9] m9;
    wire   [20:10] m10;
    
    
    //L1
	//first csa op
	wire   [12:0] u1 ;
	wire   [12:2] v1;

	// second csa op
	wire   [15:3] u2;
	wire   [15:5] v2;

	// third csa op
	wire   [18:6] u3;
	wire   [18:8] v3;


    //L2
	//fourth csa op
	wire   [15:0] u4;
	wire   [13:3] v4;

	// fifth csa op
	wire   [18:5] u5;
	wire   [19:7] v5;

    //L3
	// sixth csa op
	wire   [18:0] u6;
	wire   [16:4] v6;

    // seventh csa op
    wire   [20:7]  u7;
    wire   [20:10] v7;


    //L4
    // eighth csa op
    wire   [20:0] u8;
    wire   [19:5] v8;

    //L5
    // ninth csa op 
    wire   [20:0] u9;
    wire   [21:6] v9;



       
        assign m0 = a & {11{b[0]}};
        assign m1 = {a & {11{b[1]}}};//,{1'b0}};
        assign m2 = {a & {11{b[2]}}};//,{2{1'b0}}};
        assign m3 = {a & {11{b[3]}}};//,{3{1'b0}}};
        assign m4 = {a & {11{b[4]}}};//,{4{1'b0}}};
        assign m5 = {a & {11{b[5]}}};//,{5{1'b0}}};
        assign m6 = {a & {11{b[6]}}};//,{6{1'b0}}};
        assign m7 = {a & {11{b[7]}}};//,{7{1'b0}}};
        assign m8 = {a & {11{b[8]}}};//,{7{1'b0}}};
        assign m9 = {a & {11{b[9]}}};//,{7{1'b0}}};
        assign m10 = {a & {11{b[10]}}};//,{7{1'b0}}};
       // assign m11 = {a & {8{b[11]}}};//,{7{1'b0}}};


        genvar i;


        //L1
        CarryL1 c1(m0,m1,m2,u1,v1);
	    CarryL1 c2(m3,m4,m5,u2,v2);
	    CarryL1 c3(m6,m7,m8,u3,v3);
        
        // L2
        //csa 4
        assign u4[1:0] = u1[1:0];
         HalfAdder h1(u1[2],v1[2],u4[2],v4[3]);

        generate
            
            for ( i=3; i<=12; i = i+1) begin
                FullAdder f1(u1[i],v1[i],u2[i],u4[i],v4[i+1]);
            end
        endgenerate
        assign u4[15:13] = u2[15:13];
        
        //
         //csa 5
        assign u5[5] = v2[5];
         HalfAdder h21(v2[6],u3[6],u5[6],v5[7]);
         HalfAdder h22(v2[7],u3[7],u5[7],v5[8]);

        generate
            
            for ( i=8; i<=15; i = i+1) begin
                FullAdder f1(v2[i],u3[i],v3[i],u5[i],v5[i+1]);
            end
        endgenerate
         HalfAdder h23(u3[16],v3[16],u5[16],v5[17]);
         HalfAdder h24(u3[17],v3[17],u5[17],v5[18]);
         HalfAdder h25(u3[18],v3[18],u5[18],v5[19]);
        //



        //L3
         //csa 6
        assign u6[2:0] = u4[2:0];
        HalfAdder h31(u4[3],v4[3],u6[3],v6[4]);
        HalfAdder h32(u4[4],v4[4],u6[4],v6[5]);

        generate
            
            for ( i=5; i<=13; i = i+1) begin
                FullAdder f1(u4[i],v4[i],u5[i],u6[i],v6[i+1]);
            end
        endgenerate

        HalfAdder h33(u4[14],u5[14],u6[14],v6[15]);
        HalfAdder h34(u4[15],u5[15],u6[15],v6[16]);

        assign u6[18:16] = u5[18:16];



        //
         //csa 7
        assign u7[8:7] = v5[8:7];
        HalfAdder h35(m9[9],v5[9],u7[9],v7[10]);

        generate
            
            for ( i=10; i<=19; i = i+1) begin
                FullAdder f1(m9[i],m10[i],v5[i],u7[i],v7[i+1]);
            end
        
        endgenerate

        
        assign u7[20] = m10[20];

        //

        //L4
         //csa 8
        assign u8[3:0]= u6[3:0];
        HalfAdder h41(u6[4],v6[4],u8[4],v8[5]);
        HalfAdder h42(u6[5],v6[5],u8[5],v8[6]);
        HalfAdder h43(u6[6],v6[6],u8[6],v8[7]);

        generate
            
            for ( i=7; i<=16; i = i+1) begin
                FullAdder f1(u6[i],v6[i],u7[i],u8[i],v8[i+1]);
            end
        
        endgenerate
        HalfAdder h44(u7[17],u6[17],u8[17],v8[18]);
        HalfAdder h45(u7[18],u6[18],u8[18],v8[19]);

        assign u8[20:19] = u7[20:19];

        //

        //L5
         //csa 9
        assign u9[4:0]= u8[4:0];
        HalfAdder h51(u8[5],v8[5],u9[5],v9[6]);
        HalfAdder h52(u8[6],v8[6],u9[6],v9[7]);
        HalfAdder h53(u8[7],v8[7],u9[7],v9[8]);
        HalfAdder h54(u8[9],v8[8],u9[8],v9[9]);
        HalfAdder h55(u8[9],v8[9],u9[9],v9[10]);

        generate
            
            for ( i=10; i<=19; i = i+1) begin
                FullAdder f1(u8[i],v8[i],v7[i],u9[i],v9[i+1]);
            end
        
        endgenerate
        HalfAdder h56(v7[20],u8[20],u9[20],v9[21]);
        

        sum22bit s({1'b0,u9},{v9,{6{1'b0}}},2'b00,p);

endmodule