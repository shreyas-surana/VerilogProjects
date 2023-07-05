`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 02:00:06 PM
// Design Name: 
// Module Name: mux_2x1_simple
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


module mux_2x1_simple
(
input x1,
input x2,
input a,
output f
    );
    not (an, a);
    and A0 (g0, x1, an);
    and A1 (g1, x2, a);
    or O0 (f, g0, g1);
endmodule


