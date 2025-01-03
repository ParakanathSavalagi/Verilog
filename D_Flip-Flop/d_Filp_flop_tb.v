module d_Flip_flop_tb();

reg d,clk,rst;
wire q;

d_Flip_flop DUT(.d(d),.clk(clk),.rst(rst),.q(q));

parameter thold = 5,tsetup = 5, cycle = 100;
always begin
    #(cycle/2)
    clk = 1'b0;
    #(cycle/2)
    clk = 1'b1;
end

//Reset cheaking
task sync_reset;
begin
    rst = 1'b1;
    @(posedge clk)
    #(thold)
    if (q!=1'b0) begin
        $display("Reset is not working");
        $display("Error at time %t",$time);
        $stop;
    end
    $display("Reset is perfect");
    {rst,d} = 2'bx;
    #(cycle - thold - tsetup);
end
endtask

//Loading input d
task load_d(input data);
begin
    rst = 1'b0;
    d = data;
    @(posedge clk);
    #(thold)
    if (q!=data) begin
        $display("Input D is not working");
        $display("Error at time %t",$time);
        $stop;
    end
    $display("Input d is perfect");
    {rst,d} = 2'bx;
    #(cycle - thold - tsetup);
end
endtask

//Applying Stimulus 
initial
begin
    sync_reset;
    load_d(1'b1);
    sync_reset;
    load_d(1'b1);
    load_d(1'b0);
    load_d(1'b0);
    sync_reset;
    #100 $stop;
end


    
endmodule