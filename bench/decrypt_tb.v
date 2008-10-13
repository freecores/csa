
// this is the test bench for decrypt module

`timescale 10ns/1ns
module decypher_tb;
       reg      [204*8-1:0]  tt;
       reg      [8*8-1:0]    even_cw;
       reg      [8*8-1:0]    odd_cw;
       reg      [188*8-1:0]  encrypted;
       wire     [188*8-1:0]  decrypted; 

initial
begin
        $read_data(
                                "../test_dat/decypht.in"
                               ,tt
                  );

        encrypted = tt [204*8-1 : 16*8 ] ;
        even_cw   = tt [16*8-1  : 8*8  ] ;
        odd_cw    = tt [8*8-1   : 0    ] ;

        #10;

        $write_data(
                                 "../test_dat/decypht.out.v"
                                ,"w"
                                ,bd
                   );
        
end

decypt b(
                        even_cw(even_cw)
                      ,.odd_cw(odd_cw)
                      ,.encrypted(encrypted)
                      ,.decrypted(decrypted)
                );
endmodule
