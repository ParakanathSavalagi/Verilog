`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:47:49 01/08/2025
// Design Name:   jk_ff
// Module Name:   F:/Verilog_Basic_Programs/Jk_Filp_Flop/tb/jk_ff_tb.v
// Project Name:  Jk_Filp_Flop
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jk_ff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jk_ff_tb;

	// Inputs
	reg j;
	reg k;
	reg clk;
	reg rst;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	jk_ff uut (
		.j(j), 
		.k(k), 
		.clk(clk), 
		.rst(rst), 
		.q(q)
	);
	
	
	//Setup Time, Hold Time and Clock Cycle  
	parameter THOLD = 5;
	parameter TSETUP = 5;
	parameter CYCLE = 20;
	
	
	
	
   //Initializaion
	initial
	begin
		// Initialize Inputs
		j = 0;
		k = 0;
		clk = 0;
		rst = 0;
	end
	
	
	
	// Clock Generation
	always #(CYCLE/2) clk = ~clk;
	
	parameter RESET = 1'b0;
	parameter SET = 1'b1;
	
	integer i;
	
	//Reset Task
	task reset;
	begin
	rst = 1'b1;
	@(posedge clk)
	#(THOLD)
	if(q!=1'b0)
	begin
	$display("Reset is not working");
	$display("Error at time %t ",$time);
	$stop;
	end
	else
	begin
	$display("Reset is Working fine ");
	{rst,j,k} = 3'bx;
	#(CYCLE - THOLD - TSETUP);
	end
	end
	endtask
	
	
	task data_in;
	begin
	rst = 1'b0;
	for(i=0;i<4;i=i+1)
	begin
	{j,k}=i;
	#20;
	end
	
	@(posedge clk);
	#(THOLD)
	if(q != q)
	begin
	$display("NO CHANGE MODE IS NOT WORKING ");
	$display("ERROR AT TIME %t",$time);
	$stop;
	end
	else
	begin
	$display("NO CHANGE MODE IS FINE");
	{j,k} = 2'bx;
	#(CYCLE - THOLD - TSETUP);
	end
	
	if(q != SET)
	begin
	$display("SET MODE IS NOT WORKING ");
	$display("ERROR AT TIME %t",$time);
	$stop;
	end
	else
	begin
	$display("SET MODE IS FINE");
	{j,k} = 2'bx;
	#(CYCLE - THOLD - TSETUP);
	end
	
	
	if(q != RESET)
	begin
	$display("RESET MODE IS NOT WORKING ");
	$display("ERROR AT TIME %t",$time);
	$stop;
	end
	else
	begin
	$display("RESET MODE IS FINE");
	{j,k} = 2'bx;
	#(CYCLE - THOLD - TSETUP);
	end
	
	if(q != ~q)
	begin
	$display("TOGGLE MODE IS NOT WORKING ");
	$display("ERROR AT TIME %t",$time);
	$stop;
	end
	else
	begin
	$display("TOGGLE MODE IS FINE");
	{j,k} = 2'bx;
	#(CYCLE - THOLD - TSETUP);
	end
	
	end
	endtask
	
	
	//Applying Stimulus
	initial
	begin
	reset;
	data_in;
	reset;
	$finish;
	end   
endmodule

