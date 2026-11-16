module ex5 (
    input  [1:0] n,
    output [3:0] o
);
    assign o = 4'b1111 >> (4-n);
endmodule

module ex5_tb;
    reg  [1:0] n;
    wire [3:0] o;

    ex5 dut (.n(n), .o(o));

    integer k;
	initial begin
		$display("Time\tn\to");
		$monitor("%0t\t%b\t%b", $time, n, o);
		n = 0;
		for (k = 1; k < 4; k = k + 1)
			#10 n = k;
	end
endmodule
