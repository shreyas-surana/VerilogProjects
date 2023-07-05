`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 08:01:50 PM
// Design Name: 
// Module Name: barrel_Shifter
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


module barrel_Shifter(
    input [3:0] I,
    input [1:0] S,
    output [3:0] P
    );
    wire [3:0] V;

    mux_2to1 m1 (I[0],  I[1],S[0], V[0]);
    mux_2to1 m2 (I[1],  I[2],S[0],  V[1]);
    mux_2to1 m3 (I[2],  I[3], S[0], V[2]);
    mux_2to1 m4 (I[3],  I[0], S[0], V[3]);
    mux_2to1 m5 (V[0],  V[2], S[1], P[0]);
    mux_2to1 m6 (V[1],  V[3], S[1], P[1]);
    mux_2to1 m7 (V[2],  V[0], S[1], P[2]);
    mux_2to1 m8 (V[3],  1'b1, S[1], P[3]);
    
endmodule
