`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 07:51:32 PM
// Design Name: 
// Module Name: add_3
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


module add_3(
    input [3:0] A,
    //output [3:0] S,
    output reg [3:0] S
    );
    always @(A)
    begin
        case(A)
        4'b0000: S = 4'b0000;
        4'b0001: S = 4'b0001;
        4'b0010: S = 4'b0010;
        4'b0011: S = 4'b0011;
        4'b0100: S = 4'b0100;
        4'b0101: S = 4'b1000;
        4'b0110: S = 4'b1001;
        4'b0111: S = 4'b1010;
        4'b1000: S = 4'b1011;
        4'b1001: S = 4'b1100;
        default: S = 4'b0000;
        endcase
    end
endmodule