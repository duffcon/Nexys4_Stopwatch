`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 10:34:51 PM
// Design Name: 
// Module Name: tb_ButtonBuffer
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


module tb_ButtonBuffer;

    reg clk;
    reg rst;
    reg d;
    wire q;
    
    ButtonBuffer btnd_inst(clk, rst, d, q);
    
    initial begin
        rst = 1;
        clk = 0;
        d = 0;
        #2 rst = 0;
        #5 d = 1;
        #7 d = 0;
        #8
        d = 1; #22 
        d = 0; #22
        d = 1; #22 
        d = 0; #22
        $stop;
    end
    
    always
        #1 clk = ~clk;
endmodule
