`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 12:15:09 AM
// Design Name: 
// Module Name: is_four_of_a_kind
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


module is_same_number(
    input [3:0]player_card1_number,
    input [3:0]player_card2_number,
    input [3:0]community_card1_number,
    input [3:0]community_card2_number,
    input [3:0]community_card3_number,
    input [3:0]community_card4_number,
    input [3:0]community_card5_number,
    input activate,
    output reg is_four_of_a_kind=0,
    output reg is_full_house=0,
    output reg is_three_of_a_kind=0,
    output reg is_two_pair=0,
    output reg is_pair = 0,
    output reg [3:0]max_num_1=0,
    output reg [3:0]max_num_2=0,
    output reg [3:0]max_num_3=0,
    output reg [3:0]max_num_4=0,
    output reg [3:0]max_num_5=0,
    output reg [3:0]test=0
);
reg [3:0]FOAK_max_num=0;

reg is_three_of_a_kind_1=0;
reg is_three_of_a_kind_2=0;
reg [3:0]three_max_num_1=0;
reg [3:0]three_max_num_2=0;

reg is_pair_1=0;
reg is_pair_2=0;
reg is_pair_3=0;
reg [3:0]pair_max_num_1=0;
reg [3:0]pair_max_num_2=0;
reg [3:0]pair_max_num_3=0;

reg [3:0]high_card_max_num_1=0;
reg [3:0]high_card_max_num_2=0;
reg [3:0]high_card_max_num_3=0;

integer card_num=0;
integer check_card_num=0;
reg [3:0]number_array[6:0];
reg [2:0]number_count[6:0];
integer number_count_0=0;

initial begin
    number_count[0] <= 0;
    number_count[1] <= 0;
    number_count[2] <= 0;
    number_count[3] <= 0;
    number_count[4] <= 0;
    number_count[5] <= 0;
    number_count[6] <= 0;
end

always @(posedge activate) begin
    // number_array[0] = player_card1_number;
    number_array[0] <= (player_card1_number != 0) ? player_card1_number : 13;
    number_array[1] <= (player_card2_number != 0) ? player_card2_number : 13;
    number_array[2] <= (community_card1_number != 0) ? community_card1_number : 13;
    number_array[3] <= (community_card2_number != 0) ? community_card2_number : 13;
    number_array[4] <= (community_card3_number != 0) ? community_card3_number : 13;
    number_array[5] <= (community_card4_number != 0) ? community_card4_number : 13;
    number_array[6] <= (community_card5_number != 0) ? community_card5_number : 13;
end
    // library building
always @(number_array[6]) begin
    for(card_num =0; card_num<7; card_num=card_num+1) begin
        for(check_card_num=0;check_card_num<7;check_card_num=check_card_num+1) begin
            if( number_array[card_num] == number_array[check_card_num] ) number_count[card_num] = number_count[card_num] + 1;
        end
    end
end

always @(number_count[6]) begin
    // checking
    for(card_num =0; card_num<7; card_num=card_num+1)begin
        // Four of a Kind
        if (number_count[card_num] == 4) begin
            is_four_of_a_kind = 1;
            FOAK_max_num = number_array[card_num];
        end
        // Three of a Kind
        else if ( (number_count[card_num] == 3) && (is_three_of_a_kind_1 == 1)) begin
            if (three_max_num_1!=number_array[card_num]) begin
                is_three_of_a_kind_2 = 1;
                three_max_num_2 = number_array[card_num];
            end
        end
        else if( (number_count[card_num] == 3) && (is_three_of_a_kind_1 == 0)) begin
            is_three_of_a_kind_1 = 1;
            three_max_num_1 = number_array[card_num];
        end
        // Pair
        else if( (number_count[card_num] == 2) && (is_pair_2 == 1)) begin
            if ((pair_max_num_2!=number_array[card_num]) && (pair_max_num_1!=number_array[card_num])) begin
                is_pair_3 = 1;
                if (pair_max_num_1 < number_array[card_num]) begin
                    pair_max_num_3 = pair_max_num_2;
                    pair_max_num_2 = pair_max_num_1;
                    pair_max_num_1 = number_array[card_num];
                end
                else begin
                    pair_max_num_3 <= number_array[card_num];
                end
            end
        end
        else if( (number_count[card_num] == 2) && (is_pair_1 == 1)) begin
            if (pair_max_num_1!=number_array[card_num]) begin
                is_pair_2 = 1;
                if (pair_max_num_1 < number_array[card_num]) begin
                    pair_max_num_2 = pair_max_num_1;
                    pair_max_num_1 = number_array[card_num];
                end
                else begin
                    pair_max_num_2 <= number_array[card_num];
                end
            end
        end
        else if( (number_count[card_num] == 2)) begin
            is_pair_1 = 1;
            pair_max_num_1 = number_array[card_num];
        end
        // High Card
        else if( (number_count[card_num] == 1)) begin
            if (high_card_max_num_1 < number_array[card_num]) begin
                high_card_max_num_3 = high_card_max_num_2;
                high_card_max_num_2 = high_card_max_num_1;
                high_card_max_num_1 = number_array[card_num];
            end
            
        end
    end
 end

 always @* begin
    // determine biggest combination
    // four of a kind
    if(is_four_of_a_kind) begin
        is_four_of_a_kind = 1;
        max_num_1=FOAK_max_num;
    end
    // full house
    else if(is_three_of_a_kind_2) begin
        is_full_house = 1;
        max_num_1 = (three_max_num_1 >= three_max_num_2) ? three_max_num_1 : three_max_num_2;
    end
    else if(is_three_of_a_kind_1) begin
        max_num_1 = three_max_num_1;
        if(is_pair_1) begin
            max_num_2 = pair_max_num_1 ;
            is_full_house = 1;
        end
        // three of a kind
        else 
            is_three_of_a_kind = 1;
            max_num_2=high_card_max_num_1;
            max_num_3=high_card_max_num_2;
    end
    // two pair
    else if(is_pair_3) begin
        is_two_pair=1;
        max_num_1=pair_max_num_1;
        max_num_2=pair_max_num_2;
        max_num_3=(high_card_max_num_1>pair_max_num_3)?high_card_max_num_1:pair_max_num_3;
    end
    else if(is_pair_2) begin
        is_two_pair=1;
        max_num_1=pair_max_num_1;
        max_num_2=pair_max_num_2;
        max_num_3=high_card_max_num_1;
    end
    // pair
    else if(is_pair_1) begin
        is_pair=1;
        max_num_1=pair_max_num_1;
        max_num_2=high_card_max_num_1;
        max_num_3=high_card_max_num_2;
        max_num_4=high_card_max_num_3;
    end
    // high card
    else begin
        max_num_1=(player_card1_number>player_card2_number)?player_card1_number:player_card2_number;
        max_num_2=(player_card1_number<player_card2_number)?player_card1_number:player_card2_number;
    end
end

always @* begin
    test=number_count[3];
end

endmodule
