`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2021 12:01:40 AM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
input [3:0] x, y, 
input [1:0] op_sel,
output [7:0] result,
output overflow, carry_out
    );
    
    wire c;
    wire [7:0] as, mu;
    
    
    
    adder_subtractor_nbit AS (x, y, c, as, carry_out, overflow);
    
    csa_multiplier Mult (x, y, mu);
    
    mux_2x1_8bit DE (as, mu, op_sel[1], result);
    
    assign c = op_sel[0] & 1 | ~op_sel[0] & 0;
endmodule
