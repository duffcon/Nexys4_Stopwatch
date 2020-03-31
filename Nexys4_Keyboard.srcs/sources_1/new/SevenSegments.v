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
    input en,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    wire clk_div_100;
    wire clk_div_10;
    wire [3:0] d0;
    wire [3:0] d1;
    wire [3:0] d2;
    wire [3:0] d3;
    wire [3:0] digit;
    
    reg [1:0] digit_counter;
    
    NumberToSegment NumToSeg_inst (digit, seg);
    CycleCounter #(10**5) count_inst0 (clk, rst, clk_div_100);
    CycleCounter #(5*(10**6)) count_inst1 (clk, rst, clk_div_10);
    ShiftReg #(4) ShiftReg_inst (clk_div_100, rst, an);
    FourDigitCounter (clk_div_10, rst, en, d0, d1, d2, d3);

    
    always @(posedge clk_div_100, posedge rst) begin
        if (rst)
            digit_counter = 0;
        else begin
            digit_counter = digit_counter + 1;
        end
    end
    
    assign digit = (digit_counter == 0) ? d0 :
    (digit_counter == 1) ? d1 :
    (digit_counter == 2) ? d2 :
                           d3;
                           
    assign dp = (digit_counter == 1) ? 1'b0 : 1'b1;
    
    

    
    
    
endmodule
