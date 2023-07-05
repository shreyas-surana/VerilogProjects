`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2021 03:15:08 PM
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

        input [3:0] num,
        input dp_ctrl,
        output [6:0] sseg, 
        output [7:0] AN,
        output DP
    );
    assign AN = 8'b11111110;
    
    assign DP = dp_ctrl;

    hex2sseg HS (
        .hex(num),
        .sseg(sseg)
    );

endmodule
