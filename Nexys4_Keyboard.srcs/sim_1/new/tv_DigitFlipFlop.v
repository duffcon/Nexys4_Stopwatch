`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 09:59:44 AM
// Design Name: 
// Module Name: tv_DigitFlipFlop
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


module tb_DigitFlipFlop;
    
    reg clk;
    reg rst;
    reg en;
    wire [3:0] d0;
    wire [3:0] d1;
    wire [3:0] d2;
    wire [3:0] d3;
    
    FourDigitCounter mod_inst0 (clk, rst, en, d0, d1, d2, d3);
    
    always
        #1 clk = ~clk;
      
    initial
    begin
        clk = 0; rst = 1;
        #4 rst = 0;
        en = 1; #50
        en = 0; #10
        en = 1; #50
        #500
        $stop;
//        
    end


endmodule
