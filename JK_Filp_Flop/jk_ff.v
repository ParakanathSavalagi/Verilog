`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:22 01/08/2025 
// Design Name: 
// Module Name:    jk_ff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module jk_ff(
    input j,
    input k,
    input clk,
    input rst,
    output reg q
    );
	 
	 always@(posedge clk)
	 begin
	 if(rst)
	 q <= 0;
	 else if(j==0 && k==0)
	 q <=q;
	 else if(j==0 && k==1)
	 q <= 1'b0;
	 else if(j==1 && k==0)
	 q <= 1'b1;
	 else if(j==1 && k==1)
	 q <= ~q;
	 else 
	 q <= 1'bx;
	 end
	 


endmodule
