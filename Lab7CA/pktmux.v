module pktmux(
    input pad_pkt, zero_pkt, mgln_pkt, 
    input[63:0] pkt, msg_len, 
    output reg [63:0] o);
    
    always @(*)
    if (pad_pkt) o=1<<64; else if (zero_pkt) o=0; else if (mgln_pkt) o=msg_len; else o=pkt;
endmodule

module pktmux_tb;
    reg pad_pkt, zero_pkt, mgln_pkt; 
    reg[63:0] pkt, msg_len; 
    wire[63:0] o; 
    localparam DELAY= 100;
    
    pktmux i0(.pad_pkt(pad_pkt), .zero_pkt(zero_pkt), .mgln_pkt(mgln_pkt), .pkt(pkt), .msg_len(msg_len),.o(o));
    
    initial begin
        {pad_pkt, zero_pkt, mgln_pkt}=0; {pkt, msg_len}={$urandom, $urandom,$urandom,$urandom}; #DELAY;
        repeat(3) begin
            {pad_pkt, zero_pkt, mgln_pkt}=4; {pkt, msg_len}={$urandom, $urandom,$urandom,$urandom}; #DELAY;
            {pad_pkt, zero_pkt, mgln_pkt}=2; {pkt, msg_len}={$urandom, $urandom,$urandom,$urandom}; #DELAY;
            {pad_pkt, zero_pkt, mgln_pkt}=1; {pkt, msg_len}={$urandom, $urandom,$urandom,$urandom}; #DELAY;
            {pad_pkt, zero_pkt, mgln_pkt}=0; {pkt, msg_len}={$urandom, $urandom,$urandom,$urandom}; #DELAY;
        end
    end
endmodule