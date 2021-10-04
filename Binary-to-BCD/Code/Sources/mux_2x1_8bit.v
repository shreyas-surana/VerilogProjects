`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2021 12:16:22 AM
// Design Name: 
// Module Name: mux_2x1_8bit
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


module mux_2x1_8bit(
input [7:0] x, y,
input s,
output [7:0] m
    );
    mux_2x1_simple M0 (x[0], y[0], s, m[0]);
    mux_2x1_simple M1 (x[1], y[1], s, m[1]);
    mux_2x1_simple M2 (x[2], y[2], s, m[2]);
    mux_2x1_simple M3 (x[3], y[3], s, m[3]);
    mux_2x1_simple M4 (x[4], y[4], s, m[4]);
    mux_2x1_simple M5 (x[5], y[5], s, m[5]);
    mux_2x1_simple M6 (x[6], y[6], s, m[6]);
    mux_2x1_simple M7 (x[7], y[7], s, m[7]);
    
    
    
endmodule
