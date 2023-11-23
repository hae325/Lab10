`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 02:10:09 PM
// Design Name: 
// Module Name: Ram_tb
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


module Ram_tb();

    reg  i_clk, i_rst, i_write_en;
    reg [2:0] i_addr;
    reg [7:0] i_write_data;
    wire [7:0] o_read_data;
    
    Eight_bit_Ram rmmm(.i_clk(i_clk), .i_rst(i_rst), .i_write_en(i_write_en), .i_addr(i_addr), .i_write_data(i_write_data), .o_read_data( o_read_data));
    initial
    begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk;
    end
    
    
    initial 
    begin 
        i_rst = 1;
        #10;
        i_rst = 0;
        i_write_en = 1;
        i_addr = 0;
        i_write_data = 5;
        #10;
        i_addr = 1;
        i_write_data = 6;
        #10;
        i_addr = 2;
        i_write_data = 7;
        #10;
        i_write_en = 0;
        i_addr = 1;
        #10;
        i_addr = 0;
        #10;
        i_addr = 2;
        #10;
    $finish;
    end 
        
    
endmodule
