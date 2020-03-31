`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:44:54 AM
// Design Name: 
// Module Name: tb_SevenSegments
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_SevenSegments;

    reg clk;
    reg rst;
    reg en;
    wire [6:0] seg;
    wire [3:0] an;
    
    SevenSegments mod_inst (clk, rst, en, seg, an);
    
    always
        #1 clk = ~clk;
    
    initial begin
        rst = 1;
        en = 1;
        clk = 0;
        #4 rst = 0;
        #100000 $stop;
    end
    
endmodule
