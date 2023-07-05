`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 02:44:20 PM
// Design Name: 
// Module Name: first_project
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


module first_project(
    input [3:0] x, [3:0] y, 
    input selectone, selecttwo,
    output [3:0] right, [3:0] left
    );
    wire [3:0] temp1;
    
    mux_2x1_simple H1 (
        .x1(x[0]),
        .x2(y[0]),
        .a(selectone),
        .f(temp1[0])
    );
    mux_2x1_simple H2 (
        .x1(x[1]),
        .x2(y[1]),
        .a(selectone),
        .f(temp1[1])
    );
    mux_2x1_simple H3 (
        .x1(x[2]),
        .x2(y[2]),
        .a(selectone),
        .f(temp1[2])
    );
    mux_2x1_simple H4 (
        .x1(x[3]),
        .x2(y[3]),
        .a(selectone),
        .f(temp1[3])
    );
    demux_1x2_simple P1 (
        .x1(temp1[0]),
        .a(selecttwo),
        .y1(right[0]),
        .y2(left[0])
    );
    demux_1x2_simple P2 (
        .x1(temp1[1]),
        .a(selecttwo),
        .y1(right[1]),
        .y2(left[1])
    );
    demux_1x2_simple P3 (
        .x1(temp1[2]),
        .a(selecttwo),
        .y1(right[2]),
        .y2(left[2])
    );
    demux_1x2_simple P4 (
        .x1(temp1[3]),
        .a(selecttwo),
        .y1(right[3]),
        .y2(left[3])
    );
endmodule
