
//`include"Carry4Bit.v"
`include"Adder/FullAdder.v"
`include"Adder/HalfAdder.v"

///
//
//
// Date : 9 Jan 2018
// Module : Carry Save Adder8 Bit
// Nitesh
//
//

module Carry8Bit(m0, m1, m2, u,v);

	input  [7:0] m0 ;
	input  [8:1] m1 ;
	input  [9:2] m2;
	output [9:0] u; 
	output [7:0] v;


	
	
	assign u[0] = m0[0]; //commented for future 

	//assign u1[0] = m0[0];
	HalfAdder h1(m0[1],m1[1],u[1],v[0]);
	//Carry4bit c1(m0[7:2],m1[7:2],m2[7:2],u1[7:2],v1[8:3]);
	FullAdder fa0(m0[2],m1[2],m2[2],u[2],v[1]);
	FullAdder fa1(m0[3],m1[3],m2[3],u[3],v[2]);
	FullAdder fa2(m0[4],m1[4],m2[4],u[4],v[3]);
	FullAdder fa3(m0[5],m1[5],m2[5],u[5],v[4]);
	FullAdder fa4(m0[6],m1[6],m2[6],u[6],v[5]);
	FullAdder fa5(m0[7],m1[7],m2[7],u[7],v[6]);
	HalfAdder h2(m1[8],m2[8],u[8],v[7]);
	assign u[9] = m2[9];

	
	//Carry4Bit c1(a[3:0],b[3:0],c[3:0],u[3:0],v[4:1]);
	
	//Carry4Bit c2(a[7:4],b[7:4],c[7:4],u[7:4],v[8:5]);
	
	//FullAdder fa0(a[0],b[0],c[0],u[0],v[1]);
	//FullAdder fa1(a[1],b[1],c[1],u[1],v[2]);
	//FullAdder fa2(a[2],b[2],c[2],u[2],v[3]);
	//FullAdder fa3(a[3],b[3],c[3],u[3],v[4]);

endmodule
