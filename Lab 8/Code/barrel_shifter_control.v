`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 09:58:54 PM
// Design Name: 
// Module Name: barrel_shifter_control
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


module barrel_shifter_control(
    input [15:0] S,
    input [31:0] C,
    output [31:0] Count
    );
 
               genvar i;
               
               
               generate 
               
               for (i = 0; i<8 ; i = i+1)
               begin 
               barrel_Shifter(
                    .I(C[4*(i+1)-1:4*i]),
                    .S(S[2*(i+1)-1:2*i]),
                    .P(Count[4*(i+1)-1:4*i])
               );
               
               
               /*
               bcd_counter  UNIT  (
                                    .clk(clk),
                                    .rst(rst),
                                    .en_in(tmp[i]), 
                                    .upd(upd),
                                    .op(count [4*(i+1)-1 : 4*i]),
                                    .en_out(tmp[i+1])
                                   ); 
                                   */
             end 
             endgenerate    
endmodule
