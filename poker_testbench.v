`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 12:50:25 PM
// Design Name: 
// Module Name: poker_testbench
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


module poker_testbench();
reg f_crystal=0,start_button=1,rst=1,i=0,clk=0;

wire [3:0]card1_number;
wire [1:0]card1_flower;
wire [3:0]card2_number;
wire [1:0]card2_flower;
wire [3:0]card3_number;
wire [1:0]card3_flower;
wire [3:0]card4_number;
wire [1:0]card4_flower;
wire [3:0]card5_number;
wire [1:0]card5_flower;
wire [3:0]card6_number;
wire [1:0]card6_flower;
wire [3:0]card7_number;
wire [1:0]card7_flower;
wire [3:0]card8_number;
wire [1:0]card8_flower;
wire [3:0]card9_number;
wire [1:0]card9_flower;
wire [15:0]random_number1;
wire [15:0]random_number2;
wire [15:0]random_number3;
wire [15:0]random_number4;
wire [15:0]random_number5;
wire [15:0]random_number6;
wire [15:0]random_number7;
wire [15:0]random_number8;
wire [15:0]random_number9;
wire [5:0]card1_num;
wire [5:0]card2_num;
wire [5:0]card3_num;
wire [5:0]card4_num;
wire [5:0]card5_num;
wire [5:0]card6_num;
wire [5:0]card7_num;
wire [5:0]card8_num;
wire [5:0]card9_num;
wire winner;
wire is_four_of_a_kind_p1;
wire is_full_house_p1;
wire is_three_of_a_kind_p1;
wire is_two_pair_p1;
wire is_pair_p1;
wire is_flush_p1;
wire is_straight_p1;
wire is_four_of_a_kind_p2;
wire is_full_house_p2;
wire is_three_of_a_kind_p2;
wire is_two_pair_p2;
wire is_pair_p2;
wire is_flush_p2;
wire is_straight_p2;
wire [2:0]card_level_p1;
wire [2:0]card_level_p2;
reg start_job=0;
wire start_computation;
wire [3:0]sn_max_num_1_p1;
wire [3:0]sn_max_num_2_p1;
wire [3:0]sn_max_num_3_p1;
wire [3:0]sn_max_num_4_p1;
wire [3:0]sn_max_num_1_p2;
wire [3:0]sn_max_num_2_p2;
wire [3:0]sn_max_num_3_p2;
wire [3:0]sn_max_num_4_p2;

poker_master PM0(
    .f_crystal(f_crystal),
    .start_button(start_button),
    .rst(rst),
    .card1_number(card1_number),
    .card1_flower(card1_flower),
    .card2_number(card2_number),
    .card2_flower(card2_flower),
    .card3_number(card3_number),
    .card3_flower(card3_flower),
    .card4_number(card4_number),
    .card4_flower(card4_flower),
    .card5_number(card5_number),
    .card5_flower(card5_flower),
    .card6_number(card6_number),
    .card6_flower(card6_flower),
    .card7_number(card7_number),
    .card7_flower(card7_flower),
    .card8_number(card8_number),
    .card8_flower(card8_flower),
    .card9_number(card9_number),
    .card9_flower(card9_flower),
    .winner(winner),
    .card1_num(card1_num),
    .card2_num(card2_num),
    .card3_num(card3_num),
    .card4_num(card4_num),
    .card5_num(card5_num),
    .card6_num(card6_num),
    .card7_num(card7_num),
    .card8_num(card8_num),
    .card9_num(card9_num),
    .random_number1(random_number1),
    .random_number2(random_number2),
    .random_number3(random_number3),
    .random_number4(random_number4),
    .random_number5(random_number5),
    .random_number6(random_number6),
    .random_number7(random_number7),
    .random_number8(random_number8),
    .random_number9(random_number9),
    .is_four_of_a_kind_p1(is_four_of_a_kind_p1),
    .is_full_house_p1(is_full_house_p1),
    .is_three_of_a_kind_p1(is_three_of_a_kind_p1),
    .is_two_pair_p1(is_two_pair_p1),
    .is_pair_p1(is_pair_p1),
    .is_flush_p1(is_flush_p1),
    .is_straight_p1(is_straight_p1),
    .is_four_of_a_kind_p2(is_four_of_a_kind_p2),
    .is_full_house_p2(is_full_house_p2),
    .is_three_of_a_kind_p2(is_three_of_a_kind_p2),
    .is_two_pair_p2(is_two_pair_p2),
    .is_pair_p2(is_pair_p2),
    .is_flush_p2(is_flush_p2),
    .is_straight_p2(is_straight_p2),
    .card_level_p1(card_level_p1),
    .card_level_p2(card_level_p2),
    .start_job(start_job),
    .start_computation(start_computation),
    .clk(clk),
    .sn_max_num_1_p1(sn_max_num_1_p1),
    .sn_max_num_2_p1(sn_max_num_2_p1),
    .sn_max_num_3_p1(sn_max_num_3_p1),
    .sn_max_num_4_p1(sn_max_num_4_p1),
    .sn_max_num_1_p2(sn_max_num_1_p2),
    .sn_max_num_2_p2(sn_max_num_2_p2),
    .sn_max_num_3_p2(sn_max_num_3_p2),
    .sn_max_num_4_p2(sn_max_num_4_p2)
);

initial begin


#230 start_button=1;
#50 start_button=0;
#20 start_job=1;
#10 start_job=0;
#100 start_job=1;
end

always begin
    if(i==0)begin
        rst=1;
        i=1;
        #1 f_crystal=~f_crystal;
        #5 clk=~clk;

    end
    rst=0;
    #1 f_crystal=~f_crystal;
    #5 clk=~clk;
    
end






endmodule


//reg [3:0]player_card1_number;
// reg [3:0]player_card2_number;
// reg [3:0]community_card1_number;
// reg [3:0]community_card2_number;
// reg [3:0]community_card3_number;
// reg [3:0]community_card4_number;
// reg [3:0]community_card5_number;
// wire is_straight;
// wire [3:0]max_num;
// wire [6:0]test;





// poker_master T0(
// .f_crystal(f_crystal),
// .start_button(start_button),
// .rst(rst),
// 

// .card1_number(card1_number),
// .card1_flower(card1_flower),
// .card2_number(card2_number),
// .card2_flower(card2_flower),
// .card3_number(card3_number),
// .card3_flower(card3_flower),
// .card4_number(card4_number),
// .card4_flower(card4_flower),
// .card5_number(card5_number),
// .card5_flower(card5_flower),
// .card6_number(card6_number),
// .card6_flower(card6_flower),
// .card7_number(card7_number),
// .card7_flower(card7_flower),
// .card8_number(card8_number),
// .card8_flower(card8_flower),
// .card9_number(card9_number),
// .card9_flower(card9_flower)
// );