`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 10:38:42 AM
// Design Name: 
// Module Name: ShiftReg
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


module ShiftReg
#(parameter N = 4)(
    input clk,
    input rst,
    output [N-1:0] q
    );
    
    reg [N-1:0] q_reg;
    reg end_bit;
    
    always @(posedge clk, posedge rst) begin
        if (rst)
            q_reg = 'hFFFE;
        else begin
            end_bit = q_reg[N-1];
            q_reg = q_reg << 1;
            q_reg[0] = end_bit;            
        end
    end
    
    assign q = q_reg;
endmodule
