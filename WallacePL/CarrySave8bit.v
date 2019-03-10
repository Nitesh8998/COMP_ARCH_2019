//`include "FullAdder/FullAdder.v"
//`include "Carry8Bit.v"

///
//
//
// Date : 8 Jan 2018
// Module : Carry Save Adder8 Bit
// Nitesh
//
//

module CarrySave8Bit(a, b, c, u,v);

	input  [7:0] a ;
	input  [7:0] b ;
	input  [7:0] c;
	output [7:0] u; 
	output [8:1] v;

	//assign v[0] = 1'b0;
	FullAdder fa0(a[0],b[0],c[0],u[0],v[1]);
	FullAdder fa1(a[1],b[1],c[1],u[1],v[2]);
	FullAdder fa2(a[2],b[2],c[2],u[2],v[3]);
	FullAdder fa3(a[3],b[3],c[3],u[3],v[4]);
	FullAdder fa4(a[4],b[4],c[4],u[4],v[5]);
	FullAdder fa5(a[5],b[5],c[5],u[5],v[6]);
	FullAdder fa6(a[6],b[6],c[6],u[6],v[7]);
	FullAdder fa7(a[7],b[7],c[7],u[7],v[8]);
//	FullAdder fa8(a[8],b[8],c[8],u[8],v[9]);
//	FullAdder fa9(a[9],b[9],c[9],u[9],v[10]);
//	FullAdder fa10(a[10],b[10],c[10],u[10],v[11]);
//	FullAdder fa11(a[11],b[11],c[11],u[11],v[12]);
//	FullAdder fa12(a[12],b[12],c[12],u[12],v[13]);
//	FullAdder fa13(a[13],b[13],c[13],u[13],v[14]);
//	FullAdder fa14(a[14],b[14],c[14],u[14],v[15]);
//	FullAdder fa15(a[15],b[15],c[15],u[15],v[16]);
//
	
//	Carry8Bit c1(a[7:0],b[7:0],c[7:0],u[7:0],v[8:1]);
//	Carry8Bit c2(a[15:8],b[15:8],c[15:8],u[15:8],v[16:9]);
endmodule
