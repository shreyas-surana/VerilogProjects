`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 02:24:04 PM
// Design Name: 
// Module Name: demux_1x2_simple
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


module demux_1x2_simple
(
    input x1, 
    input a,
    output y1, 
    output y2
    );
    not(an, a);
    and A0 (y1, x1, a);
    and A1 (y2, x1, an);
endmodule
