`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 10:19:59 AM
// Design Name: 
// Module Name: Top_SevenSegments
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


module Top_SevenSegments(
    input clk,
    input btnC,
    input [3:0] sw,
    output [6:0] seg,
    output [7:0] an
    );
    
    SevenSegments SevSeg_inst (clk, btnC, sw, seg, an);
    
endmodule
