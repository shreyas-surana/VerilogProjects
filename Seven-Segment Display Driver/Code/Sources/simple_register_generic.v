`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 01:41:48 AM
// Design Name: 
// Module Name: simple_register_generic
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


module simple_register_generic
#(parameter N = 4)(
        input clk,
        input load,
        input reset_n,
        input set,
        input add,
        input sub,
        input [N - 1:0] D,
        output [N - 1:0] Q        
    );
    reg [N - 1:0] Q_reg, Q_next;
    
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // Next State logic
    always @(load, D, Q_reg, reset_n, set, add, sub)
    begin
        if (~reset_n)
            Q_next = 'b0;
        else if (set)
            Q_next = -'b1;
        else if (load)
            Q_next = D;
        else if (add)
            Q_next = Q_reg + 1;
        else if (sub)
            Q_next = Q_reg - 1;
        else
            Q_next = Q_reg;
    end
    
    // Output logic
    assign Q = Q_reg;

endmodule
