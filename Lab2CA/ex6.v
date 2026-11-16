module ex6 (
    input  [2:0] a, b, c,
    output [2:0] o
);
endmodule

module ex6_tb;
    reg  [2:0] a, b, c;
    wire [2:0] o;

    ex6 dut (.a(a), .b(b), .c(c), .o(o));

    integer k;
	initial begin
		$display("Time\ta\tb\tc\to");
		$monitor("%0t\t%b\t%b\t%b\t%b", $time, a, b, c, o);
		{a, b, c} = 0;
		for (k = 1; k < 512; k = k + 1)
			#10 {a, b, c} = k;
	end
endmodule
