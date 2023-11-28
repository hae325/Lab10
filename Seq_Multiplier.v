module Seq_Multiplier(


  input clk, reset,

  input [3:0] operand_a,

  input [3:0] operand_b,

  output reg [7:0] product

);

 

 

  

  reg [7:0] multiplicand;

 

  reg [7:0] partial_product;

  reg [2:0] shift_count;

reg [3:0] operand_bb;//= operand_b;

 

  

parameter S0_idle = 0 , S1_multiply = 1 , S2_update_result = 2 ;

reg [1:0] PS,NS ;

 

    always@(posedge clk or posedge reset)

        begin

            if(reset)

                PS <= S0_idle;  

            else   

                PS <= NS ;

        end 

 

 

                              

 

    always@(*)

        begin

            

            case(PS)

                                                         

                                                          S0_idle:begin

                                                          partial_product <= 8'b0;

                                                     shift_count <= 3'b0;

                                          

                                                          multiplicand<= {4'b0,operand_a} ;

                                                          operand_bb<= operand_b;

                                                         

                                          

                                                         

                                                          NS = S1_multiply;

                                                          end

                                                         

                                                          S1_multiply:begin          

                                                          NS = S2_update_result;

                                                                        if ((operand_bb[0]==0 && shift_count <4)) begin

                                                                                      partial_product <= partial_product;

                                                                                      shift_count <= shift_count + 3'b1;

                                                                                      multiplicand <= multiplicand <<1;

                                                                                      operand_bb <=operand_bb>>1;

                                                                                      end

                                                                        else if ((operand_bb[0]==1) && (shift_count <4)) begin

                                                                                      partial_product <= partial_product + multiplicand;

                                                                                      shift_count <= shift_count + 3'b1;

                                                                                      multiplicand <= multiplicand <<1;

                                                                                      operand_bb <=operand_bb>>1;

                                                                        end

                                                           

                                                             

                                                          end

                                                         

                                                          S2_update_result:begin

                                                                        if ( shift_count ==4) begin

                                                                        NS = S2_update_result;

                                                                        product <=partial_product;

                                                                        end

                                                                        else begin

                                                                        NS = S1_multiply;

                                                                        end

                                                                        end

                                                          endcase

                                                         

                                           end      

 

endmodule
