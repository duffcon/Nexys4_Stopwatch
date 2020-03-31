`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 07:48:01 PM
// Design Name: 
// Module Name: DigitFlipFlop
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


module DigitFlipFlop
#(parameter N = 9)(
    input clk,
    input rst,
    input en,
    output [3:0] q,
    output tick
    );
    
    reg [3:0] q_reg;
    reg [3:0] q_prev;
    reg tick_reg;
    
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            q_reg = 0;
            q_prev = 0;
            tick_reg = 0;
        end
        else if (en) begin
                q_prev = q_reg;
                q_reg = (q_reg == N) ? 0 : q_reg + 1;
                if (q_prev == N) begin
                    tick_reg = 1;
                end
                else begin
                    tick_reg = 0;
                end

         end
    end
    
    assign q = q_reg;
    assign tick = tick_reg;
    
endmodule
