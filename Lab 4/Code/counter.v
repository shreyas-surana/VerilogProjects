`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 10:10:52 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input reset_n,
    input enable,
    input [3:0] select,
    //    output [BITS - 1:0] Q, // we don't care about the value of the counter
    output done
    );

    reg [29:0] out;
    
    always @(select)
begin

        if(select == 4'b0000)
            out <= 10_000_000;
        else if(select == 4'b0001)
            out <=  15_000_000;
        else if(select == 4'b0010)
            out <= 17_000_000;
        else if(select == 4'b0011)
            out <= 20_000_000;
        else if(select == 4'b0100)
            out <= 25_000_000;
        else if(select == 4'b0101)
            out <= 30_000_000;
        else if(select == 4'b0110)
            out <= 35_000_000;
        else if(select == 4'b0111)
            out <= 40_000_000;
        else if(select == 4'b1000)
            out <= 50_000_000;
        else if(select == 4'b1001)
            out <= 60_000_000;
        else if(select == 4'b1010)
            out <= 70_000_000;
        else if(select == 4'b1011)
            out <= 80_000_000;
        else if(select == 4'b1100)
            out <= 90_000_000;
        else if(select == 4'b1101)
            out <= 95_000_000;
        else if(select == 4'b1110)
            out <= 99_000_000;
        else if(select == 4'b1111)
            out <= 100_000_000;
    end
    

    
    reg [29:0] Q_reg, Q_next;
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;
    end
    
    // Next state logic
    assign done = Q_reg == out;

    always @(*)
        Q_next = done? 'b0: Q_reg + 1;
    
    
endmodule
