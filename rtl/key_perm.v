

// this module do a key 64bits perm
// author: Simon panti
// 		mengxipeng@gmail.com
// refer:
//			cas.c in vlc opensource project

module key_perm(i_key,o_key);
    input   [63:0] i_key;
    output  [63:0] o_key;

    assign o_key={ 
                    i_key[6'h1B], i_key[6'h20], i_key[6'h09], i_key[6'h37], 
                    i_key[6'h29], i_key[6'h0D], i_key[6'h3E], i_key[6'h08],
                    i_key[6'h02], i_key[6'h0C], i_key[6'h27], i_key[6'h25], 
                    i_key[6'h12], i_key[6'h0E], i_key[6'h38], i_key[6'h35], 
                    i_key[6'h18], i_key[6'h03], i_key[6'h34], i_key[6'h30], 
                    i_key[6'h2F], i_key[6'h3D], i_key[6'h2A], i_key[6'h22], 
                    i_key[6'h0A], i_key[6'h1F], i_key[6'h26], i_key[6'h06], 
                    i_key[6'h15], i_key[6'h3A], i_key[6'h14], i_key[6'h1A], 
                    i_key[6'h2C], i_key[6'h19], i_key[6'h11], i_key[6'h0F], 
                    i_key[6'h01], i_key[6'h21], i_key[6'h2E], i_key[6'h3F], 
                    i_key[6'h28], i_key[6'h07], i_key[6'h0B], i_key[6'h16], 
                    i_key[6'h00], i_key[6'h23], i_key[6'h2B], i_key[6'h17], 
                    i_key[6'h05], i_key[6'h31], i_key[6'h33], i_key[6'h24], 
                    i_key[6'h1D], i_key[6'h1C], i_key[6'h3C], i_key[6'h39],  
                    i_key[6'h10], i_key[6'h13], i_key[6'h3B], i_key[6'h1E],
                    i_key[6'h36], i_key[6'h32], i_key[6'h04], i_key[6'h2D] 
                 };
endmodule
