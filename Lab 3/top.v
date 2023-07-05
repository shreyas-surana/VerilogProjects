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
 //   input [3:0] FINAL_VALUE,

//    output reg clk_div,
    output [15:0] X
    );
    wire [3:0] temp;
    
    counter M0 (
        .clk(clk),
        .rst(reset),
        .op(temp)
    );
    Decoder4x16 M1 (
        .select(temp),
        .out(X)
    );
    
    
endmodule
