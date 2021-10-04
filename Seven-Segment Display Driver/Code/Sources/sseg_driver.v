`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 10:53:40 PM
// Design Name: 
// Module Name: sseg_driver
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


module sseg_driver(
    input clk,
    input [5:0] in0,in1,in2,in3,in4,in5,in6,in7,
    output [6:0] sseg,
    output [7:0] AN
    );

    wire done;
    wire [2:0] NumOut;
    wire [5:0] mux;

    timer_input (
        .clk(clk),
        .reset_n(1'b1),
        .enable(1'b1),
        .FINAL_VALUE(),
        .done(done)
    );

    udl_counter #(.BITS(3)) (
        .clk(clk),
        .reset_n(1'b1),
        .enable(done),
        .up(1'b1),
        .load(1'b0),
        .D(3'b000),
        .Q(NumOut)
    );

    mux_8x1 #(.N(6))(
       .w0(in0),
       .w1(in1),
       .w2(in2),
       .w3(in3),
       .w4(in4),
       .w5(in5),
       .w6(in6),
       .w7(in7),
       .S(NumOut),
       .f(mux)
    );

     first_sseg_driver (
            .active_digit(mux[4:1]),
            .num(NumOut),
            .dp_ctrl(mux[5]),
            .sseg(sseg),
            .AN(AN),
            .DP(DP)
            );

endmodule
