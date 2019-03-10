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


module inc16bitTB();

    reg [15:0] pc;
    reg clk;
    wire [15:0]pcwire;

    inc16bit inc1(pc,pcwire,clk);

    initial
    begin
      pc <= {{4{2'b10}},{2{4'b0000}}};
      clk<=0;
        #30 $finish;
    end

    always #2 clk <= ~clk;
    always #2 pc <= pc +1;

    // initial $monitor($time," clk=%d  pc=%b j=%d temp2=%b temp4=%b pcwire=%b",clk,pc,inc1.j,inc1.temp2,inc1.temp4,pcwire);
    
    initial $monitor($time," clk=%d  pc=%b j=%d pcwire=%b",clk,pc,inc1.j,pcwire);
endmodule