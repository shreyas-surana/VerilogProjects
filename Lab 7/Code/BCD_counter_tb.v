`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2021 04:09:05 PM
// Design Name: 
// Module Name: BCD_counter_tb
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


module BCD_counter_tb();

                    reg clk_tb;
                    reg rst_tb;
                    reg en_in_tb;
                    reg upd_tb;
                    wire [3:0] op_tb;
                    wire en_out_tb;

        bcd_counter T1(
                        .clk(clk_tb),
                        .rst(rst_tb),
                        .en_in(en_in_tb),
                        .upd(upd_tb),
                        .op(op_tb),
                        .en_out(en_out_tb)
                        );
                        
                         initial
                            begin
                                clk_tb=1;
                                forever #5 clk_tb=~clk_tb;
                            end
                
                        initial 
                            begin
                            rst_tb=1;
                            en_in_tb=0;
                            upd_tb=0;
                        #50
                            rst_tb=0;
                            upd_tb=1;
                        #50
                            upd_tb=0;
                        #50
                            upd_tb=1;
                        #50
                            $finish;                             
                        end
       
    
     

endmodule


