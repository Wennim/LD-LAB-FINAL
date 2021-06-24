`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 12:15:09 AM
// Design Name: 
// Module Name: is_winner
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
module card_level_detector(
    input is_four_of_a_kind,
    input is_full_house,
    input is_three_of_a_kind,
    input is_two_pair,
    input is_pair,
    input [3:0]same_num_max_num_1,
    input [3:0]same_num_max_num_2,
    input [3:0]same_num_max_num_3,
    input [3:0]same_num_max_num_4,
    input is_flush,
    input [3:0]flush_max_num,
    input is_straight,
    input [3:0]straight_max_num,
    output reg [2:0]card_level=0,
    output reg [3:0]max_num_level_1=0,
    output reg [3:0]max_num_level_2=0,
    output reg [3:0]max_num_level_3=0,
    output reg [3:0]max_num_level_4=0
);

always@* begin
    if(is_four_of_a_kind==1)begin
        card_level=7;
        max_num_level_1=same_num_max_num_1;
    end

    else if(is_full_house==1)begin
        card_level=6;
        max_num_level_1=same_num_max_num_1;
        max_num_level_2=same_num_max_num_2;
    end

    else if(is_flush==1)begin
        card_level=5;
        max_num_level_1=flush_max_num;
    end

    else if(is_straight==1)begin
        card_level=4;
        max_num_level_1=straight_max_num;
    end

    else if(is_three_of_a_kind==1)begin
        card_level=3;
        max_num_level_1=same_num_max_num_1;
        max_num_level_2=same_num_max_num_2;
        max_num_level_3=same_num_max_num_3;
    end

    else if(is_two_pair==1)begin
        card_level=2;
        max_num_level_1=same_num_max_num_1;
        max_num_level_2=same_num_max_num_2;
        max_num_level_3=same_num_max_num_3;
    end

    else if(is_pair==1)begin
        card_level=1;
        max_num_level_1=same_num_max_num_1;
        max_num_level_2=same_num_max_num_2;
        max_num_level_3=same_num_max_num_3;
        max_num_level_4=same_num_max_num_4;
    end

    else begin
        card_level=0;
        max_num_level_1=same_num_max_num_1;
        max_num_level_2=same_num_max_num_2;
    end
end
endmodule

module is_winner(
    input [2:0]card_level_player_1,
    input [3:0]max_num_1_p1,
    input [3:0]max_num_2_p1,
    input [3:0]max_num_3_p1,
    input [3:0]max_num_4_p1,
    input [2:0]card_level_player_2,
    input [3:0]max_num_1_p2,
    input [3:0]max_num_2_p2,
    input [3:0]max_num_3_p2,
    input [3:0]max_num_4_p2,
    output reg winner
    );


always @* begin
    if(card_level_player_1>card_level_player_2)begin
        winner=0;
    end

    else if(card_level_player_1< card_level_player_2)begin
        winner=1;
    end

    else if(max_num_1_p1!=max_num_1_p2) begin
        winner=(max_num_1_p1>max_num_1_p2)? 0:1;
    end

    else if(max_num_2_p1!=max_num_2_p2) begin
        winner=(max_num_2_p1>max_num_2_p2)? 0:1;
    end

    else if(max_num_3_p1!=max_num_3_p2) begin
        winner=(max_num_3_p1>max_num_3_p2)? 0:1;
    end

    else if(max_num_4_p1!=max_num_4_p2) begin
            winner=(max_num_4_p1>max_num_4_p2)? 0:1;
    end
end


endmodule
