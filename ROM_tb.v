`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 02:36:54 PM
// Design Name: 
// Module Name: ROM_tb
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


module ROM_tb();
    reg [2:0]addr;
    wire [3:0] data;
    
    Four_bit_ROM rommmm(.ROM_data(data), .ROM_addr(addr));
    initial
    begin
        addr = 0;
        #10;
        addr = 1;
        #10;
        addr = 2;
        #10;
        addr = 3;
        #10;
        addr = 4;
        #10;
        addr = 5;
        #10;
        addr = 6;
        #10;
        addr = 7;
        #10;
    $finish;
    end
    
endmodule
