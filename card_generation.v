`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 12:08:52 AM
// Design Name: 
// Module Name: card_generation
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


module card_generation(
input [15:0]random_number1,
input [15:0]random_number2,
input [15:0]random_number3,
input [15:0]random_number4,
input [15:0]random_number5,
input [15:0]random_number6,
input [15:0]random_number7,
input [15:0]random_number8,
input [15:0]random_number9,
input clk,
output reg [5:0]card1_num=0,
output reg [5:0]card2_num=0,
output reg [5:0]card3_num=0,
output reg [5:0]card4_num=0,
output reg [5:0]card5_num=0,
output reg [5:0]card6_num=0,
output reg [5:0]card7_num=0,
output reg [5:0]card8_num=0,
output reg [5:0]card9_num=0
);


reg [5:0]card_num[8:0];
reg [5:0]card_temp[51:0];
reg [51:0]available=0;
integer card_state=0;

integer count;
integer i;
integer j;
reg stop;





always @(posedge clk) begin

    if(card_state==0)begin
        count=random_number1%52; 
        card_num[card_state]=count;
        card_state=card_state+1;
        available[count]=1;
    end

    else if(card_state==1)begin
        count=random_number2%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
             card_num[card_state]=count+1;
             available[count+1]=1;
        end
    end 

    
    else if(card_state==2)begin
        count=random_number3%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
    else if(card_state==3)begin
        count=random_number4%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
    else if(card_state==4)begin
        count=random_number5%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
    else if(card_state==5)begin
        count=random_number6%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
    else if(card_state==6)begin
        count=random_number7%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
    else if(card_state==7)begin
        count=random_number8%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
    else if(card_state==8)begin
        count=random_number9%52;
        if(available[count]!=1)begin
            card_num[card_state]=count;
            card_state=card_state+1;
            available[count]=1;
        end
        else begin
            stop=0;
            for(i=count+1;stop==0;i=i+1)begin
                if(available[i]==0)begin
                    card_num[card_state]=i;
                    available[i%52]=1;
                    stop=1;
                end
            end
        end
    end 
end


always @* begin
    card1_num=card_num[0];
    card2_num=card_num[1];
    card3_num=card_num[2];
    card4_num=card_num[3];
    card5_num=card_num[4];
    card6_num=card_num[5];
    card7_num=card_num[6];
    card8_num=card_num[7];
    card9_num=card_num[8];
end

endmodule
