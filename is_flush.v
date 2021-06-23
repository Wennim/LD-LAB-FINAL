`timescale 1ns / 1ps

module is_flush(
    input [3:0]player_card1_number,
    input [1:0]player_card1_flower,
    input [3:0]player_card2_number,
    input [1:0]player_card2_flower,
    input [3:0]community_card1_number,
    input [1:0]community_card1_flower,
    input [3:0]community_card2_number,
    input [1:0]community_card2_flower,
    input [3:0]community_card3_number,
    input [1:0]community_card3_flower,
    input [3:0]community_card4_number,
    input [1:0]community_card4_flower,
    input [3:0]community_card5_number,
    input [1:0]community_card5_flower,
    output reg is_flush,
    output reg [3:0]flush_max_num
);
reg [2:0]is_same_flower_1=1;
reg [2:0]is_same_flower_2=1;
reg same_flower_num_1=0;
reg same_flower_num_2=0;
reg is_flush_1=0;
reg is_flush_2=0;
reg [3:0]max_num_1=0;
reg [3:0]max_num_2=0;
integer num,i;

always @* begin
    // player_card1
    if(player_card1_flower == player_card2_flower)      begin
        is_same_flower_1 = is_same_flower_1 + 1;
        if(player_card2_number == 0) max_num_1=13;
        max_num_1 = (max_num_1 <= player_card2_number) ? player_card2_number : max_num_1;
    end
    if(player_card1_flower == community_card1_flower)   begin
        is_same_flower_1 = is_same_flower_1 + 1;
        if(community_card1_number == 0) max_num_1=13;
        max_num_1 = (max_num_1 <= community_card1_number) ? community_card1_number : max_num_1;
    end
    if(player_card1_flower == community_card2_flower)   begin
        is_same_flower_1 = is_same_flower_1 + 1;
        if(community_card2_number == 0) max_num_1=13;
        max_num_1 = (max_num_1 <= community_card2_number) ? community_card2_number : max_num_1;
    end
    if(player_card1_flower == community_card3_flower)   begin
        is_same_flower_1 = is_same_flower_1 + 1;
        if(community_card3_number == 0) max_num_1=13;
        max_num_1 = (max_num_1 <= community_card3_number) ? community_card3_number : max_num_1;
    end
    if(player_card1_flower == community_card4_flower)   begin
        is_same_flower_1 = is_same_flower_1 + 1;
        if(community_card4_number == 0) max_num_1=13;
        max_num_1 = (max_num_1 <= community_card4_number) ? community_card4_number : max_num_1;
    end
    if(player_card1_flower == community_card5_flower)   begin
        is_same_flower_1 = is_same_flower_1 + 1;
        if(community_card5_number == 0) max_num_1=13;
        max_num_1 = (max_num_1 <= community_card5_number) ? community_card5_number : max_num_1;
    end
    // player_card2
    if(player_card2_flower == player_card1_flower)      begin
        is_same_flower_2 = is_same_flower_2 + 1;
        if(is_same_flower_2 == 0) max_num_2=13;
        max_num_2 = (max_num_2 <= player_card2_number) ? player_card2_number : max_num_2;
    end
    if(player_card2_flower == community_card1_flower)   begin
        is_same_flower_2 = is_same_flower_2 + 1;
        if(community_card1_number == 0) max_num_2=13;
        max_num_2 = (max_num_2 <= community_card1_number) ? community_card1_number : max_num_2;
    end
    if(player_card2_flower == community_card2_flower)   begin
        is_same_flower_2 = is_same_flower_2 + 1;
        if(community_card2_number == 0) max_num_2=13;
        max_num_2 = (max_num_2 <= community_card2_number) ? community_card2_number : max_num_2;
    end
    if(player_card2_flower == community_card3_flower)   begin
        is_same_flower_2 = is_same_flower_2 + 1;
        if(community_card3_number == 0) max_num_2=13;
        max_num_2 = (max_num_2 <= community_card3_number) ? community_card3_number : max_num_2;
    end
    if(player_card2_flower == community_card4_flower)   begin
        is_same_flower_2 = is_same_flower_2 + 1;
        if(community_card4_number == 0) max_num_2=13;
        max_num_2 = (max_num_2 <= community_card4_number) ? community_card4_number : max_num_2;
    end
    if(player_card2_flower == community_card5_flower)   begin
        is_same_flower_2 = is_same_flower_2 + 1;
        if(community_card5_number == 0) max_num_2=13;
        max_num_2 = (max_num_2 <= community_card5_number) ? community_card5_number : max_num_2;
    end


    // is_flush ?
    is_flush_1 = (is_same_flower_1>=4)? 1 : 0;
    is_flush_2 = (is_same_flower_2>=4)? 1 : 0;
    is_flush = is_flush_1 | is_flush_2;

    if(is_flush_1==1)begin
        if(is_flush_2==1)begin
            flush_max_num=(max_num_1>=max_num_2)?max_num_1:max_num_2;
        end

        else
        flush_max_num=max_num_1;
    end

    else if(is_flush_2==1)
        flush_max_num=max_num_2;

end



endmodule
