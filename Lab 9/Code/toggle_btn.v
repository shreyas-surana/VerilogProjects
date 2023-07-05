`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 10:15:34 PM
// Design Name: 
// Module Name: toggle_btn
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


module toggle_btn(
    input clk,
    input rst,
    input button,
    output out
    );

    localparam N = 3;

    reg [N - 1:0] Q_reg, Q_next;

    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end

    // Next state logic
    always @(Q_reg, button)
    begin
        // Right shift
        Q_next = {button, Q_reg[N - 1:1]};
    end

    // Output logic
    assign out = (&Q_reg[N - 1:1]) & ~Q_reg[0];
endmodule
