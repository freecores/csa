
// this is the test bench for decrypt module


`define TEST_DECRYPT

`timescale 10ns/1ns
module decrypt_tb;

reg clk;
reg rst;

`ifdef TEST_DECRYPT


integer bytes;
integer out_bytes;

reg      [204*8-1 : 0]  tt;
reg      [8*8-1   : 0]  even_cw;
reg      [8*8-1   : 0]  odd_cw;
reg      [8-1     : 0]  encrypted [188:1];
reg      [8-1     : 0]  decrypted [188:1];

reg      [8*8-1:0]    ck;
reg                   even_odd;
reg                   en;
reg                   key_en;
reg      [  8-1:0]    enc;
wire     [  8-1:0]    dec;
wire                  invalid;

initial
begin
        $read_data(
                                "../test_dat/decrypt.in"
                               ,tt
                  );

        even_cw   = tt [204*8-1  : 196*8  ] ;
        odd_cw    = tt [196*8-1  : 188*8  ] ;
        out_bytes = 1;

        encrypted[188] = tt [188*8-1 :187*8 ] ;
        encrypted[187] = tt [187*8-1 :186*8 ] ;
        encrypted[186] = tt [186*8-1 :185*8 ] ;
        encrypted[185] = tt [185*8-1 :184*8 ] ;
        encrypted[184] = tt [184*8-1 :183*8 ] ;
        encrypted[183] = tt [183*8-1 :182*8 ] ;
        encrypted[182] = tt [182*8-1 :181*8 ] ;
        encrypted[181] = tt [181*8-1 :180*8 ] ;
        encrypted[180] = tt [180*8-1 :179*8 ] ;
        encrypted[179] = tt [179*8-1 :178*8 ] ;
        encrypted[178] = tt [178*8-1 :177*8 ] ;
        encrypted[177] = tt [177*8-1 :176*8 ] ;
        encrypted[176] = tt [176*8-1 :175*8 ] ;
        encrypted[175] = tt [175*8-1 :174*8 ] ;
        encrypted[174] = tt [174*8-1 :173*8 ] ;
        encrypted[173] = tt [173*8-1 :172*8 ] ;
        encrypted[172] = tt [172*8-1 :171*8 ] ;
        encrypted[171] = tt [171*8-1 :170*8 ] ;
        encrypted[170] = tt [170*8-1 :169*8 ] ;
        encrypted[169] = tt [169*8-1 :168*8 ] ;
        encrypted[168] = tt [168*8-1 :167*8 ] ;
        encrypted[167] = tt [167*8-1 :166*8 ] ;
        encrypted[166] = tt [166*8-1 :165*8 ] ;
        encrypted[165] = tt [165*8-1 :164*8 ] ;
        encrypted[164] = tt [164*8-1 :163*8 ] ;
        encrypted[163] = tt [163*8-1 :162*8 ] ;
        encrypted[162] = tt [162*8-1 :161*8 ] ;
        encrypted[161] = tt [161*8-1 :160*8 ] ;
        encrypted[160] = tt [160*8-1 :159*8 ] ;
        encrypted[159] = tt [159*8-1 :158*8 ] ;
        encrypted[158] = tt [158*8-1 :157*8 ] ;
        encrypted[157] = tt [157*8-1 :156*8 ] ;
        encrypted[156] = tt [156*8-1 :155*8 ] ;
        encrypted[155] = tt [155*8-1 :154*8 ] ;
        encrypted[154] = tt [154*8-1 :153*8 ] ;
        encrypted[153] = tt [153*8-1 :152*8 ] ;
        encrypted[152] = tt [152*8-1 :151*8 ] ;
        encrypted[151] = tt [151*8-1 :150*8 ] ;
        encrypted[150] = tt [150*8-1 :149*8 ] ;
        encrypted[149] = tt [149*8-1 :148*8 ] ;
        encrypted[148] = tt [148*8-1 :147*8 ] ;
        encrypted[147] = tt [147*8-1 :146*8 ] ;
        encrypted[146] = tt [146*8-1 :145*8 ] ;
        encrypted[145] = tt [145*8-1 :144*8 ] ;
        encrypted[144] = tt [144*8-1 :143*8 ] ;
        encrypted[143] = tt [143*8-1 :142*8 ] ;
        encrypted[142] = tt [142*8-1 :141*8 ] ;
        encrypted[141] = tt [141*8-1 :140*8 ] ;
        encrypted[140] = tt [140*8-1 :139*8 ] ;
        encrypted[139] = tt [139*8-1 :138*8 ] ;
        encrypted[138] = tt [138*8-1 :137*8 ] ;
        encrypted[137] = tt [137*8-1 :136*8 ] ;
        encrypted[136] = tt [136*8-1 :135*8 ] ;
        encrypted[135] = tt [135*8-1 :134*8 ] ;
        encrypted[134] = tt [134*8-1 :133*8 ] ;
        encrypted[133] = tt [133*8-1 :132*8 ] ;
        encrypted[132] = tt [132*8-1 :131*8 ] ;
        encrypted[131] = tt [131*8-1 :130*8 ] ;
        encrypted[130] = tt [130*8-1 :129*8 ] ;
        encrypted[129] = tt [129*8-1 :128*8 ] ;
        encrypted[128] = tt [128*8-1 :127*8 ] ;
        encrypted[127] = tt [127*8-1 :126*8 ] ;
        encrypted[126] = tt [126*8-1 :125*8 ] ;
        encrypted[125] = tt [125*8-1 :124*8 ] ;
        encrypted[124] = tt [124*8-1 :123*8 ] ;
        encrypted[123] = tt [123*8-1 :122*8 ] ;
        encrypted[122] = tt [122*8-1 :121*8 ] ;
        encrypted[121] = tt [121*8-1 :120*8 ] ;
        encrypted[120] = tt [120*8-1 :119*8 ] ;
        encrypted[119] = tt [119*8-1 :118*8 ] ;
        encrypted[118] = tt [118*8-1 :117*8 ] ;
        encrypted[117] = tt [117*8-1 :116*8 ] ;
        encrypted[116] = tt [116*8-1 :115*8 ] ;
        encrypted[115] = tt [115*8-1 :114*8 ] ;
        encrypted[114] = tt [114*8-1 :113*8 ] ;
        encrypted[113] = tt [113*8-1 :112*8 ] ;
        encrypted[112] = tt [112*8-1 :111*8 ] ;
        encrypted[111] = tt [111*8-1 :110*8 ] ;
        encrypted[110] = tt [110*8-1 :109*8 ] ;
        encrypted[109] = tt [109*8-1 :108*8 ] ;
        encrypted[108] = tt [108*8-1 :107*8 ] ;
        encrypted[107] = tt [107*8-1 :106*8 ] ;
        encrypted[106] = tt [106*8-1 :105*8 ] ;
        encrypted[105] = tt [105*8-1 :104*8 ] ;
        encrypted[104] = tt [104*8-1 :103*8 ] ;
        encrypted[103] = tt [103*8-1 :102*8 ] ;
        encrypted[102] = tt [102*8-1 :101*8 ] ;
        encrypted[101] = tt [101*8-1 :100*8 ] ;
        encrypted[100] = tt [100*8-1 : 99*8 ] ;
        encrypted[ 99] = tt [ 99*8-1 : 98*8 ] ;
        encrypted[ 98] = tt [ 98*8-1 : 97*8 ] ;
        encrypted[ 97] = tt [ 97*8-1 : 96*8 ] ;
        encrypted[ 96] = tt [ 96*8-1 : 95*8 ] ;
        encrypted[ 95] = tt [ 95*8-1 : 94*8 ] ;
        encrypted[ 94] = tt [ 94*8-1 : 93*8 ] ;
        encrypted[ 93] = tt [ 93*8-1 : 92*8 ] ;
        encrypted[ 92] = tt [ 92*8-1 : 91*8 ] ;
        encrypted[ 91] = tt [ 91*8-1 : 90*8 ] ;
        encrypted[ 90] = tt [ 90*8-1 : 89*8 ] ;
        encrypted[ 89] = tt [ 89*8-1 : 88*8 ] ;
        encrypted[ 88] = tt [ 88*8-1 : 87*8 ] ;
        encrypted[ 87] = tt [ 87*8-1 : 86*8 ] ;
        encrypted[ 86] = tt [ 86*8-1 : 85*8 ] ;
        encrypted[ 85] = tt [ 85*8-1 : 84*8 ] ;
        encrypted[ 84] = tt [ 84*8-1 : 83*8 ] ;
        encrypted[ 83] = tt [ 83*8-1 : 82*8 ] ;
        encrypted[ 82] = tt [ 82*8-1 : 81*8 ] ;
        encrypted[ 81] = tt [ 81*8-1 : 80*8 ] ;
        encrypted[ 80] = tt [ 80*8-1 : 79*8 ] ;
        encrypted[ 79] = tt [ 79*8-1 : 78*8 ] ;
        encrypted[ 78] = tt [ 78*8-1 : 77*8 ] ;
        encrypted[ 77] = tt [ 77*8-1 : 76*8 ] ;
        encrypted[ 76] = tt [ 76*8-1 : 75*8 ] ;
        encrypted[ 75] = tt [ 75*8-1 : 74*8 ] ;
        encrypted[ 74] = tt [ 74*8-1 : 73*8 ] ;
        encrypted[ 73] = tt [ 73*8-1 : 72*8 ] ;
        encrypted[ 72] = tt [ 72*8-1 : 71*8 ] ;
        encrypted[ 71] = tt [ 71*8-1 : 70*8 ] ;
        encrypted[ 70] = tt [ 70*8-1 : 69*8 ] ;
        encrypted[ 69] = tt [ 69*8-1 : 68*8 ] ;
        encrypted[ 68] = tt [ 68*8-1 : 67*8 ] ;
        encrypted[ 67] = tt [ 67*8-1 : 66*8 ] ;
        encrypted[ 66] = tt [ 66*8-1 : 65*8 ] ;
        encrypted[ 65] = tt [ 65*8-1 : 64*8 ] ;
        encrypted[ 64] = tt [ 64*8-1 : 63*8 ] ;
        encrypted[ 63] = tt [ 63*8-1 : 62*8 ] ;
        encrypted[ 62] = tt [ 62*8-1 : 61*8 ] ;
        encrypted[ 61] = tt [ 61*8-1 : 60*8 ] ;
        encrypted[ 60] = tt [ 60*8-1 : 59*8 ] ;
        encrypted[ 59] = tt [ 59*8-1 : 58*8 ] ;
        encrypted[ 58] = tt [ 58*8-1 : 57*8 ] ;
        encrypted[ 57] = tt [ 57*8-1 : 56*8 ] ;
        encrypted[ 56] = tt [ 56*8-1 : 55*8 ] ;
        encrypted[ 55] = tt [ 55*8-1 : 54*8 ] ;
        encrypted[ 54] = tt [ 54*8-1 : 53*8 ] ;
        encrypted[ 53] = tt [ 53*8-1 : 52*8 ] ;
        encrypted[ 52] = tt [ 52*8-1 : 51*8 ] ;
        encrypted[ 51] = tt [ 51*8-1 : 50*8 ] ;
        encrypted[ 50] = tt [ 50*8-1 : 49*8 ] ;
        encrypted[ 49] = tt [ 49*8-1 : 48*8 ] ;
        encrypted[ 48] = tt [ 48*8-1 : 47*8 ] ;
        encrypted[ 47] = tt [ 47*8-1 : 46*8 ] ;
        encrypted[ 46] = tt [ 46*8-1 : 45*8 ] ;
        encrypted[ 45] = tt [ 45*8-1 : 44*8 ] ;
        encrypted[ 44] = tt [ 44*8-1 : 43*8 ] ;
        encrypted[ 43] = tt [ 43*8-1 : 42*8 ] ;
        encrypted[ 42] = tt [ 42*8-1 : 41*8 ] ;
        encrypted[ 41] = tt [ 41*8-1 : 40*8 ] ;
        encrypted[ 40] = tt [ 40*8-1 : 39*8 ] ;
        encrypted[ 39] = tt [ 39*8-1 : 38*8 ] ;
        encrypted[ 38] = tt [ 38*8-1 : 37*8 ] ;
        encrypted[ 37] = tt [ 37*8-1 : 36*8 ] ;
        encrypted[ 36] = tt [ 36*8-1 : 35*8 ] ;
        encrypted[ 35] = tt [ 35*8-1 : 34*8 ] ;
        encrypted[ 34] = tt [ 34*8-1 : 33*8 ] ;
        encrypted[ 33] = tt [ 33*8-1 : 32*8 ] ;
        encrypted[ 32] = tt [ 32*8-1 : 31*8 ] ;
        encrypted[ 31] = tt [ 31*8-1 : 30*8 ] ;
        encrypted[ 30] = tt [ 30*8-1 : 29*8 ] ;
        encrypted[ 29] = tt [ 29*8-1 : 28*8 ] ;
        encrypted[ 28] = tt [ 28*8-1 : 27*8 ] ;
        encrypted[ 27] = tt [ 27*8-1 : 26*8 ] ;
        encrypted[ 26] = tt [ 26*8-1 : 25*8 ] ;
        encrypted[ 25] = tt [ 25*8-1 : 24*8 ] ;
        encrypted[ 24] = tt [ 24*8-1 : 23*8 ] ;
        encrypted[ 23] = tt [ 23*8-1 : 22*8 ] ;
        encrypted[ 22] = tt [ 22*8-1 : 21*8 ] ;
        encrypted[ 21] = tt [ 21*8-1 : 20*8 ] ;
        encrypted[ 20] = tt [ 20*8-1 : 19*8 ] ;
        encrypted[ 19] = tt [ 19*8-1 : 18*8 ] ;
        encrypted[ 18] = tt [ 18*8-1 : 17*8 ] ;
        encrypted[ 17] = tt [ 17*8-1 : 16*8 ] ;
        encrypted[ 16] = tt [ 16*8-1 : 15*8 ] ;
        encrypted[ 15] = tt [ 15*8-1 : 14*8 ] ;
        encrypted[ 14] = tt [ 14*8-1 : 13*8 ] ;
        encrypted[ 13] = tt [ 13*8-1 : 12*8 ] ;
        encrypted[ 12] = tt [ 12*8-1 : 11*8 ] ;
        encrypted[ 11] = tt [ 11*8-1 : 10*8 ] ;
        encrypted[ 10] = tt [ 10*8-1 :  9*8 ] ;
        encrypted[  9] = tt [  9*8-1 :  8*8 ] ;
        encrypted[  8] = tt [  8*8-1 :  7*8 ] ;
        encrypted[  7] = tt [  7*8-1 :  6*8 ] ;
        encrypted[  6] = tt [  6*8-1 :  5*8 ] ;
        encrypted[  5] = tt [  5*8-1 :  4*8 ] ;
        encrypted[  4] = tt [  4*8-1 :  3*8 ] ;
        encrypted[  3] = tt [  3*8-1 :  2*8 ] ;
        encrypted[  2] = tt [  2*8-1 :  1*8 ] ;
        encrypted[  1] = tt [  1*8-1 :  0*8 ] ;
        en=0;
        key_en=0;

        
        repeat(4)@(posedge clk);

        // set even cw 
        @(posedge clk);
        ck=even_cw;
        en=0;
        even_odd=0;
        @(posedge clk);
        key_en=1;
        @(posedge clk);
        key_en=0;
        repeat (11) @(posedge clk);

        // set odd key
        @(posedge clk);
        ck=odd_cw;
        key_en=1;
        en=0;
        even_odd=1;
        @(posedge clk);
        key_en=0;
        repeat (11)@(posedge clk);


        repeat(4)@(posedge clk);

        // decrypt
        for(bytes=1;bytes<=188;bytes=bytes+1)
        begin
                en=1;
                enc=encrypted[bytes];
                @(posedge clk);
                en=0;
                @(posedge clk);
        end

        repeat(44) @(posedge clk);

        // output result
        $write_data(
                                 "../test_dat/decrypt.out.v"
                                ,"w"
                                ,decrypted[1]
                   );
        for(out_bytes=2;out_bytes<=188;out_bytes=out_bytes+1)
        begin
        $write_data(
                                 "../test_dat/decrypt.out.v"
                                ,"a"
                                ,decrypted[out_bytes]
                   );
        end


        $stop;
        
end

always @(posedge clk)
        if(invalid)
        begin
                decrypted[out_bytes]=dec;
                out_bytes=out_bytes+1;
        end


decrypt b(
                  .clk        (clk)
                , .rst        (rst)
                , .ck         (ck)
                , .key_en     (key_en)
                , .even_odd   (even_odd)
                , .en         (en)
                , .encrypted  (enc)
                , .decrypted  (dec)
                , .invalid    (invalid)
                );



`else

reg en;
reg init;
reg [8*8-1:0] ck;
reg [8*8-1:0] sb;
wire [8*8-1:0] cb;

initial
begin
        repeat (12)@(posedge clk);
        init=1'h1;
        en=1'h1;
        ck=64'hffffffffffffffff;
        sb=64'hffffffffffffffff;
        @(posedge clk);
        en=1'h0;
        @(posedge clk);
        en=1'h1;
        init=1'h0;
        @(posedge clk);
        en=1'h0;
        @(posedge clk);
        repeat(10)@(posedge clk);
        en=1'h1;
        @(posedge clk);
        en=1'h0;
        repeat(10)@(posedge clk);
        
        $stop;
        
end

stream_cypher sc(  
                    .clk   (clk)
                  , .rst   (rst)
                  , .en    (en)
                  , .init  (init)
                  , .ck    (ck)
                  , .sb    (sb)
                  , .cb    (cb)
                  );

`endif

initial
begin
        clk<=1'b0;        
        forever #5 clk=~clk;
end

initial
begin
        rst<=1'b1;        
        @(posedge clk);
        @(posedge clk);
        rst=1'h0;
end
endmodule
