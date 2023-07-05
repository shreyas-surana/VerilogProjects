`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 08:28:20 PM
// Design Name: 
// Module Name: seq_dtct
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
`define z      2'b00
`define f1   2'b01
`define m1     2'b10
`define s1    2'b11

module seq_dtct(
input clk,
                input rst,
                input in,
                output reg out
                );
                
                reg [1:0] state;
                reg [1:0] next_state;

                
           always @(posedge clk)
            begin
                if (rst) 
                 begin
                   state = `z;
                 end
                else 
                 begin
                  state = next_state;
                 end
            end
                
           always @(state or in)
            begin
             case (state)
              `z:
                begin
                    if (in) 
                     begin
                      next_state = `f1;
                     end
                    else
                     begin
                      next_state = `z;
                     end
                end
              
              `f1:
                begin
                    if (in) 
                     begin
                      next_state = `f1;
                     end
                    else
                     begin
                      next_state = `m1;
                     end
                end
              
              `m1:
                begin
                    if (in) 
                     begin
                      next_state = `s1;
                     end
                    else
                     begin
                      next_state = `z;
                     end
                end
              
              `s1:
                begin
                    if (in) 
                     begin
                      next_state = `f1;
                     end
                    else
                     begin
                      next_state = `z;
                     end
                end
             endcase
            end 
            
           always @(state)
            begin
             case(state)
              `z:    out = 0;
              `f1: out = 0;
              `m1:   out = 0;
              `s1:  out = 1;
             endcase
            end    
                
                
endmodule