`timescale 1ns / 1ps



module NF(LED, SW, CLK);
output reg [15:0] LED;
input SW, CLK;

always @(CLK) begin
if(SW == 1) begin
    LED[3] <= 1;
    LED[9] <= 1;
    LED[15] <= 1;
    end 
if(SW == 0) begin
    LED[3] <= 0;
    LED[9] <= 0;
    LED[15] <= 0;
    end 
end

endmodule
