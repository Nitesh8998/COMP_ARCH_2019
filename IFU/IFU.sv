
//`include "inc16bit.sv"
`include "sum16bit.sv"

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

module IFU(reset,clk,en,isr);
	
	input //[15:0]pc,
	      reset,
	      clk,
	      en;
      	output reg [15:0]isr;

	 reg [15:0] pc;
	 reg [15:0]temp1;
	 reg [15:0] temp2;
	wire [16:0] pcwire;

	wire [15:0] imem [0:1023];//65535]; // if need be can be 1024 also

	// inc16bit inc(pc,pcwire,clk);
	sum16bit inc(pc,16'b1,2'b0,pcwire);

	always @(clk)
	begin
		//temp<=1;
		if (reset)
		begin
			pc <= {4{4'b0000}};
			
			//isr <= imem[pc];
		end
		// else
		// 	begin
			if (en && ~reset)
			begin
			//temp<=1;
			
			// temp1 <= imem[pcwire];
			// temp2 <= temp1;
			isr <= imem[pc[9:0]];//temp2;
			//en <= isr[15] & ~(isr[14] & isr[13] & isr[12]); // should
			//compute this in decode stage
			pc <=pcwire;
			// end
		end
	end	

endmodule
