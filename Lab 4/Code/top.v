`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 10:15:22 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input reset,
    input enable,
    input [3:0] select,
    output reg X
    );
    wire clk_out;
    
    counter M0 (
        .clk(clk),
        .reset_n(reset),
        .enable(enable),
        .select(select),
        .done(clk_out)
    );
    
    always@(posedge clk_out)begin
        X = ~X;
    end

    
endmodule
