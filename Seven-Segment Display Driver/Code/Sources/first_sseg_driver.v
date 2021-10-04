`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:50:17 PM
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
    wire [7:0] temp;
    assign DP = dp_ctrl;
    assign AN = ~temp;

    decoder_generic #(.N(3)) D0 (
        .w(active_digit),
        .en(1),
        .y(temp)
    );

    hex2sseg HS (
        .hex(num),
        .sseg(sseg)
    );

endmodule
