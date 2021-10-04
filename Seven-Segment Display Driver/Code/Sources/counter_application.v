`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 01:26:00 AM
// Design Name: 
// Module Name: counter_application
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


module counter_application(
    input [7:0] bin,
    input clk,
    input up,
    input down,
    input middle,
    input reset_n,
    output [7:0] AN,
    output [6:0] sseg,
    output DP
    );
    
    wire up1;
    wire down1;
    wire middle1;
    wire reset;
    wire [7:0] bin1;
    wire [11:0] bcd1;
    
    button first (clk, up, up1);
    button second (clk, middle, middle1);
    button third (clk, down, down1);
    button fourth (clk, ~reset_n, reset);
    
    
    simple_register_generic #(.N(8)) SRLSR(
            .clk(clk),
            .load(middle1),
            .reset_n(~reset),
            .set(1'b0),
            .add(up1),
            .sub(down1),
            .D(bin),
            .Q(bin1)
    );
    
    bin2bcd B2D(
        .bin(bin1),
        .bcd(bcd1)
    );
    
    sseg_driver sseg1 (
    
        .clk(clk),
        .in0({1'b1, bcd1[11:8], 1'b0}),
        .in1({1'b1, bcd1[7:4], 1'b0}),
        .in2({1'b1, bcd1[3:0], 1'b0}),
        .in3(6'b000000),
        .in4(6'b000000),
        .in5(6'b000000),
        .in6(6'b000000),
        .in7(6'b000000),
        .sseg(sseg),
        .AN(AN)
        

    );
    
endmodule
