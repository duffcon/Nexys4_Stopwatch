`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 11:21:22 AM
// Design Name: 
// Module Name: tb_ShiftReg
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


module tb_ShiftReg;
    
    reg clk;
    reg rst;
    wire [7:0] q;
    
    ShiftReg #(8) mod0(clk, rst, q);
    
    always
        #1 clk = ~clk;
    
    initial begin
        rst = 1; clk = 0;
        #4 rst = 0;
        #100 $stop;
    end
    
endmodule
