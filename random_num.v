`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2021 09:37:18 PM
// Design Name: 
// Module Name: random_num
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


module random_num(
    input f_crystal,
    input button,
    input next,
    input rst,
    output reg [15:0]num=1
);
reg last;
integer i;

always @(posedge f_crystal or negedge rst) begin
    if(rst==1)
    num=1;

    else begin
        if(button==1)begin
            for(i=1;i<16;i=i+1)begin
                num[i]<=num[i-1];
            end
            num[0] <= num[3] ^ num[12] ^ num[14] ^ num[15]; 
        end
        else if((next==1)&&(last==0)) begin
            for(i=1;i<16;i=i+1)begin
                num[i]<=num[i-1];
            end
            num[0] <= num[3] ^ num[12] ^ num[14] ^ num[15]; 
        end
    end
    last = next; 
end


endmodule
