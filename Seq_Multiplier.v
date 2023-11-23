`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 02:02:44 PM
// Design Name: 
// Module Name: Seq_Multiplier
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


module Seq_Multiplier(input clk, input rst, input [3:0] operand_a, input [3:0] operand_b, output reg [7:0] product);
//the two inputs are 4 bits and the product has 8 bits

    parameter S0_idle = 3'b000 , S1_multiply = 3'b001 , S2_update_result = 3'b010 ; //these are the parameters for state encoding
    reg [2:0] CS,NS; //current and next state indicate which state we are on.
    reg[7:0] partial_product, shift_count, multiplicand, operand_bb; //these are used in the multiplier to compute the multiplication. 8 bit registers.
  
    always @(posedge clk)
    begin
        if(rst==1) 
            CS <= S0_idle;// when reset=1, reset the CS of the FSM to "S0" CS
         else
            CS <= NS; // otherwise, next CS
    end 
    
    
    always@* //the * means it triggers for any change between the current state and reset.
    begin
        case({CS,rst}) //different cases depending on if the current state or reset change.
        S0_idle: //changes to the next state in this case
            begin
            partial_product <= 8'b0; //this will get the final product
            shift_count <= 3'b0; //counts the number of shifts happening
            multiplicand <= {4'b0, operand_a}; //shifted left by 4 bits
            operand_bb <= operand_b;
            NS = S1_multiply; 
            end
        S1_multiply: //changes to state two in this case
        begin
        NS = S2_update_result;
            if((operand_bb[0] == 0) && (shift_count < 4)) //if these conditions are true it performs a shift operation
            begin
                partial_product <= partial_product;
                shift_count <= shift_count + 3'b1;
                multiplicand <= multiplicand <<1;
                operand_bb <= operand_bb>>1; //right shift by 1 bit which is dividing it by 2.
                end
            else if ((operand_bb[0] == 1) && (shift_count < 4)) //if this is true it adds the current multiplicand to the partial product.
            begin
                partial_product <= partial_product + multiplicand;
                shift_count <= shift_count + 3'b1;
                multiplicand <= multiplicand <<1; //left shift by 1 bit which is multiplying it by 2.
                operand_bb <= operand_bb>>1;
            end
        end
    
    S2_update_result: //this checks if the shift is 4 then change the product otherwise it goes back to the previous state.
    begin
        if(shift_count ==4) //if there have been 4 shifts then it updates the final product. Otherwise it goes back to the previous state and keeps going.
        begin
            NS = S2_update_result;
            product <= partial_product;
        end
        else 
        begin
                NS = S1_multiply;
            end
            end
            endcase
            end
    endmodule
