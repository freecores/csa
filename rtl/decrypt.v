
// this module will do csa decrypt work
module decrypt(even_cw,odd_cw,encrypted,decrypted);
input  [8*8-1:0]even_cw;
input  [8*8-1:0]odd_cw;
input  [188*8-1:0]encrypted;
output [188*8-1:0]decrypted;

wire  [56*8-1:0]even_kk;
wire  [56*8-1:0]odd_kk;

wire [8*8-1:0]cw;
wire [8*8-1:0]kk;
wire need_decrypt;

key_schedule ks_even(even_cw,even_kk);
key_schedule ks_odd(odd_cw,odd_kk);

assign decrypted[8-1:0]=encrypted[8-1:0];
assign decrypted[2*8-1:8]=encrypted[2*8-1:8];
assign decrypted[3*8-1:2*8]={2'b0,encrypted[3*8-3:2*8]};
assign decrypted[4*8-1:3*8]={2'b0,encrypted[4*8-1:3*8]};
// bit23-22  00 no scrambel
//           10 even key 
//           11 odd key

assign need_decrypt=encrypted[3*8-1];
assign cw=encrypted[3*8-2]?odd_cw:even_cw;
assign kk=encrypted[3*8-2]?odd_kk:even_kk;



endmodule
