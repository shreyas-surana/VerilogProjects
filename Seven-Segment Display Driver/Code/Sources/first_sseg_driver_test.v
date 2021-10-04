`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 09:52:19 PM
// Design Name: 
// Module Name: first_sseg_driver_test
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


module first_sseg_driver_test(
//        input [2:0] x,
        input dp_ctrl,
        input clk,
//        input [2:0] FINAL_VALUE,
        //input up,
//        input load,
        output DP,
        output [6:0] sseg,
        output [7:0] AN
        //output [2:0] counter_result

        );
        wire done;
        wire [2:0] counter_result;
        wire [3:0] temp;
//        assign DP = dp_ctrl;
        assign temp = {0, counter_result[2:0]};
        

        timer_input (
            .clk(clk),
            .reset_n(1'b0),
            .enable(1'b1),
            .FINAL_VALUE(1000),
            .done(done)
        );
        
        udl_counter (
            .clk(clk),
            .reset_n(1'b0),
            .enable(done),
            .up(1'b1), //when asserted the counter is up counter; otherwise, it is a down counter
            .load(1'b0),
            .D(3'b000),
            .Q(counter_result)
        );

        first_sseg_driver (
            .active_digit(temp),
            .num(counter_result),
            .dp_ctrl(1'b0),
            .sseg(sseg), 
            .AN(AN),
            .DP(DP)
        );
        
        



endmodule
