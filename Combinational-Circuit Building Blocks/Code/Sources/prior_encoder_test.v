`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 11:14:04 PM
// Design Name: 
// Module Name: prior_encoder_test
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


module prior_encoder_test(
    input [15:0] X,
    output [6:0] F,
    output z,
    output [7:0] AN,
    output DP
    );
    //for 7seg control
    assign AN[2] = 0;   //switch first 7seg on
    assign DP = 1;      //turn off dp`
    
    //for data movement between hex2sseg and priority encoder
    wire [3:0] e;
    
    priority_encoder_generic #(.N(16)) PE0(
        .w(X),
        .z(z),
        .y(e[3:0])
    );
    hex2sseg H0 (
        .hex(e[3:0]),
        .sseg(F[6:0])
    );
endmodule