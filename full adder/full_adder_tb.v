`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:48:14 12/23/2024
// Design Name:   full_adder
// Module Name:   C:/Users/HP/Desktop/xlinix/full_adder/tb/full_adder_tb.v
// Project Name:  full_adder with self-checking testbench
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_tb;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire sum;
	wire carry;
	
	//propagation delay
	parameter pd = 3;
	

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.sum(sum), 
		.carry(carry)
	);
	
	
	
	integer i;
	reg carry1,sum1;

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
	end
	
	
	// all possible inputs to full adder 
	initial
	begin
	for(i=0;i<8;i=i+1)
	begin
	{a,b,c} = i;  //concatinate the a,b,c inputs and assign the from i = 000 to i = 111;
	#(pd);        //propagation delay 
	assign {carry1,sum1} = a+b+c; // assign the calculated reference value of inputs to temporary registers carry1 and sum1
	if({carry,sum}!=={carry1,sum1}) // compare the full adder and reference values 
	begin
	$display("design is wrong");  // indicate the mismatch
	$display("Output mismatch for a=%b,b=%b,c=%b,{carry,sum} = %b,{s,c} = %b ",a,b,c,{carry,sum},{carry1,sum1});// indicate inputs and ouputs  mismatch
	$stop; //suspend simulation for debugging.
	end
	$display("Design is fine  ");//generated output design are correct 
	{a,b,c} = 3'bx; // assign unknown for input values 
	#(10-pd); // subtract the propagation delay from time period 
	end
	#100 $finish;
	end
	
	

	
	
	
endmodule

