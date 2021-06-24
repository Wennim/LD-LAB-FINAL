`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 12:15:09 AM
// Design Name: 
// Module Name: is_straight
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


module is_straight(
input [3:0]player_card1_number,
input [3:0]player_card2_number,
input [3:0]community_card1_number,
input [3:0]community_card2_number,
input [3:0]community_card3_number,
input [3:0]community_card4_number,
input [3:0]community_card5_number,
input activate,
output reg is_straight=0,
output reg [3:0]max_num=0,
output reg [6:0]test=0
);


integer i=0,j=0,k=0;
reg [3:0]number_array[6:0];
reg [6:0]is_ace;
reg [6:0]is_straight_temp;
reg [3:0] max_num_temp [6:0];
integer num_exist=0;
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

always @(number_array[6]) begin
    for (i = 0; i < 7 ; i=i+1 ) begin
        if(number_array[i]>4) begin
            // for card i
            is_straight_temp[i] = 1;
            max_num_temp[i] = number_array[i];
            num_exist=0;
            for(j=1;j<5;j=j+1) begin
                // find number
                for(k=0;k<6;k=k+1)begin
                    // search card k for card [i-j] value
                    if (number_array[k]== (number_array[i] - j) )
                        num_exist=num_exist+1;
                end
            end
            if (num_exist<4) begin
                // if not found, clear data
                is_straight_temp[i] = 0;
                max_num_temp[i]=0;
            end
        end

        else if(number_array[i]==4) begin
            // for card i
            is_straight_temp[i] = 1;
            max_num_temp[i] = number_array[i];
            num_exist=0;

            // finding for 5-4-3-2-A
            for( j=1 ; j<4 ; j = j+1 ) begin
                for(k=0;k<6;k=k+1)begin
                    if (number_array[k]== (number_array[i] - j) )
                        num_exist=num_exist+1;
                end
            end
            for(k=0;k<6;k=k+1)begin
                if (number_array[k] == 13 )
                    num_exist=num_exist+1;
            end

            if (num_exist<4) begin
                // if not found, clear data
                is_straight_temp[i] = 0;
                max_num_temp[i]=0;
            end
        end

        else begin
            is_straight_temp[i] = 0;
            max_num_temp[i]=0;
        end
    end


    if( 
        is_straight_temp[0] || is_straight_temp[1] || is_straight_temp[2] ||
        is_straight_temp[3] || is_straight_temp[4] || is_straight_temp[5] ||
        is_straight_temp[6]
    ) begin
        is_straight=1;
    end
    for(i=0;i<7;i=i+1)begin
        max_num=(max_num<=max_num_temp[i])? max_num_temp[i]:max_num;
    end
    test=is_straight_temp;
end
endmodule