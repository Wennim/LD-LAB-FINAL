`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 11:21:13 PM
// Design Name: 
// Module Name: card_processor
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


module card_processor(
    input [5:0]card_bit,
    output reg [1:0]card_flower,
    output reg [3:0]card_number
    );

always@* begin
   card_flower = card_bit / 13;
   card_number = card_bit % 13;
end

endmodule
