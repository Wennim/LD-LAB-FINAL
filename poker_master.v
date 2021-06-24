`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2021 11:09:50 PM
// Design Name: 
// Module Name: poker_master
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

module poker_master(
input f_crystal,
input start_button,
input rst,
output [5:0]card1_num,
output [5:0]card2_num,
output [5:0]card3_num,
output [5:0]card4_num,
output [5:0]card5_num,
output [5:0]card6_num,
output [5:0]card7_num,
output [5:0]card8_num,
output [5:0]card9_num,
output wire [15:0]random_number1,
output wire [15:0]random_number2,
output wire [15:0]random_number3,
output wire [15:0]random_number4,
output wire [15:0]random_number5,
output wire [15:0]random_number6,
output wire [15:0]random_number7,
output wire [15:0]random_number8,
output wire [15:0]random_number9,
output wire [3:0]card1_number,
output wire [1:0]card1_flower,
output wire [3:0]card2_number,
output wire [1:0]card2_flower,
output wire [3:0]card3_number,
output wire [1:0]card3_flower,
output wire [3:0]card4_number,
output wire [1:0]card4_flower,
output wire [3:0]card5_number,
output wire [1:0]card5_flower,
output wire [3:0]card6_number,
output wire [1:0]card6_flower,
output wire [3:0]card7_number,
output wire [1:0]card7_flower,
output wire [3:0]card8_number,
output wire [1:0]card8_flower,
output wire [3:0]card9_number,
output wire [1:0]card9_flower,
output wire winner,
output wire is_four_of_a_kind_p1,
output wire is_full_house_p1,
output wire is_three_of_a_kind_p1,
output wire is_two_pair_p1,
output wire is_pair_p1,
output wire is_flush_p1,
output wire is_straight_p1,
output wire is_four_of_a_kind_p2,
output wire is_full_house_p2,
output wire is_three_of_a_kind_p2,
output wire is_two_pair_p2,
output wire is_pair_p2,
output wire is_flush_p2,
output wire is_straight_p2,
output wire [2:0]card_level_p1,
output wire [2:0]card_level_p2,
output reg start_computation=0,
input start_job,
input clk,
output [3:0]sn_max_num_1_p1,
output [3:0]sn_max_num_2_p1,
output [3:0]sn_max_num_3_p1,
output [3:0]sn_max_num_4_p1,
output [3:0]sn_max_num_1_p2,
output [3:0]sn_max_num_2_p2,
output [3:0]sn_max_num_3_p2,
output [3:0]sn_max_num_4_p2
);

//reg start_computation;
reg button_last;
wire work_done_card_generation;

always @(start_job) begin
    button_last <= start_job;
    if ( (button_last == 1) && (start_job==0) )
        start_computation=1;
    else if ( (button_last == 0) && (start_job==1) )
        start_computation = 0;
end

random_num RN0(
    .f_crystal(f_crystal),
    .button(start_button),
    .rst(rst),
    .num1(random_number1),
    .num2(random_number2),
    .num3(random_number3),
    .num4(random_number4),
    .num5(random_number5),
    .num6(random_number6),
    .num7(random_number7),
    .num8(random_number8),
    .num9(random_number9)
);
card_generation CG1(
    .random_number1(random_number1),
    .random_number2(random_number2),
    .random_number3(random_number3),
    .random_number4(random_number4),
    .random_number5(random_number5),
    .random_number6(random_number6),
    .random_number7(random_number7),
    .random_number8(random_number8),
    .random_number9(random_number8),
    .clk(clk&&start_computation),
    .card1_num(card1_num),
    .card2_num(card2_num),
    .card3_num(card3_num),
    .card4_num(card4_num),
    .card5_num(card5_num),
    .card6_num(card6_num),
    .card7_num(card7_num),
    .card8_num(card8_num),
    .card9_num(card9_num),
    .work_done_card_generation(work_done_card_generation)
);


wire [8:0] work_done_card_processor;
card_processor CP0(
    .card_bit(card1_num),
    .card_number(card1_number),
    .card_flower(card1_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[0])
);
card_processor CP1(
    .card_bit(card2_num),
    .card_number(card2_number),
    .card_flower(card2_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[1])
);
card_processor CP2(
    .card_bit(card3_num),
    .card_number(card3_number),
    .card_flower(card3_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[2])

);
card_processor CP3(
    .card_bit(card4_num),
    .card_number(card4_number),
    .card_flower(card4_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[3])
);
card_processor CP4(
    .card_bit(card5_num),
    .card_number(card5_number),
    .card_flower(card5_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[4])
);
card_processor CP5(
    .card_bit(card6_num),
    .card_number(card6_number),
    .card_flower(card6_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[5])
);
card_processor CP6(
    .card_bit(card7_num),
    .card_number(card7_number),
    .card_flower(card7_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[6])
);
card_processor CP7(
    .card_bit(card8_num),
    .card_number(card8_number),
    .card_flower(card8_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[7])
);
card_processor CP8(
    .card_bit(card9_num),
    .card_number(card9_number),
    .card_flower(card9_flower),
    .activate(work_done_card_generation),
    .work_done_card_processor(work_done_card_processor[8])
);
wire work_done_card_processor_total=0;
assign work_done_card_processor_total=work_done_card_processor[0]&work_done_card_processor[1]&work_done_card_processor[2]
                                &work_done_card_processor[3]&work_done_card_processor[4]&work_done_card_processor[5]
                                &work_done_card_processor[6]&work_done_card_processor[7]&work_done_card_processor[8];

// ! flush
    wire [3:0]flush_max_num_p1,flush_max_num_p2;
is_flush IF1(
    .player_card1_number(card1_number),
    .player_card1_flower(card1_flower),
    .player_card2_number(card2_number),
    .player_card2_flower(card2_flower),
    .community_card1_number(card5_number),
    .community_card1_flower(card5_flower),
    .community_card2_number(card6_number),
    .community_card2_flower(card6_flower),
    .community_card3_number(card7_number),
    .community_card3_flower(card7_flower),
    .community_card4_number(card8_number),
    .community_card4_flower(card8_flower),
    .community_card5_number(card9_number),
    .community_card5_flower(card9_flower),
    .is_flush(is_flush_p1),
    .flush_max_num(flush_max_num_p1)
);
is_flush IF2(
    .player_card1_number(card3_number),
    .player_card1_flower(card3_flower),
    .player_card2_number(card4_number),
    .player_card2_flower(card4_flower),
    .community_card1_number(card5_number),
    .community_card1_flower(card5_flower),
    .community_card2_number(card6_number),
    .community_card2_flower(card6_flower),
    .community_card3_number(card7_number),
    .community_card3_flower(card7_flower),
    .community_card4_number(card8_number),
    .community_card4_flower(card8_flower),
    .community_card5_number(card9_number),
    .community_card5_flower(card9_flower),
    .is_flush(is_flush_p2),
    .flush_max_num(flush_max_num_p2)
);

// ! straight
    wire [3:0]straight_max_num_p1,straight_max_num_p2;
is_straight IS1(
    .player_card1_number(card1_number),
    .player_card2_number(card2_number),
    .community_card1_number(card5_number),
    .community_card2_number(card6_number),
    .community_card3_number(card7_number),
    .community_card4_number(card8_number),
    .community_card5_number(card9_number),
    .activate(work_done_card_processor_total),
    .is_straight(is_straight_p1),
    .max_num(straight_max_num_p1)
);
is_straight IS2(
    .player_card1_number(card3_number),
    .player_card2_number(card4_number),
    .community_card1_number(card5_number),
    .community_card2_number(card6_number),
    .community_card3_number(card7_number),
    .community_card4_number(card8_number),
    .community_card5_number(card9_number),
    .activate(work_done_card_processor_total),
    .is_straight(is_straight_p2),
    .max_num(straight_max_num_p2)
);

// ! is_same_number
    // wire [3:0]sn_max_num_1_p1;
    // wire [3:0]sn_max_num_2_p1;
    // wire [3:0]sn_max_num_3_p1;
    // wire [3:0]sn_max_num_4_p1;
    // wire [3:0]sn_max_num_1_p2;
    // wire [3:0]sn_max_num_2_p2;
    // wire [3:0]sn_max_num_3_p2;
    // wire [3:0]sn_max_num_4_p2;
is_same_number ISN1(
    .player_card1_number(card1_number),
    .player_card2_number(card2_number),
    .community_card1_number(card5_number),
    .community_card2_number(card6_number),
    .community_card3_number(card7_number),
    .community_card4_number(card8_number),
    .community_card5_number(card9_number),
    .activate(work_done_card_processor_total),
    .is_four_of_a_kind(is_four_of_a_kind_p1),
    .is_full_house(is_full_house_p1),
    .is_three_of_a_kind(is_three_of_a_kind_p1),
    .is_two_pair(is_two_pair_p1),
    .is_pair(is_pair_p1),
    .max_num_1(sn_max_num_1_p1),
    .max_num_2(sn_max_num_2_p1),
    .max_num_3(sn_max_num_3_p1),
    .max_num_4(sn_max_num_4_p1)
);
is_same_number ISN2(
    .player_card1_number(card3_number),
    .player_card2_number(card4_number),
    .community_card1_number(card5_number),
    .community_card2_number(card6_number),
    .community_card3_number(card7_number),
    .community_card4_number(card8_number),
    .community_card5_number(card9_number),
    .activate(work_done_card_processor_total),
    .is_four_of_a_kind(is_four_of_a_kind_p2),
    .is_full_house(is_full_house_p2),
    .is_three_of_a_kind(is_three_of_a_kind_p2),
    .is_two_pair(is_two_pair_p2),
    .is_pair(is_pair_p2),
    .max_num_1(sn_max_num_1_p2),
    .max_num_2(sn_max_num_2_p2),
    .max_num_3(sn_max_num_3_p2),
    .max_num_4(sn_max_num_4_p2)
);

// ! card_level_detector
    wire [3:0]max_num_level_1_p1;
    wire [3:0]max_num_level_2_p1;
    wire [3:0]max_num_level_3_p1;
    wire [3:0]max_num_level_4_p1;
    wire [3:0]max_num_level_1_p2;
    wire [3:0]max_num_level_2_p2;
    wire [3:0]max_num_level_3_p2;
    wire [3:0]max_num_level_4_p2;
card_level_detector CLD1(
    .is_four_of_a_kind(is_four_of_a_kind_p1),
    .is_full_house(is_full_house_p1),
    .is_three_of_a_kind(is_three_of_a_kind_p1),
    .is_two_pair(is_two_pair_p1),
    .is_pair(is_pair_p1),
    .same_num_max_num_1(sn_max_num_1_p1),
    .same_num_max_num_2(sn_max_num_2_p1),
    .same_num_max_num_3(sn_max_num_3_p1),
    .same_num_max_num_4(sn_max_num_4_p1),
    .is_flush(is_flush_p1),
    .flush_max_num(flush_max_num_p1),
    .is_straight(is_straight_p1),
    .straight_max_num(straight_max_num_p1),
    .card_level(card_level_p1),
    .max_num_level_1(max_num_level_1_p1),
    .max_num_level_2(max_num_level_2_p1),
    .max_num_level_3(max_num_level_3_p1),
    .max_num_level_4(max_num_level_4_p1)
);
card_level_detector CLD2(
    .is_four_of_a_kind(is_four_of_a_kind_p2),
    .is_full_house(is_full_house_p2),
    .is_three_of_a_kind(is_three_of_a_kind_p2),
    .is_two_pair(is_two_pair_p2),
    .is_pair(is_pair_p2),
    .same_num_max_num_1(sn_max_num_1_p2),
    .same_num_max_num_2(sn_max_num_2_p2),
    .same_num_max_num_3(sn_max_num_3_p2),
    .same_num_max_num_4(sn_max_num_4_p2),
    .is_flush(is_flush_p2),
    .flush_max_num(flush_max_num_p2),
    .is_straight(is_straight_p2),
    .straight_max_num(straight_max_num_p2),
    .card_level(card_level_p2),
    .max_num_level_1(max_num_level_1_p2),
    .max_num_level_2(max_num_level_2_p2),
    .max_num_level_3(max_num_level_3_p2),
    .max_num_level_4(max_num_level_4_p2)
);




// ! is_winner
is_winner IW1(
    .card_level_player_1(card_level_p1),
    .max_num_1_p1(max_num_level_1_p1),
    .max_num_2_p1(max_num_level_2_p1),
    .max_num_3_p1(max_num_level_3_p1),
    .max_num_4_p1(max_num_level_4_p1),
    .card_level_player_2(card_level_p2),
    .max_num_1_p2(max_num_level_1_p2),
    .max_num_2_p2(max_num_level_2_p2),
    .max_num_3_p2(max_num_level_3_p2),
    .max_num_4_p2(max_num_level_4_p2),
    .winner(winner)
);


// is_straight


endmodule