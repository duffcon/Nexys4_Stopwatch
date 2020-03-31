`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 10:18:04 PM
// Design Name: 
// Module Name: ButtonBuffer
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


module ButtonBuffer(
    input clk,
    input rst,
    input d,
    output q
    );
    
    reg [7:0] count;
    reg q_reg = 0;
    
    always @(posedge clk) begin
        if (d) begin
            count = {count[6:0], 1'b1};
        end
        else begin
            count = count << 1;
        end
        if (count == 8'hFF) begin
            q_reg = 1;
        end
        else begin
            q_reg = 0;
        end
        
    end
    
    assign q = q_reg;
endmodule
