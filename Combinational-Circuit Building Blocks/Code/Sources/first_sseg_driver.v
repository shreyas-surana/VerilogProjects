`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 11:37:20 PM
// Design Name: 
// Module Name: first_sseg_driver
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


module first_sseg_driver(
        input [2:0] active_digit,
        input [3:0] num,
        input dp_ctrl,
        
        output [6:0] sseg, 
        output [7:0] AN,
        output DP
    );
    assign dp_ctrl = DP;

    decoder_generic D0 (
        .w(active_digit),
        .en(active_digit),
        .y(AN)
    );

    hex2sseg HS (
        .hex(num),
        .sseg(sseg)
    );

endmodule