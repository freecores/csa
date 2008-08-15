// the test bench module for key_schedule
`timescale 10ns/1ns

module key_schedule_tb;
reg     [8*8-1:0]  ck;
wire    [56*8-1:0] kk;
        initial
        begin

        // read CK
        $read_data(
                                "../test_dat/key_schedule.in"
                               ,ck
                  );
`ifdef DEBUG
        $write_data(
                        "../test_dat/key_schedule.out.v"
                       ,"w"
                       ,ck
                   );
`endif
        #10;
`ifdef DEBUG
        $write_data(
                        "../test_dat/key_schedule.out.v"
                       ,"a"
                       ,ks.kb
                   );
`endif

        // output kk
        $write_data(
                        "../test_dat/key_schedule.out.v"
                       ,"a"
                       ,kk
                   );
                $finish;
        end

        key_schedule ks(
                        .i_ck(ck)
                       ,.o_kk(kk)
                        );
endmodule
