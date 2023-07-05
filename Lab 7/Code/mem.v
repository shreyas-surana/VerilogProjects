`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 08:13:53 PM
// Design Name: 
// Module Name: mem
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


module mem#(parameter DATA = 4, parameter ADDR = 3)
(
    input clk, wr, rd, [ADDR-1:0]addr_wr, [ADDR-1:0]addr_rd,[DATA-1:0] data_in,
    output reg [DATA-1:0]data_out 
);
    localparam RAM = 1 <<ADDR;

    // Internal Variables
    reg [DATA-1:0] mem[0:RAM-1];
    // Memory write block
    // Writing operation
    always@(posedge clk)
    begin: mem_write
    if (wr)
        mem[addr_wr] = data_in;
    end 
        // Memory write block
    // Writing operation
    always@(posedge clk)
    begin: mem_read
    if (rd)
        data_out = mem[addr_rd];
    end 
endmodule
