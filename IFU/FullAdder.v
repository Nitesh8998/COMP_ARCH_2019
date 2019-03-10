

///
//
//
// Date : 7 Jan 2018
// Module : Full Adder
// Nitesh
//
//

module FullAdder(a, b, cin, sum,cout);

	input a , b,cin;
	output sum, cout;

	assign cout = (a & cin) | (b & cin) | (a & b) ;
	xor(sum,a,b,cin);

endmodule
