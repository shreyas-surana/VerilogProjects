`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 05:34:34 PM
// Design Name: 
// Module Name: sseg_test
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


module sseg_test(
    input [3:0] hex,
    input [7:0] SW,
    input decimal_point,
    output DP,
    output [7:0] AN,
    output [6:0] sseg
    );
    
    assign AN = SW;
    assign DP = decimal_point;
    
    hex2sseg BO (
    .hex(hex),
    .sseg(sseg)
    
    );
    
    
endmodule
