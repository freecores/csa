// the test bench module for key_schedule
`timescale 10ns/1ns

module key_schedule_tb;
reg     [8*8-1:0]  ck;
reg                clk;
reg                rst;
reg                start;
wire    [56*8-1:0] kk;

        initial
        begin
        clk<=1'h0;
        forever #5 clk=~clk;
        end

        initial
        begin
        @(posedge clk);
        rst<=1'h1;
        @(posedge clk);
        @(posedge clk);
        rst=1'h0;
        @(posedge clk);
        end

        initial
        begin

`ifdef ____DEBUG
        // read CK
        $read_data(
                                "../test_dat/key_schedule.in"
                               ,ck
                  );
`endif
        start=1'h0;
        ck=64'haf361916fd4b4b77;

        repeat (4) @(posedge clk);
        start=1'h1;
        @(posedge clk);
        start=1'h0;
        repeat (200) @(posedge clk);

        $display("ck=%h",ck);
        $display("kk=%h",kk);

        // output kk

        //$write_data(
        //                "../test_dat/key_schedule.out.v"
        //               ,"a"
        //               ,kk
        //           );
                $finish;
        end

        key_schedule ks(
                         .clk     (clk)
                        ,.rst     (rst)
                        ,.start   (start)
                        ,.i_ck    (ck)
                        ,.busy    ()
                        ,.done    ()
                        ,.o_kk    (kk)
                        );
endmodule
