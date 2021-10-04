`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 11:50:04 PM
// Design Name: 
// Module Name: first_sseg_driver_test
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


module first_sseg_driver_test(
    input [2:0] active_digit,
    input DP_ctrl,
    output DP,
    output z,
    output [6:0] s,
    output reg [7:0] AN
    );
    assign DP = DP_ctrl;
    
    first_sseg_driver SG0 (
        .num(active_digit),
        .x(z),
        .s(s)
    );
    
    always @(active_digit)
    begin
        AN = 8'b11111111;
        
        if(active_digit == 0)
            AN[0] = 0;
        else if(active_digit == 1)
            AN[1] = 0;
        else if(active_digit == 2)
            AN[2] = 0;
        else if(active_digit == 3)
            AN[3] = 0;
        else if(active_digit == 4)
            AN[4] = 0;
        else if(active_digit == 5)
            AN[5] = 0;
        else if(active_digit == 6)
            AN[6] = 0;
        else
            AN[7] = 0;
    end
endmodule