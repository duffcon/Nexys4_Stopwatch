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


module Nexys4_StopWatch(
    input clk,
    input btnC,
    input btnD,
    input [3:0] sw,
    output [6:0] seg,
    output [7:0] an,
    output dp
    );
    

    
    reg state_reg = 0;
    wire btn_c;
    wire btn_d;
    
    SevenSegments SevSeg_inst (clk, btnC, state_reg, seg, an[3:0], dp);
    ButtonBuffer btnd_inst(clk, btnC, btnD, btn_d);
   
    assign an[7:4] = 4'b1111;
    
    always@(posedge btn_d, posedge btnC) begin
        if (btnC)
            state_reg = 0;
        else
            state_reg = state_reg + 1;  
    end
    
    
endmodule
