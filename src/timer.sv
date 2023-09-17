module tt_um_timer (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
 
    logic[7:0] counter_d, counter_q;

    assign uo_out = counter_d;
    assign uio_out = counter_d;
    assign uio_oe = '1;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter_q <= 0;
        end else begin
            counter_q <= counter_d;
        end
    end

    always_comb begin
        counter_d = counter_q + 1;
    end
endmodule
