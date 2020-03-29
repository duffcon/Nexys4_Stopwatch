`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 07:10:22 PM
// Design Name: 
// Module Name: CycleCounter
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

module CycleCounter
#(parameter N = 10**8)(
    input clk,
    input rst,
    output q
    );
    
    reg [31:0] cycle_count;
    reg clock_div;
    
    always @(posedge clk, posedge rst)
    begin
        cycle_count = cycle_count + 1;
        if (rst) begin
            cycle_count = 0; clock_div = 0; end
        else if (cycle_count >= N) begin
            cycle_count = 0; clock_div = ~clock_div; end
    end
    
    assign q = clock_div;
    
endmodule
