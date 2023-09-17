module timer (
    input logic clk,
    input logic rst,
    output logic[3:0] out
);
 
    logic[3:0] counter_d, counter_q;

    assign out = counter_d;

    always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            counter_q <= 0;
        end else begin
            counter_q <= counter_d;
        end
    end

    always_comb begin
        counter_d = counter_q + 1;
    end
endmodule
