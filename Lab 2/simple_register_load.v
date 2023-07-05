`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 07:50:34 PM
// Design Name: 
// Module Name: simple_register_load
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


module simple_register_load
 #(parameter N = 16)(
        input clk,
        input load,
        input add_sub,
        input [N - 1:0] I,
        input reset_n,
        output [N - 1:0] Q,
        output c_out,
        output overflow 
    );
    
    reg [N - 1:0] Q_reg, Q_next;
    
    
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // Next State logic
    always @(load, I, reset_n, Q_reg)
    begin
        if (load)
            Q_next = I;
        else if (reset_n)
            Q_next = 'b0;
        else
            Q_next = Q_reg;

    end
    
    // Output logic
    
    adder_subtractor_nbit B1 (I, Q_next, add_sub, Q, c_out, overflow);
    
endmodule