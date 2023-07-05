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


module counter#(parameter SIZE=4)
                (
                input clk,
                input rst,
                output reg [SIZE-1:0] op
                );
                always@(posedge clk or posedge rst)
                begin: counting_gen
                    if(rst)
                        begin
                        op <=0;
                        end
                     else
                        op <= op + 1;
                    end
endmodule
