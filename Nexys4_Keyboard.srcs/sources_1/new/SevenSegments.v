`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 10:16:41 AM
// Design Name: 
// Module Name: SevenSegments
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


module SevenSegments(
    input clk,
    input rst,
    input [3:0] sw,
    output [6:0] seg,
    output [7:0] an

    );
    
    wire clk_div0;
    
    NumberToSegment NumToSeg_inst (sw, seg);
    CycleCounter #(10**6) count_inst0 (clk, rst, clk_div0);
    ShiftReg #(8) ShiftReg_inst (clk_div0, rst, an);
    

    
    
    
endmodule
