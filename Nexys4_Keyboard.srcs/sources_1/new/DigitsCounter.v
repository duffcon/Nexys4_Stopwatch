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
    output [3:0] d3,
    output [3:0] clock
    );
    
    localparam N = 9;
    
    wire [3:0] t_out;
    wire [3:0] t_in;
    wire [3:0] d_clk;
    
    DigitFlipFlop #(N) digit0 (clk, rst, en, 1, d0, t_out[0]);
    DigitFlipFlop #(N) digit1 (clk, rst, en, d_clk[1], d1, t_out[1]);
    DigitFlipFlop #(N) digit2 (clk, rst, en, d_clk[2], d2, t_out[2]);
    DigitFlipFlop #(N) digit3 (clk, rst, en, d_clk[3], d3, t_out[3]);
    
    assign d_clk[1] = t_out[0];
    assign d_clk[2] = t_out[1] & t_out[0];
    assign d_clk[3] = t_out[2] & t_out[1] & t_out[0];
    
    assign clock = {d_clk[3], d_clk[2], d_clk[1], 0};
//    assign clock = {t_out[3], t_out[2], t_out[1], 0};
    
endmodule
