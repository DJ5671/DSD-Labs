`timescale 1ns / 1ps

module ROM(
    output [7:0] LED,
    output [4:0] Ao,
    input [7:0] D,
    input [4:0] A,
    input Clear,
    input Load
    );
    
    reg [7:0] Store [0:31];

    
    initial
    begin
    Store[0]<=4'b00000000;
    Store[1]<=4'b00000000;
    Store[2]<=4'b00000000;
    Store[3]<=4'b00000000;
    Store[4]<=4'b00000000;
    Store[5]<=4'b00000000;
    Store[6]<=4'b00000000;
    Store[7]<=4'b00000000;
    Store[8]<=4'b00000000;
    Store[9]<=4'b00000000;
    Store[10]<=4'b00000000;
    Store[11]<=4'b00000000;
    Store[12]<=4'b00000000;
    Store[13]<=4'b00000000;
    Store[14]<=4'b00000000;
    Store[15]<=4'b00000000;
    Store[16]<=4'b00000000;
    Store[17]<=4'b00000000;
    Store[18]<=4'b00000000;
    Store[19]<=4'b00000000;
    Store[20]<=4'b00000000;
    Store[21]<=4'b00000000;
    Store[22]<=4'b00000000;
    Store[23]<=4'b00000000;
    Store[24]<=4'b00000000;
    Store[25]<=4'b00000000;
    Store[26]<=4'b00000000;
    Store[27]<=4'b00000000;
    Store[28]<=4'b00000000;
    Store[29]<=4'b00000000;
    Store[30]<=4'b00000000;
    Store[31]<=4'b00000000;    
    end
    
    assign LED = Store [A];  //Display what is being addressed
    assign Ao = A;          // show the address in the lights LED11 to 15
    
    always @(*) begin
    if (Clear) begin
    Store [A] <= 8'b00000000;   //clear the value at address A
    end
    else if (Load) begin
    Store [A] <= D;          //load adress A with the value in the slide switches D
    end
    end
    
endmodule
