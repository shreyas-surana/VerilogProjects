`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 09:25:12 PM
// Design Name: 
// Module Name: rca_nbit
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


module rca_nbit
#(parameter n = 4)
(
    input [n-1: 0] x,
    input [n-1: 0] y,
    input c_in,
    output [n - 1: 0] s,
    output c_out
    );
    
    wire [n: 0] c;
    assign c[0] = c_in;
    assign c_out = c[n];
    
    generate 
        genvar k;
        for (k = 0; k < n; k = k+1)
        begin: stage
            full_adder FA (
            .x(x[k]),
            .y(y[k]),
            .c_in(c[k]),
            .s(s[k]),
            .c_out(c[k+1])
            );
        end
    endgenerate
    
    
endmodule
