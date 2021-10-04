`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 10:34:39 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
input [3:0]m,q, 
output [7:0]p
);
    wire [17:1] w;
    wire [3:0] m_q0, m_q1, m_q2, m_q3;
    
    mq_4bit and_q0 (m, q[0], m_q0);
    mq_4bit and_q1 (m, q[1], m_q1);
    mq_4bit and_q2 (m, q[2], m_q2);
    mq_4bit and_q3 (m, q[3], m_q3);
    
    assign p[0] = m[0]&q[0];
    
    full_adder FA1(m_q0[1], m_q1[0], 0, p[1], w[1]);
    full_adder FA2(m_q0[2], m_q1[1], m_q2[0], w[2], w[3]);
    full_adder FA3(m_q0[3], m_q1[2], m_q2[1], w[4], w[5]);
    full_adder FA4(0, m_q1[3], m_q2[2], w[6], w[7]);
    
    full_adder FA5(w[2], 0, w[1], p[2], w[8]);
    full_adder FA6(w[4], m_q3[0], w[3], w[9], w[10]);
    full_adder FA7(w[6], m_q3[1], w[5], w[11], w[12]);
    full_adder FA8(m_q2[3], m_q3[2], w[7], w[13], w[14]);
    
    full_adder FA9(w[9], w[8], 0, p[3], w[15]);
    full_adder FA10(w[11], w[10], w[15], p[4], w[16]);
    full_adder FA11(w[13], w[12], w[16], p[5], w[17]);
    full_adder FA12(m_q3[3], w[14], w[17], p[6], p[7]);
    
    
    

    
endmodule
