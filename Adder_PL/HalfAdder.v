


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
//

module HalfAdder 
  (
   a,
   b,
   sum,
   cout
   );
 
  input  a;
  input  b;
  output sum;
  output cout;
 
  assign sum   = a ^ b;  // bitwise xor
  assign cout = a & b;  // bitwise and
 
endmodule 
