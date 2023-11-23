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


module Seq_Multiplier_tb();
 reg  clk, rst;
 reg[3:0] operand_a;
 reg[3:0] operand_b;
 wire[7:0] product;
    
    Seq_Multiplier uut(.clk(clk), .rst(rst), .operand_a(operand_a), .operand_b(operand_b), .product(product));
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    
    initial 
    begin 
    rst = 1;
    //#10
    //rst = 0;
    operand_a = 4'b0011; //3
    operand_b = 4'b0010; //2 want to multiply 3x2.
    #10
    rst = 0; //applied the reset.
    end
    
    initial
    begin
    rst = 1;
    operand_a = 4'b0100; //4
    operand_b = 4'b0010; //2 want to multiply 4x2.
    #10
    rst = 0;
    
   
    $finish;
    end 
        
endmodule
