module regfl(input clk, rst_b, we, input[2:0] s, input [63:0] d, output[511:0] q);
    wire[7:0] do;
    dec #(.w(3)) dec_i(.s(s), .e(we), .q(do));
    generate 
        genvar k;
        for(k=0;k<8;k=k+1) begin
            rgst #(.w(64)) ir(.clk(clk), .rst_b(rst_b), .clr(1'b0), .ld(do[k]), .d(d), .q(q[511-k*64-:64]));
        end
    endgenerate
endmodule

module regfl_tb;
    reg clk, rst_b, we; reg[2:0] s; reg[63:0] d; wire[511:0] q;
    regfl i0(.clk(clk), .rst_b(rst_b), .we(we), .s(s), .d(d), .q(q));
    localparam CLK_PERIOD=100, CLK_CYCLES=13, RST_DELAY=5; integer k;
    initial begin clk=0; repeat(2*CLK_CYCLES) #(CLK_PERIOD/2) clk=1-clk; end
    initial begin rst_b=0; #RST_DELAY rst_b=1; end
    initial for(k=0; k<CLK_CYCLES;k=k+1) begin
        if(k==6) we=0; else we=1; {s,d}={3{$urandom}}; #CLK_PERIOD; end
endmodule

module rgst #(
    parameter w=8
)(
    input clk, rst_b, ld, clr, input [w-1:0] d, output reg [w-1:0] q
);
    always @ (posedge clk, negedge rst_b)
        if (!rst_b)                 q <= 0;
        else if (clr)               q <= 0;
        else if (ld)                q <= d;
endmodule

module dec #(parameter w=2)(
	input [w-1:0] s,
	input e,
	output reg [2**w-1:0] q
);
	always @ (*) begin
		q = 0;
		if (e)
  		  q[s] = 1;
	end
endmodule