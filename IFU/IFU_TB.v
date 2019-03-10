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

module IFU_TB();

    reg reset;
    reg clk;
    reg en;

    wire [15:0] isr;

    IFU ifu(reset,clk,en,isr);

    assign ifu.imem[0]=3;
      assign ifu.imem[1]=7;
      assign ifu.imem[2]=15;
      assign ifu.imem[3]=31;
      assign ifu.imem[4]=64;
      assign ifu.imem[5]=128;
      assign ifu.imem[6]=255;

    initial
    begin
      reset <= 1;
      clk <=0;
      en <=1;
      
      #50 $finish;
    end

    always #5 clk <= ~clk;
    initial #5 reset <= 0;

    initial $monitor($time, " clk=%d,rest=%d,en=%d, pc=%d  pcwire=%d, isr=%d",clk,reset,en,ifu.pc,ifu.pcwire,isr);
endmodule