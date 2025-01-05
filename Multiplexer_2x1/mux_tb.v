module mux_tb();
reg [3:0]i;
reg [1:0]sel;
wire y;

mux DUT(.i(i),.sel(sel),.y(y));
parameter propagation_delay = 3;

task in (input [1:0]select);
begin
    i = 4'b1010;
    sel = select;
    #(propagation_delay);
    if(sel==2'b00 & y!=i[0])begin
        $display("Select sel=%b is not working",sel);
        $display("Error at time %t",$time);
        $stop;
    end
    else if (sel==2'b01 & y!=i[1]) begin
        $display("Select sel=%b is not working",sel);
        $display("Error at time %t",$time);
        $stop;
    end
    else if (sel==2'b10 & y!=i[2]) begin
        $display("Select sel=%b is not working",sel);
        $display("Error at time %t",$time);
        $stop;
        
    end
    else if (sel==2'b11 & y!=i[3]) begin
        $display("Select sel=%b is not working",sel);
        $display("Error at time %t",$time);
        $stop;
        
    end
    else begin
        $display("Select sel=%b is perfect y=%b",sel,y);
end

#(propagation_delay);
    

end
    
endtask

initial
begin
in(2'b00);
in(2'b01);
in(2'b10);
in(2'b11);
#10 $stop;
end




endmodule
