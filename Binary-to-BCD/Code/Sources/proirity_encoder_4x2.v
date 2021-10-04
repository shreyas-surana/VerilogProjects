`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 05:46:16 PM
// Design Name: 
// Module Name: proirity_encoder_4x2
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


module proirity_encoder_4x2(
    input [3:0] w,
    output z,
    output reg [1:0] y
    );
    
    assign z = |w;
    
    always @(w)
    begin 
        y = 2'bxx;
        
        if(w[3])
            y = 2'b11;
        else if (w[2])
            y = 2'b10;
        else if (w[1])
            y = 2'b01;
        else 
            y = 2'bxx;
                    
            
            
    
    end
    
endmodule
