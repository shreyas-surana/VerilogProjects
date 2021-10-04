`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 08:06:55 PM
// Design Name: 
// Module Name: adder_subtractor
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


module adder_subtractor
#(parameter n = 4)
(
    input [n-1:0] x,
    input [n-1:0] y,
    input add_n,
    output[n-1:0] s,
    output c_out,
    output overflow
    );
    wire [n-1:0] xored_y;
    generate
        genvar k;
        
        for (k = 0; k<n; k=k+1)
        begin: bit
        assign xored_y[k] = y[k] ^ add_n;
        end
    endgenerate
    
    rca_nbit #(.n(n)) A0 (
    .x(x),
    .y(xored_y),
    .c_in(add_n),
    .s(s),
    .c_out(c_out)
    );
    
    assign overflow = (x[n-1] & xored_y[n-1] & ~s[n-1]) | (~x[n-1] & ~xored_y[n-1] & s[n-1]);
    
    
endmodule