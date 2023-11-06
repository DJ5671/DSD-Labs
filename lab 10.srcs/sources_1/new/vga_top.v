`timescale 1ns / 1ps

module vga_top(clk, vga_vsync, vga_hsync, red, green, blue);
    input clk;
    output vga_vsync, vga_hsync;
    output [3:0] red, green, blue; //4 bits of RGB color
    
    wire inDisplay, slow_clk;
    wire [9:0] x_pos; //800 = 640 + 96 + 16 + 48
    wire [9:0] y_pos; //525 = 480 + 2
    reg [1:0] color_counter = 2'b00; // 2-bit counter to cycle through RGB colors
    
    vga_sync v1(clk, vga_hsync, vga_vsync, x_pos, y_pos, inDisplay);
    // Increment color counter every time a new frame starts
    always @(posedge clk) begin
        if (x_pos == 0 && y_pos == 0)
            color_counter = color_counter + 1;
    end
    // Set color based on color counter
    assign red = (inDisplay && color_counter == 2'b00) ? 4'hF : 4'h0;
    assign green = (inDisplay && color_counter == 2'b01) ? 4'hF : 4'h0;
    assign blue = (inDisplay && color_counter == 2'b10) ? 4'hF : 4'h0;
endmodule