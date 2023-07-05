`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2021 10:40:48 AM
// Design Name: 
// Module Name: bcd_32
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 09:54:20 AM
// Design Name: 
// Module Name: bcd_32
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


module bcd_32 
              (
                input clk,
                input rst,
//                input en,
//                input upd,
                
                input [15 : 0] sel,
                input [31 : 0] sft,
                
                output wire [31:0] count
              );
               //wire [7:0] tmp;     
              // wire [31 : 0] pass;  
               //assign tmp[0] = en;   //tmp[0] = en 

                
               
               genvar i;

               generate 
               
               for (i = 0; i<8 ; i = i+1)       
               begin 
               
               

//               bcd_counter  UNIT  (
//                                    .clk(clk),
//                                    .rst(rst),
//                                    .en_in(tmp[i]), 
//                                    .upd(upd),
//                                    .op(count [4*(i+1)-1 : 4*i]),  
//                                    .en_out(tmp[i+1])              
//                                   ); 
                
//               bcd_counter  UNIT  (
//                                    .clk(clk),
//                                    .rst(rst),
//                                    .en_in(tmp[i]), 
//                                    .upd(upd),
//                                    .op(pass [4*(i+1)-1 : 4*i]),  
//                                    .en_out(tmp[i+1])              
//                                   ); 

                                   
               barrel_Shifter SHIFT(
                                     .I(sft [4*(i+1)-1 : 4*i]),
                                     .S(sel [2*(i+1)-1 : 2*i]),
                                     .P(count [4*(i+1)-1 : 4*i]) 
                                    );                    
                                   
             end 
             endgenerate    
endmodule
