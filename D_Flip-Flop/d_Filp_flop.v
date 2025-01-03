module d_Flip_flop(
    input d,rst,clk,
    output reg q

);


always @(posedge clk) begin
        if (rst) begin
            q <= 0;
        end else begin
            q <= d;
        end
    
end
    
endmodule 