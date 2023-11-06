`timescale 1ns / 1ps

module vga_sync(
    clk, hsync, vsync, xCount, yCount, inDisplay
    );
    
    input clk;
    output vsync, hsync;
    output inDisplay;
    wire null;
    output reg [9:0] xCount;
    output reg [9:0] yCount;
    
    initial begin
        xCount <= 10'h000;
        yCount <= 9'h000;
    end
    
    wire pixel_clk;
    clk_wiz_2 clk1(pixel_clk,1'b0, null, clk);
    always @(posedge pixel_clk) begin
        xCount <= (xCount == 799) ? (10'h000) : (xCount + 1'b1);
    end
        
    always @(posedge pixel_clk) begin
        if(yCount == 524) begin
            yCount <= 9'h000;
        end else if(xCount == 799) begin
            yCount <= yCount + 1'b1;
        end else begin
            yCount <= yCount;
        end
    end
    
        assign hsync = ~((xCount >= 656) && (xCount < 751));
        assign vsync = ~((yCount >= 489) && (yCount < 491));
        assign inDisplay = (xCount < 640) && (yCount < 480);
endmodule
