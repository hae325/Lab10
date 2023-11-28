`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/23/2023 01:06:54 PM
// Design Name:
// Module Name: Seq_Multiplier_tb
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

//module Seq_Multiplier(input clk, input rst, input [3:0] operand_a, input [3:0] operand_b, output reg [7:0] product, output reg [2:0] st_out);
//the two inputs are 4 bits and the product has 8 bits


module Seq_Multiplier_tb();
 reg clk, reset;
 reg[3:0] operand_a;
 reg[3:0] operand_b;
 wire[7:0] product;
 //wire[2:0] st_out;
   
    Seq_Multiplier uut(.clk(clk), .reset(reset), .operand_a(operand_a), .operand_b(operand_b), .product(product));
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
   
   
    initial
    begin
    reset = 1;
    #10
     reset = 0;
    operand_a = 4'b0011; //3
    operand_b = 4'b0110; //6 want to multiply 3x6.
    #30
     reset = 1;
    #10
     reset = 0;
    operand_a = 4'b0100; //4
    operand_b = 4'b0010; //2 want to multiply 4x2.
    #30
     reset = 0;
   
   
    $finish;
    end
       
endmodule
