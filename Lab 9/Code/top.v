`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2021 10:25:59 AM
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
            input read, 
            input write, 
            
            input [15 : 0] sel,
            //input [31 : 0] sft,
            input rx,
            input tx,
            
            output wire [6:0] a_to_g,
            output wire [7:0] an,
            output wire dp,
            output wire rx_empty,
            output wire tx_full
          );
          
//         wire clk_div; 
//         clk_divider  GEN    (
//                              .clk(clk),
//                              .rst(rst),
//                              .SW(SW), 
//                              .clk_div(clk_div)
//                              ); 
      
         wire [31:0] TMP;                 
         wire btn_rd, btn_wr;
         
          toggle_btn READ(
                    .clk(clk), 
                    .rst(rst),
                    .button(read), 
                    .out(btn_rd)
                  );
                  
          toggle_btn WRITE(
                    .clk(clk), 
                    .rst(rst),
                    .button(write), 
                    .out(btn_wr)
                  );
                  
          wire [7:0] r_data;        
          
          uart #(.DBIT(8), .SB_TICK(16) )   UART_DRIVER  
                    (
                        .clk(clk), 
                        .reset_n(~rst),
                        
                        // receiver port
                        .r_data(r_data),
                        .rd_uart(btn_rd),
                        .rx_empty(rx_empty),
                        .rx(rx),
                        
                        // transmitter port
                        //input [DBIT - 1: 0] w_data,
                        .wr_uart(btn_wr),
                        .tx_full(tx_full),
                        .tx(tx),
                        
                        // baud rate generator
                        .TIMER_FINAL_VALUE(11'd650)
                    );
          
          bcd_32  BCD    (
                          .clk(clk),  //was clk_div
                          .rst(rst),
                          //.en(enbl),
                          //.upd(updwn),
                          .sel(sel),
                          .sft(r_data),
                          .count(TMP)
                         );
                          
          sdd_gen   SSD   (
                           .SW(TMP),
                           .clk(clk),
                           .rst(rst),
                           .a_to_g(a_to_g),
                           .an(an),
                           .dp(dp)
                          );                 
          
endmodule
