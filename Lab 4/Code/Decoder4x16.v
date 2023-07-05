`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 10:11:52 PM
// Design Name: 
// Module Name: Decoder4x16
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


module Decoder4x16 (input [3:0] select, output reg [29:0] out);

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

endmodule
