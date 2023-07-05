`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 07:22:29 PM
// Design Name: 
// Module Name: top
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


module top(
            input clk,
            input rst,
            //input [4:0] SW, 
            input [15:0] S,
            input enable, 
            input upd, 
            output wire [6:0] sseg,
            output wire [7:0] AN,
            output wire DP
          );
         wire [4:0] SW;
         wire clk_div; 
         
         
         clk_divider  GEN    (
                              .clk(clk),
                              .rst(rst),
                              .SW(SW), 
                              .clk_div(clk_div)
                              ); 
          
         wire [31:0] TMP;                 

          bcd_32  BCD    (
                          .clk(clk_div),
                          .rst(rst),
                          .en(enable),
                          .upd(upd),
                          .count(TMP)
                          );
         wire [31:0] TMP2;
         barrel_shifter_control  BSC   (
                                        .S(S),
                                        .C(TMP),
                                        .Count(TMP2)
         );
                          
                          
         sdd_gen   SSD   (
                           .SW(TMP2),
                           .clk(clk),
                           .rst(rst),
                           .a_to_g(sseg),
                           .an(AN),
                           .dp(DP)
                          );                 
          
endmodule
