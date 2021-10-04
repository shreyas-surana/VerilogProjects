`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 06:19:18 PM
// Design Name: 
// Module Name: decoder_2x4
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


module decoder_2x4(
    input [1:0] w,
    output reg [0:3] y
    );
    
    always @(w)
    begin 
        y = 4'b0000;
        
        if (w == 2'b00)
            y[0] = 1'b1;
        else if (w == 2'b01)
            y[1] = 1'b1;
        else if (w == 2'b10)
            y[2] = 1'b1;
        else if (w == 2'b11)
            y[3] = 1'b1;
        else
            y = 4'b0000;
    end
    
endmodule
