

// this module is used to computer a key
// author: Simon panti
//          mengxipeng@gmail.com
// refer:
//			cas.c in vlc opensource project

module key_computer(cw,key);
		input 	[63:0]	cw;
		output	[447:0]	key;
		
		wire	[63:0]	key1;
		wire	[63:0]	key2;
		wire	[63:0]	key3;
		wire	[63:0]	key4;
		wire	[63:0]	key5;
		wire	[63:0]	key6;
		wire	[63:0]	key7;
		
		key_perm kp0 (   cw, key7 );
		key_perm kp1 ( key7, key6 );
		key_perm kp2 ( key6, key5 );
		key_perm kp3 ( key5, key4 );
		key_perm kp4 ( key4, key3 );
		key_perm kp5 ( key3, key2 );
		key_perm kp6 ( key2, key1 );
		
		assign key[64*1-1:64*0]=key2 ^ 64'h0000000000000000;
		assign key[64*2-1:64*1]=key3 ^ 64'h0101010101010101;
		assign key[64*3-1:64*2]=key4 ^ 64'h0202020202020202;
		assign key[64*4-1:64*3]=key5 ^ 64'h0303030303030303;
		assign key[64*5-1:64*4]=key6 ^ 64'h0404040404040404;
		assign key[64*6-1:64*5]=key7 ^ 64'h0505050505050505;
		assign key[64*7-1:64*6]=cw   ^ 64'h0606060606060606;
		
endmodule
