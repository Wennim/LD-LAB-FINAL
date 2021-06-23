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
input rst,
output reg [15:0]num1=16'b1,
output reg [15:0]num2=16'b10,
output reg [15:0]num3=16'b100,
output reg [15:0]num4=16'b1001,
output reg [15:0]num5=16'b10010,
output reg [15:0]num6=16'b100100,
output reg [15:0]num7=16'b1001001,
output reg [15:0]num8=16'b10010010,
output reg [15:0]num9=16'b100100100
);

integer i;
integer j;

always @(posedge f_crystal or negedge rst) begin
    if(rst==1)begin
        num1=16'b1;
        num2=16'b10;
        num3=16'b100;
        num4=16'b1001;
        num5=16'b10010;
        num6=16'b100100;
        num7=16'b1001001;
        num8=16'b10010010;
        num9=16'b100100100;
    end

    else begin
        if(button==1)begin
            
            for(i=1;i<16;i=i+1)begin
                num1[i]<=num1[i-1];
                num2[i]<=num2[i-1];
                num3[i]<=num3[i-1];
                num4[i]<=num4[i-1];
                num5[i]<=num5[i-1];
                num6[i]<=num6[i-1];
                num7[i]<=num7[i-1];
                num8[i]<=num8[i-1];
                num9[i]<=num9[i-1];

            end
            num1[0] <= num1[3] ^ num1[12] ^ num1[14] ^ num1[15];
            num2[0] <= num2[3] ^ num2[12] ^ num2[14] ^ num2[15];
            num3[0] <= num3[3] ^ num3[12] ^ num3[14] ^ num3[15];
            num4[0] <= num4[3] ^ num4[12] ^ num4[14] ^ num4[15];
            num5[0] <= num5[3] ^ num5[12] ^ num5[14] ^ num5[15];
            num6[0] <= num6[3] ^ num6[12] ^ num6[14] ^ num6[15];
            num7[0] <= num7[3] ^ num7[12] ^ num7[14] ^ num7[15];
            num8[0] <= num8[3] ^ num8[12] ^ num8[14] ^ num8[15];
            num9[0] <= num9[3] ^ num9[12] ^ num9[14] ^ num9[15];
        end

    end
    
end


endmodule
