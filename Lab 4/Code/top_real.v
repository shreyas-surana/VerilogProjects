`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2021 03:18:39 PM
// Design Name: 
// Module Name: top_real
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


module top_real(
    input clk,
    input reset_n,
    input enable,
    input [3:0] speed,
    output [7:0] AN,
    output [6:0] sseg,
    output DP
    
    );
    
    wire new_clk;
    wire throwaway;
    wire [3:0] temp;
    wire dp;
    assign dp = 1'b1;
    
    top T0 (
    .clk(clk),
    .reset(reset_n),
    .enable(enable),
    .select(speed),
    .X(new_clk)
    );
    
    BCD_counter B0 (
    .clk(new_clk),
    .reset_n(reset_n),
    .enable(enable),
    .done(throwaway),
    .Q(temp)
    );
    
    first_sseg_driver S0 (
    .num(temp),
    .dp_ctrl(dp),
    .sseg(sseg), 
    .AN(AN),
    .DP(DP)
    );
    
endmodule
