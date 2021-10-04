`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 07:26:52 PM
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd(
        input [7:0] bin,
        output [11:0] bcd
    );
    wire zero;
    wire [3:0] w1, w2, w3, w4, w5, w6, w7, a1, a2, a3, a4, a5, a6, a7;
    
    assign zero =0;
    assign w1 = {1'b0, bin[7:5]};
    assign w2 = {a1[2:0], bin[4]};
    assign w3 = {a2[2:0], bin[3]};
    assign w4 = {a3[2:0], bin[2]};
    assign w5 = {a4[2:0], bin[1]};
    assign w6 = {1'b0, a1[3], a2[3], a3[3]};
    assign w7 = {a6[2:0], a4[3]};
    
    add_3 m1(w1,a1);
    add_3 m2(w2,a2);
    add_3 m3(w3,a3);
    add_3 m4(w4,a4);
    add_3 m5(w5,a5);
    add_3 m6(w6,a6);
    add_3 m7(w7,a7);
    
    //assign bcd = {a5[2:0], bin[0], a7[2:0], a5[3], a6[3], a7[3], zero, zero};
    assign bcd = {zero, zero, a6[3], a7[3], a7[2], a7[1], a7[0],a5[3], a5[2], a5[1], a5[0], bin[0]};
    
    
endmodule
