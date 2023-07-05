`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2021 03:55:22 PM
// Design Name: 
// Module Name: bcd_32_tb
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


module bcd_32_tb();
    
    reg clk, rst, en, upd;
    wire [31:0] count;
    
    bcd_32 TB1(
            .clk(clk),
            .rst(rst),
            .en(en),
            .upd(upd),
            .count(count)
    );
    
        //initialize clk
        initial 
            begin: INITIAL_CLK
                clk=1;
            end
        
        //generate clk
        always
            begin:clk_gen
                #10 clk=~clk;  
            end 
            
            //testbench
            initial 
                begin
                    rst = 1;
                    en = 0;
                    upd = 0;
                #1
                    rst = 0;
                #50
                    upd = 1;
                #50
                    upd = 0;
                #50
                   en = 1; 
                #50
                   upd = 1;
                #50
                   upd = 0;
                #50
                    $finish;
            end

endmodule
