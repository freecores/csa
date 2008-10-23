

// this file is the testbench of stream_cypher module

`timescale 1ns/1ns
module stream_cypher_tb;

reg clk;
reg rst;

reg en;
reg init;


reg [8*8-1:0] ck;
reg [8*8-1:0] sb;

wire [8*8-1:0] cb;

reg [24*8-1:0] tt; // input 

initial
begin
        $read_data(
                                "../test_dat/stream_cypher.in"
                               ,tt
                  );
        @(posedge rst);
        ck =tt[ 24* 8-1: 16* 8];
        en=1;
        init=1;
        sb =tt[ 16*8-1:8* 8];
        @(posedge clk);

        $write_data(
                                 "../test_dat/stream_cypher.out.v"
                                ,"w"
                                ,cb
                   );

        en=1;
        init=0;
        sb =tt[ 8*8-1:0* 8];
        @(posedge clk);
        $display("\ncb=%b\n",cb);

        $write_data(
                                 "../test_dat/stream_cypher.out.v"
                                ,"a"
                                ,cb
                   );
        @(posedge clk);

        $stop;
end

initial
begin
        clk<=1'b0;        
        forever #1 clk=~clk;
end

initial
begin
        rst<=1'b0;        
        @(posedge clk);
        @(posedge clk);
        rst=1'h1;
end

stream_cypher b(
                 .clk   (clk)
                ,.rst_n (rst)
                ,.en    (en)
                ,.init  (init)
                ,.ck    (ck)
                ,.sb    (sb)
                ,.cb    (cb)
                );

endmodule
