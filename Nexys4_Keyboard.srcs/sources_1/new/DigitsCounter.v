`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:19:58 AM
// Design Name: 
// Module Name: DigitsCounter
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


module FourDigitCounter(
    input clk,
    input rst,
    input en,
    output [3:0] d0,
    output [3:0] d1,
    output [3:0] d2,
    output [3:0] d3
    );
    
    localparam N = 9;
    
    wire [3:0] tick;
    wire [3:0] d_clk;
    
    DigitFlipFlop #(N) digit0 (clk, rst, en, d0, tick[0]);
    DigitFlipFlop #(N) digit1 (d_clk[1], rst, en, d1, tick[1]);
    DigitFlipFlop #(N) digit2 (d_clk[2], rst, en, d2, tick[2]);
    DigitFlipFlop #(N) digit3 (d_clk[3], rst, en, d3, tick[3]);
    
    assign d_clk[1] = tick[0];
    assign d_clk[2] = tick[1] && tick[0];
    assign d_clk[3] = tick[2] && tick[1] && tick[0];
    
endmodule
