
`timescale 1ns/100ps

// this is a testbench for key_computer module
// author: Simon panti
//			mengxipeng@gmail.com
// refer:
//			cas.cpp in vlc opensource project

module key_computer_tb;
	
	// test 100 times
	reg 	[63:0 ]	cw			[0:99];		// input cws
	reg  	[447:0]	key_except  [0:99];		// output keys
	
	// test variables
	reg 	[63:0 ]	cwt;
	wire    [447:0]	key;	
	
	
	// loop var
	integer 		i;
	
	initial
	begin
		// test data, 
		cw        [  0] =  64'h1b_81_ec_85_1f_54_1a_45;
		key_except[  0] = 448'h1d_87_ea_83_19_52_1c_43_f5_ef_9e_16_47_3f_02_24_7f_05_08_8e_e1_8e_f6_5c_25_65_d5_52_37_04_08_71_6b_0b_0c_37_a8_22_df_8c_ca_d7_56_c9_59_63_39_21_9e_62_22_28_a3_b4_c5_3c;
		cw        [  1] =  64'h40_0c_e3_5a_f3_58_08_0f;
		key_except[  1] = 448'h46_0a_e5_5c_f5_5e_0e_09_0f_85_cd_67_4b_b9_39_50_90_dc_0c_bf_42_2f_05_76_52_33_23_1e_6e_05_b1_d9_e4_49_e3_13_3a_46_18_11_e3_49_1d_05_0a_b9_7c_0a_87_44_c7_8a_c9_2b_21_48;
		cw        [  2] =  64'ha9_fc_0e_65_ac_24_42_07;
		key_except[  2] = 448'haf_fa_08_63_aa_22_44_01_fd_9a_22_6c_0c_0f_2d_29_da_94_f2_24_25_a0_e6_61_3d_9f_a9_1f_90_0a_88_22_3b_02_af_46_52_2c_b5_e7_24_cb_0e_b9_31_cb_87_70_38_32_06_94_30_9f_fc_4a;
		cw        [  3] =  64'h4a_f8_fb_80_36_70_1f_ac;
		key_except[  3] = 448'h4c_fe_fd_86_30_76_19_aa_3e_e4_6d_8e_c7_f7_a8_2c_51_27_50_ce_72_3b_87_3d_20_28_51_2c_f5_0f_cd_d1_6a_1d_17_d3_dc_66_6f_50_c6_2d_37_f8_c9_b1_75_37_ce_f7_02_ee_89_05_b1_17;
		cw        [  4] =  64'h2b_6a_e8_6c_d2_fa_e8_9e;
		key_except[  4] = 448'h2d_6c_ee_6a_d4_fc_ee_98_01_92_48_6f_7f_72_60_7e_91_18_76_ba_6a_9a_c8_92_8b_bd_22_84_fc_66_39_54_f6_eb_a3_5b_4f_ba_6e_b5_d7_84_9d_ae_08_ec_b3_5a_f6_78_db_1c_9d_1f_03_c6;
		cw        [  5] =  64'he6_01_4b_4d_96_01_5d_24;
		key_except[  5] = 448'he0_07_4d_4b_90_07_5b_22_4e_c1_10_e0_46_a3_80_85_57_3e_87_ac_f4_c5_05_38_08_b0_6b_43_03_96_ec_91_37_0d_32_a0_18_61_43_a1_80_37_15_0d_ed_59_e7_84_a4_87_23_c3_91_5c_48_54;
		cw        [  6] =  64'h2b_2f_4c_29_ea_ca_2e_a8;
		key_except[  6] = 448'h2d_29_4a_2f_ec_cc_28_ae_e1_16_53_c5_67_72_ec_71_0b_a8_32_3a_f7_34_cc_96_1b_14_80_4d_df_67_3e_34_8f_ca_3b_eb_0e_be_c4_34_f1_bf_01_ae_98_86_a1_6a_d6_39_e5_50_3d_0d_e6_84;
		cw        [  7] =  64'h3c_ac_45_6c_0c_1f_82_35;
		key_except[  7] = 448'h3a_aa_43_6a_0a_19_84_33_b5_9c_02_22_37_89_a7_e3_78_9c_33_14_59_c5_aa_44_bd_03_a5_96_93_b2_35_b2_6e_62_0d_cc_03_4b_95_a1_2a_60_86_a5_1d_df_81_e9_88_3b_5f_13_30_d1_85_68;
		cw        [  8] =  64'h71_f1_49_67_8d_cb_74_00;
		key_except[  8] = 448'h77_f7_4f_61_8b_cd_72_06_d3_52_b0_e4_23_96_07_cd_66_34_7e_33_e5_c5_4f_89_68_96_e6_43_85_78_1a_92_11_40_3c_69_60_fa_03_e5_48_93_03_3b_cd_5e_ca_58_bb_1e_60_53_34_3c_50_f2;
		cw        [  9] =  64'hb5_be_9a_cc_d1_1f_91_dc;
		key_except[  9] = 448'hb3_b8_9c_ca_d7_19_97_da_1c_ee_e8_73_b4_43_63_d3_30_9b_9f_f4_2a_d6_7a_2f_bf_77_7f_a4_eb_b8_f9_07_e6_f7_25_4c_b5_21_08_ff_3b_80_f6_7c_64_ed_8d_8e_58_98_df_a9_9a_fd_1b_71;
		cw        [ 10] =  64'h06_95_31_34_93_70_5b_c4;
		key_except[ 10] = 448'h00_93_37_32_95_76_5d_c2_34_d1_b4_5b_c5_f5_10_00_15_c6_29_ee_80_99_16_19_33_f9_41_60_07_8c_41_c8_7a_1f_66_33_2c_4b_60_ca_e7_15_77_10_43_51_3b_e4_6e_c0_26_16_c3_78_91_15;
		cw        [ 11] =  64'hf9_3c_3a_9a_5f_96_c9_55;
		key_except[ 11] = 448'hff_3a_3c_9c_59_90_cf_53_8e_aa_a1_16_f0_2a_33_32_70_cf_9e_cd_29_0c_f9_f3_dc_e7_9f_b6_9b_6d_e9_49_f4_3d_49_5e_bb_30_15_6e_aa_c0_f4_ff_22_87_fe_05_35_fe_9f_a0_f7_a5_19_29;
		cw        [ 12] =  64'h34_3f_96_dd_16_6f_c5_51;
		key_except[ 12] = 448'h32_39_90_db_10_69_c3_57_4c_28_3a_b8_f5_19_73_c3_6a_fb_17_d6_8c_c2_38_71_9d_ea_37_f7_a7_ba_f2_2d_17_f7_51_6d_9b_03_b9_eb_fc_52_f0_75_97_ed_87_8d_22_9a_7d_ed_d3_d1_56_69;
		cw        [ 13] =  64'hf3_6c_57_41_6e_5a_ad_1e;
		key_except[ 13] = 448'hf5_6a_51_47_68_5c_ab_18_ca_86_43_a6_fe_b5_2e_5b_fb_b6_d6_5a_4b_25_49_36_98_04_ae_ae_cc_27_d0_b1_e3_7c_99_4b_5b_c4_c1_35_ea_8e_ad_21_b8_9e_e5_1f_96_9e_de_c2_39_03_6d_e7;
		cw        [ 14] =  64'h84_55_47_ee_6f_bd_d2_44;
		key_except[ 14] = 448'h82_53_41_e8_69_bb_d4_42_ad_f9_b6_3a_52_80_0d_d9_5c_9d_e9_15_c1_e1_30_bb_55_cb_f9_ca_09_d8_b1_b0_fc_62_0a_24_f8_5d_a1_c9_a6_18_44_57_7c_5b_0e_f9_a1_02_f7_b7_27_f0_bd_52;
		cw        [ 15] =  64'hca_d1_62_70_f7_80_fc_f3;
		key_except[ 15] = 448'hcc_d7_64_76_f1_86_fa_f5_1b_51_b5_f4_5e_6c_98_3e_c5_74_ec_a8_dc_3c_93_fb_a0_f0_6a_d9_18_4d_87_58_92_29_f6_b2_7d_9c_57_49_80_7c_db_92_ea_08_7f_50_ec_67_b8_d0_c7_2a_38_de;
		cw        [ 16] =  64'hbe_7b_57_36_36_8f_e3_7b;
		key_except[ 16] = 448'hb8_7d_51_30_30_89_e5_7d_28_18_72_10_fa_8c_fa_ef_e9_42_f3_d1_de_e5_b8_f1_cd_e1_0c_ff_d0_fa_d7_bc_18_f7_c1_ec_5b_dd_d7_f8_98_7c_f8_b3_3f_d4_86_ff_a1_bb_78_93_df_d3_be_af;
		cw        [ 17] =  64'he9_32_0b_13_33_5c_b7_d1;
		key_except[ 17] = 448'hef_34_0d_15_35_5a_b1_d7_6a_4e_a1_97_50_df_59_67_06_62_9a_93_28_35_f1_7d_ce_66_48_98_97_09_da_8d_49_e5_52_47_3d_e4_16_6e_d3_ca_d0_b8_e3_10_cc_2d_53_b4_58_c2_d3_a4_fb_98;
		cw        [ 18] =  64'heb_98_16_c0_45_5a_9a_11;
		key_except[ 18] = 448'hed_9e_10_c6_43_5c_9c_17_3f_67_a3_26_b4_3d_24_77_49_15_8a_5e_08_04_cb_6f_a8_05_79_b6_1f_2d_93_23_ca_78_07_0b_b1_00_d7_67_42_c4_a3_d1_70_8d_ed_29_1e_2e_d8_a0_10_21_9d_5d;
		cw        [ 19] =  64'hf7_93_44_57_9b_83_21_f7;
		key_except[ 19] = 448'hf1_95_42_51_9d_85_27_f1_d2_87_b2_71_6a_4c_d2_87_bf_52_8f_a1_dd_d4_5f_d5_ea_75_ae_51_02_f8_44_3d_21_85_ec_a8_2f_91_d2_ed_99_f7_df_12_3f_4e_c8_84_d9_8d_2a_01_f7_7a_5e_ec;
		cw        [ 20] =  64'h55_ce_15_d9_b5_d3_d7_64;
		key_except[ 20] = 448'h53_c8_13_df_b3_d5_d1_62_76_e3_87_f2_b5_90_fb_89_7a_fb_49_e6_10_65_5b_88_30_f6_75_ae_05_f1_64_af_7f_b5_75_89_e0_57_81_0f_7a_aa_77_47_d7_9d_4b_b4_3a_8f_17_63_c6_69_e7_73;
		cw        [ 21] =  64'hdf_39_3d_aa_e9_ca_ba_df;
		key_except[ 21] = 448'hd9_3f_3b_ac_ef_cc_bc_d9_a3_f6_f7_51_b8_fa_2e_76_b9_0d_b9_7b_af_3d_d9_cf_c2_55_dc_fd_de_ed_39_e2_ac_78_a9_7b_a5_fd_d6_5e_49_dc_ed_fe_70_96_78_ea_57_7c_fb_32_2e_6f_bc_bd;
		cw        [ 22] =  64'h84_85_25_10_df_ee_bb_11;
		key_except[ 22] = 448'h82_83_23_16_d9_e8_bd_17_b0_4d_97_48_74_bc_11_52_4c_c6_89_ba_8d_09_2a_de_b5_3b_c8_d3_0f_e5_53_e9_8a_6f_6e_3f_29_d1_b1_02_e4_50_92_03_72_16_39_ac_0e_ca_fc_06_e5_e8_8c_98;
		cw        [ 23] =  64'hc8_a9_68_b8_15_47_42_48;
		key_except[ 23] = 448'hce_af_6e_be_13_41_44_4e_37_38_d5_14_26_13_31_a4_40_4d_b8_86_e6_4c_bf_00_24_e3_19_47_d7_31_2b_5a_1e_01_47_7d_a2_28_07_18_40_11_52_ed_2f_85_5b_63_aa_7e_21_31_ca_a5_88_00;
		cw        [ 24] =  64'h42_60_56_30_5b_e2_a8_f6;
		key_except[ 24] = 448'h44_66_50_36_5d_e4_ae_f0_8b_94_87_1d_ff_74_90_1f_9d_44_7c_ca_5d_10_19_b6_82_69_82_a1_8c_65_85_38_a2_39_ca_cb_7f_9a_e2_08_c5_24_fd_22_1a_06_6d_51_c6_1d_9a_94_e7_22_04_87;
		cw        [ 25] =  64'h1c_a8_75_6e_58_4f_bb_2f;
		key_except[ 25] = 448'h1a_ae_73_68_5e_49_bd_29_b0_dc_46_21_bb_b9_a3_f4_b8_1e_31_db_57_cd_aa_4e_67_23_e4_b7_de_b6_75_f2_ac_7f_8d_dd_00_cb_96_91_49_60_3e_a5_5c_de_30_ef_8f_f9_d3_13_a8_d3_84_f9;
		cw        [ 26] =  64'h97_45_fc_47_03_22_3e_2e;
		key_except[ 26] = 448'h91_43_fa_41_05_24_38_28_61_c7_de_a9_ea_27_86_08_bf_b4_c9_49_f6_8a_4c_1c_53_0c_6c_63_60_a4_0c_71_29_1a_90_ba_68_a1_e8_95_ad_b7_2d_09_f9_6c_38_b3_95_49_26_4c_09_76_cc_f7;
		cw        [ 27] =  64'h85_3c_56_f9_2b_75_66_d0;
		key_except[ 27] = 448'h83_3a_50_ff_2d_73_60_d6_e9_3a_a7_bb_c6_51_3d_83_0a_fd_b9_42_49_70_74_31_97_ce_b8_2c_87_99_a2_38_5f_12_5b_45_bf_8d_a0_4d_e7_8b_e0_74_bf_8a_0f_e1_f2_10_0d_f5_63_e1_fd_c1;
		cw        [ 28] =  64'hcd_58_a5_a2_f0_65_5e_17;
		key_except[ 28] = 448'hcb_5e_a3_a4_f6_63_58_11_27_fb_2f_c9_08_bd_29_be_98_25_e1_af_0c_6b_e5_4b_c6_be_59_1f_3c_9f_01_e2_b8_09_b3_15_c1_4d_be_46_45_c9_9c_d1_f4_b1_72_f0_37_64_8a_7f_80_cb_bc_1a;
		cw        [ 29] =  64'hea_a8_3c_c7_47_91_c4_a9;
		key_except[ 29] = 448'hec_ae_3a_c1_41_97_c2_af_57_20_c2_a6_d0_4e_a4_b4_4b_35_9e_45_32_dc_83_d2_68_80_3b_b4_db_50_0e_61_d1_30_17_d0_ae_30_d7_b3_82_66_23_ea_b4_c9_da_03_69_77_90_61_1d_35_4d_4d;
		cw        [ 30] =  64'h6c_ff_23_ce_7a_9e_2a_4f;
		key_except[ 30] = 448'h6a_f9_25_c8_7c_98_2c_49_bb_ac_70_33_69_a8_69_78_90_99_53_99_83_ad_bf_f7_7e_63_b0_5e_d8_ee_b1_c5_ec_c9_8f_7e_da_d7_14_fb_b3_59_5e_f7_00_de_f4_bb_0d_7c_e7_a2_bf_d3_b3_ca;
		cw        [ 31] =  64'h75_73_97_84_a6_b5_96_76;
		key_except[ 31] = 448'h73_75_91_82_a0_b3_90_70_2f_ee_3a_da_dd_84_cf_8f_fc_21_53_64_98_e3_71_bd_8c_5e_55_ea_a0_da_85_a5_6a_b0_b0_e4_d9_57_ab_ee_9e_b8_ec_73_d5_71_c5_b0_10_17_3a_ef_17_da_b7_33;
		cw        [ 32] =  64'h3d_df_87_97_3b_03_02_b1;
		key_except[ 32] = 448'h3b_d9_81_91_3d_05_04_b7_fd_27_ba_01_61_cd_fb_ab_2a_c1_4b_85_9d_f7_ce_75_fb_27_95_5d_31_b8_86_ad_09_83_4d_a8_ff_47_9c_e6_b9_fb_93_d0_17_f7_8c_b1_59_29_2c_ab_f1_71_f6_2a;
		cw        [ 33] =  64'h8f_61_18_1d_7f_38_dc_35;
		key_except[ 33] = 448'h89_67_1e_1b_79_3e_da_33_c5_c2_94_8a_d4_2b_98_7f_57_6c_dd_dc_b9_a0_c0_5a_81_ac_cb_fa_99_84_3c_09_f7_7b_5a_e2_69_25_77_86_86_fe_b5_ad_e2_43_2b_99_34_33_fb_44_e1_74_69_1f;
		cw        [ 34] =  64'h4a_dc_23_0b_0c_09_87_5c;
		key_except[ 34] = 448'h4c_da_25_0d_0a_0f_81_5a_fe_85_65_94_11_81_24_ea_53_ae_40_15_0f_4d_93_25_f0_40_81_87_51_1b_f0_c3_2d_64_1f_10_53_42_45_5a_20_06_c7_95_85_93_54_3f_09_e6_5f_c3_2a_01_d0_06;
		cw        [ 35] =  64'he1_77_b2_bf_4d_ae_d9_22;
		key_except[ 35] = 448'he7_71_b4_b9_4b_a8_df_24_ce_7a_b8_0c_b8_20_d5_58_c6_cb_fe_5d_95_8a_69_ab_5c_8f_db_e3_a8_6c_f6_4e_95_fc_ca_fe_f0_18_29_e6_34_b2_28_77_62_67_fe_5d_35_df_f5_bc_74_b2_5a_13;
		cw        [ 36] =  64'hdc_1c_86_77_05_65_9b_ab;
		key_except[ 36] = 448'hda_1a_80_71_03_63_9d_ad_6e_5d_ee_28_18_7d_b7_a1_ea_d6_a9_0f_16_d2_a1_6d_54_0b_6d_95_76_9c_c6_2a_09_2c_c1_85_34_09_bd_d3_6c_62_08_90_77_e9_6c_e7_47_a7_14_9d_48_f3_dc_78;
		cw        [ 37] =  64'h54_fa_94_d8_c9_ed_0c_bb;
		key_except[ 37] = 448'h52_fc_92_de_cf_eb_0a_bd_97_2c_ef_e9_8d_78_f7_df_a8_79_5d_7e_1f_52_27_c7_a6_1a_b7_35_ec_dd_37_2f_86_d8_fd_c5_e7_13_ba_53_5d_61_aa_76_96_ab_69_9a_4e_15_c9_6d_6c_eb_16_6b;
		cw        [ 38] =  64'h7b_04_82_68_80_0c_5e_3c;
		key_except[ 38] = 448'h7d_02_84_6e_86_0a_58_3a_2f_db_49_e5_05_21_86_63_35_bc_22_3c_1e_06_e5_28_9e_94_65_03_73_07_b5_02_3e_48_30_86_11_0a_4c_37_29_a5_84_85_c1_29_e7_6a_34_25_4f_d8_18_88_80_74;
		cw        [ 39] =  64'h11_6f_2f_14_ea_09_37_bc;
		key_except[ 39] = 448'h17_69_29_12_ec_0f_31_ba_a8_c6_56_c5_45_c7_ff_da_38_e2_50_30_bf_fd_44_3e_93_16_c4_4d_c9_12_dd_ed_aa_c6_79_f0_5d_e6_80_96_b9_b9_85_28_d6_d2_15_3e_50_d1_ee_c3_69_1d_a6_b2;
		cw        [ 40] =  64'hf0_38_29_ab_16_32_31_ed;
		key_except[ 40] = 448'hf6_3e_2f_ad_10_34_37_eb_42_f4_61_1e_60_cb_a3_04_72_0f_b6_81_32_19_1d_5d_48_6b_5e_14_c3_2b_6c_c0_65_05_01_da_8c_e8_33_7a_8e_63_55_7c_61_94_d0_47_41_df_03_36_9b_05_59_b8;
		cw        [ 41] =  64'h81_9c_35_60_eb_58_5b_23;
		key_except[ 41] = 448'h87_9a_33_66_ed_5e_5d_25_b4_53_a7_67_cc_bd_ad_50_88_96_a8_7e_11_2d_46_5b_33_97_e9_3e_0e_0d_57_e0_da_5e_af_93_28_4c_90_47_e3_e9_2b_11_70_9b_3b_6c_3e_c1_c4_12_21_2b_bd_59;
		cw        [ 42] =  64'h45_9e_cb_4c_a0_4e_b6_d9;
		key_except[ 42] = 448'h43_98_cd_4a_a6_48_b0_df_3b_4f_6c_f1_37_db_6d_43_00_b8_01_32_6e_b7_7b_6d_b6_56_60_9d_67_aa_bb_97_0e_e0_37_0f_15_e7_18_dd_71_c8_c2_1c_c9_fc_45_aa_da_0c_5d_ca_0a_dd_b2_d8;
		cw        [ 43] =  64'h4d_84_97_ea_43_6d_b8_2d;
		key_except[ 43] = 448'h4b_82_91_ec_45_6b_be_2b_1b_ff_cf_29_d1_b9_85_f1_1c_9d_2d_5b_16_43_e3_7e_76_0f_72_b3_7f_95_b5_a0_a4_78_06_85_b8_cb_bc_17_e5_e0_26_c5_54_38_6c_cb_1f_25_d7_bf_09_e0_04_d9;
		cw        [ 44] =  64'hc2_5a_f8_99_36_13_cd_5f;
		key_except[ 44] = 448'hc4_5c_fe_9f_30_15_cb_59_46_a1_6d_96_fe_2b_78_8e_d3_6b_c4_cc_6a_6e_19_51_80_e0_1b_be_60_3f_68_5d_77_bd_d3_18_cb_24_5b_58_92_4e_fd_5d_af_a5_73_17_a4_ce_1b_69_cb_07_7b_0f;
		cw        [ 45] =  64'h5e_6e_85_1d_ad_20_d1_55;
		key_except[ 45] = 448'h58_68_83_1b_ab_26_d7_53_c6_c0_8e_58_15_89_7e_2b_7b_ca_5d_24_0d_a3_91_48_90_d9_c7_9f_b1_80_60_af_37_a4_69_42_61_47_fd_8a_3c_4e_c5_a5_53_f3_4b_94_20_b6_1f_0e_62_79_66_3e;
		cw        [ 46] =  64'hf1_d2_83_1f_32_78_97_1a;
		key_except[ 46] = 448'hf7_d4_85_19_34_7e_91_1c_7e_47_68_8f_58_91_5b_4f_a6_6a_c2_97_0a_a3_43_3d_ea_2e_4d_8a_64_0a_f2_8d_4d_e5_d4_03_59_44_2a_f6_df_8a_9b_15_e3_71_c4_3f_1b_84_59_ce_d9_12_fb_32;
		cw        [ 47] =  64'hdd_de_70_a8_22_83_65_5b;
		key_except[ 47] = 448'hdb_d8_76_ae_24_85_63_5d_12_33_65_91_ee_08_6f_aa_a0_ab_e5_40_4e_6c_df_d1_b2_c6_1e_3f_50_fb_63_54_16_94_95_18_cb_9d_14_5c_b9_c9_eb_d7_ad_84_53_d7_b8_ec_0d_71_0f_43_3a_ab;
		cw        [ 48] =  64'h9a_ab_7c_aa_2d_b0_75_e9;
		key_except[ 48] = 448'h9c_ad_7a_ac_2b_b6_73_ef_90_70_d7_9e_82_4a_ee_24_69_2b_bc_41_f3_38_96_c8_61_c8_de_7c_d3_41_6f_76_54_96_1d_f2_a4_bc_f7_18_1e_7d_63_ee_f9_82_1a_47_e9_f3_21_74_2e_25_2f_bd;
		cw        [ 49] =  64'h33_99_0b_78_d9_ed_76_3a;
		key_except[ 49] = 448'h35_9f_0d_7e_df_eb_70_3c_b9_5b_f1_ed_0d_92_b2_d7_a1_7c_2a_b2_bf_41_66_ab_af_bc_e4_47_4e_59_bf_8a_9e_43_fd_a5_31_fa_62_77_4d_b5_9a_1f_c6_9a_8f_6a_3a_01_e9_d7_fc_af_90_f4;
		cw        [ 50] =  64'hc6_ca_34_48_ff_31_09_e7;
		key_except[ 50] = 448'hc0_cc_32_4e_f9_37_0f_e1_96_85_87_7a_cc_69_e8_9c_d9_1a_cd_ec_11_78_17_56_20_79_ab_3c_08_95_65_65_e6_9d_af_90_6e_05_f3_0b_96_6d_7f_04_34_8b_79_94_4c_c7_83_05_a3_6b_2f_4f;
		cw        [ 51] =  64'h08_a4_45_b8_4d_f3_45_2f;
		key_except[ 51] = 448'h0e_a2_43_be_4b_f5_43_29_94_b0_c7_8e_2f_98_95_b1_dc_ef_3c_06_53_41_8e_c2_31_8a_93_12_de_71_65_ba_f6_06_de_c9_a2_5a_b5_10_66_61_0f_e7_9e_17_0b_47_aa_bb_87_77_6c_22_05_08;
		cw        [ 52] =  64'hc0_53_3c_46_c2_b0_34_73;
		key_except[ 52] = 448'hc6_55_3a_40_c4_b6_32_75_03_45_36_ff_c8_0e_c5_1e_8c_30_c4_61_b8_88_15_df_c2_5a_6a_72_08_4a_0f_65_c0_90_b2_b2_49_b0_b2_cb_97_71_e9_1b_f0_48_50_10_01_45_a8_44_07_1e_1f_db;
		cw        [ 53] =  64'h47_44_4f_d7_35_69_53_b8;
		key_except[ 53] = 448'h41_42_49_d1_33_6f_55_be_6e_63_c6_28_03_d7_98_cb_4f_d7_49_97_7e_f1_45_28_d0_ad_71_09_45_90_de_bb_19_45_42_81_f5_67_e1_95_64_af_91_48_5f_59_4e_bf_f3_87_4c_a7_c8_74_e4_56;
		cw        [ 54] =  64'h0e_ab_65_31_cf_22_15_28;
		key_except[ 54] = 448'h08_ad_63_37_c9_24_13_2e_d4_54_d7_c8_67_85_f4_34_4b_62_3d_24_d7_09_8e_1e_21_18_c3_47_db_a1_46_fc_83_86_7f_fa_28_4b_e7_10_94_37_03_a1_da_97_19_c6_88_fb_a0_56_69_69_46_14;
		cw        [ 55] =  64'h18_ff_9b_81_8c_64_60_91;
		key_except[ 55] = 448'h1e_f9_9d_87_8a_62_66_97_d9_28_3d_4c_85_df_67_2b_62_81_54_62_ad_13_a6_61_b5_9b_96_75_b5_0b_8a_87_13_92_2d_67_d7_e2_3d_42_7c_53_a2_f8_01_b2_07_10_6a_32_2c_ae_20_8d_52_ab;
		cw        [ 56] =  64'h7b_79_c1_d6_bf_bc_0f_e5;
		key_except[ 56] = 448'h7d_7f_c7_d0_b9_ba_09_e3_a6_ae_b8_fe_43_ec_ba_6d_71_77_5a_bd_d1_b3_f5_d5_4c_7c_b5_5c_b1_4c_55_99_68_4d_79_e6_ee_56_7f_ed_8e_fd_54_f2_8b_fb_e8_3c_d5_b7_62_6e_f7_b9_b1_6e;
		cw        [ 57] =  64'he3_98_da_a3_8b_3a_6f_b8;
		key_except[ 57] = 448'he5_9e_dc_a5_8d_3c_69_be_fa_33_e9_cf_e2_67_a4_47_03_27_aa_79_7b_12_4f_31_ea_9c_98_24_63_2d_de_10_59_5c_3f_8a_bf_a8_6a_74_87_a7_a3_58_a9_a6_ee_6e_fd_8d_48_fc_39_2d_d9_85;
		cw        [ 58] =  64'h0f_a0_9f_41_6a_f2_c2_c5;
		key_except[ 58] = 448'h09_a6_99_47_6c_f4_c4_c3_fd_82_0f_3b_f5_de_0c_35_1f_14_11_46_21_33_da_f2_23_cd_a1_b8_bf_e3_88_a1_fb_32_0e_4b_1e_77_fe_0f_c7_ce_67_aa_10_3f_07_a1_7a_38_92_8e_27_44_e5_4d;
		cw        [ 59] =  64'h53_16_fc_6b_a9_7f_bf_6a;
		key_except[ 59] = 448'h55_10_fa_6d_af_79_b9_6c_e2_5f_ef_ff_bb_33_ce_c0_af_ba_28_7b_73_6a_79_0d_56_5c_e4_aa_66_3d_7e_76_4d_fc_b8_9d_20_ae_e8_5d_7f_ae_68_1d_dd_2e_78_6e_97_cd_55_5d_2a_ae_f7_f5;
		cw        [ 60] =  64'h14_45_91_c0_ea_7b_10_27;
		key_except[ 60] = 448'h12_43_97_c6_ec_7d_16_21_85_e5_1d_6b_ed_9d_8f_d9_b4_95_45_76_91_63_0c_5e_13_1b_f7_7a_2c_b3_15_81_e2_52_a8_a9_c8_47_38_03_ef_79_2d_41_44_3f_01_98_02_09_e6_2f_21_4a_21_7b;
		cw        [ 61] =  64'h4f_bd_33_45_a1_08_d2_23;
		key_except[ 61] = 448'h49_bb_35_43_a7_0e_d4_25_7f_42_b4_61_9d_8d_ac_60_83_94_19_74_94_ad_c3_69_32_95_61_ff_92_88_96_c3_1b_70_a7_f2_30_47_54_c7_21_fe_2b_b1_41_d9_5f_a8_38_75_74_82_00_7b_f0_5d;
		cw        [ 62] =  64'h13_ce_69_e0_97_4a_19_a7;
		key_except[ 62] = 448'h15_c8_6f_e6_91_4c_1f_a1_14_f7_85_64_6f_ff_e2_48_f1_93_6c_be_74_1d_4e_5c_31_35_77_15_04_25_5d_d4_22_cf_a5_9b_ec_6a_51_05_f8_e5_1f_48_49_9d_39_5c_de_cb_46_32_81_2f_02_7e;
		cw        [ 63] =  64'h02_12_ef_de_6a_eb_69_a0;
		key_except[ 63] = 448'h04_14_e9_d8_6c_ed_6f_a6_88_21_2e_2d_63_f2_dc_d4_0d_5b_04_1b_75_fb_0c_b3_43_89_b2_09_2f_7e_ff_fd_94_ce_4a_99_9e_f6_ea_c1_d5_2d_01_5e_1e_7e_36_0d_e7_c9_c1_af_65_14_36_c4;
		cw        [ 64] =  64'hd3_e0_36_6e_0b_96_3e_21;
		key_except[ 64] = 448'hd5_e6_30_68_0d_90_38_27_bb_5e_86_a7_e0_28_86_0c_2d_3c_f8_49_11_8c_6f_fc_66_04_ec_32_81_64_a7_60_4c_18_1c_de_78_98_d2_87_8b_e5_22_27_f1_4e_7c_71_1d_5d_01_d0_25_b0_8d_ff;
		cw        [ 65] =  64'hd3_da_e2_23_3f_7c_85_df;
		key_except[ 65] = 448'hd5_dc_e4_25_39_7a_83_d9_de_9f_ed_9e_5a_5d_6a_4e_f3_22_ec_97_4b_3a_73_75_e4_6c_8f_9c_64_09_d0_54_61_e5_9d_17_7f_0c_7b_5c_de_ce_de_10_a9_a3_5c_5f_db_c6_5a_dc_ab_a3_7b_2e;
		cw        [ 66] =  64'h60_60_4b_76_20_d2_20_b4;
		key_except[ 66] = 448'h66_66_4d_70_26_d4_26_b2_0b_94_00_27_23_d6_9d_0f_14_54_76_03_78_b5_0d_a4_ca_03_22_08_85_62_8d_9a_60_00_42_cb_57_fe_02_a1_43_29_85_2a_0b_5c_c4_51_c3_1d_0a_92_54_14_21_c2;
		cw        [ 67] =  64'h6c_1a_fd_42_99_50_66_1d;
		key_except[ 67] = 448'h6a_1c_fb_44_9f_56_60_1b_a3_81_eb_e3_83_9f_61_26_18_30_0b_e3_6b_0f_85_41_ca_b2_a0_36_77_89_09_f7_78_91_3b_13_23_e3_9e_71_53_41_b5_99_99_ba_da_a2_a3_64_0a_4a_b8_6d_97_c9;
		cw        [ 68] =  64'h00_72_38_46_ec_b4_a1_bc;
		key_except[ 68] = 448'h06_74_3e_40_ea_b2_a7_ba_80_8c_64_6e_91_46_cd_1e_54_12_54_61_3b_b8_20_87_c5_1b_a2_a8_c9_4a_4d_47_e0_b6_2a_d6_47_b6_23_d3_16_28_a4_3a_00_4a_10_16_41_d3_9a_04_2c_9c_33_c3;
		cw        [ 69] =  64'hb7_17_70_a7_2f_3d_8f_d6;
		key_except[ 69] = 448'hb1_11_76_a1_29_3b_89_d0_e4_bf_b0_9a_da_65_4e_c2_f7_a3_ab_5d_c9_f8_70_15_dd_4c_9d_e8_02_9c_50_54_69_fe_98_34_af_0d_61_ec_be_9e_ec_50_ad_43_b8_ed_d5_c2_7e_75_33_f2_fb_25;
		cw        [ 70] =  64'h3e_7c_cd_6b_cb_31_e1_d5;
		key_except[ 70] = 448'h38_7a_cb_6d_cd_37_e7_d3_c0_90_ab_7b_53_cb_26_bb_3b_9e_7f_21_69_53_90_53_db_d9_a6_94_b9_99_68_b0_f5_26_29_40_6f_eb_fc_69_af_46_c5_bc_1c_ba_8a_d4_e1_b0_9f_1f_33_6d_55_ee;
		cw        [ 71] =  64'hdb_57_ac_ff_fc_58_bf_c7;
		key_except[ 71] = 448'hdd_51_aa_f9_fa_5e_b9_c1_e2_f7_3e_f6_18_7b_5a_78_ff_fb_e0_bb_a1_be_d1_4f_50_74_fc_d8_3c_0e_78_6e_ed_ed_f8_33_c4_ac_dd_cf_7a_de_5d_dc_f2_6a_70_7c_57_e6_f7_78_e2_1e_ff_fe;
		cw        [ 72] =  64'he3_22_1d_b2_54_7e_42_de;
		key_except[ 72] = 448'he5_24_1b_b4_52_78_44_d8_27_ba_43_1e_a8_d7_50_57_dd_41_b2_d7_2a_11_7d_02_cc_ed_19_20_ce_23_19_ae_f8_d1_c2_4f_87_68_e3_3e_56_85_fc_68_32_15_c2_6b_73_1e_ca_36_da_86_8f_05;
		cw        [ 73] =  64'h42_9d_64_38_38_f4_f8_ee;
		key_except[ 73] = 448'h44_9b_62_3e_3e_f2_fe_e8_93_d9_77_1f_1f_70_b8_00_99_cc_24_8a_d3_38_33_89_36_e9_c2_cc_46_4f_25_7a_76_29_cf_b7_04_9e_e0_58_67_3c_5e_16_5b_82_73_43_ee_45_37_14_ee_83_35_94;
		cw        [ 74] =  64'hf7_4b_78_28_61_10_64_f3;
		key_except[ 74] = 448'hf1_4d_7e_2e_67_16_62_f5_03_13_91_93_8e_4b_ee_1e_a1_28_ef_40_f8_3c_55_42_8a_c4_0e_7c_08_81_2f_56_d6_90_91_b2_67_ad_52_2c_1b_fd_e9_0c_a8_80_db_d1_f0_45_a9_50_12_67_2b_af;
		cw        [ 75] =  64'h95_f0_87_7d_5c_a9_7b_88;
		key_except[ 75] = 448'h93_f6_81_7b_5a_af_7d_8e_f8_52_6e_28_04_e0_13_dd_6e_5e_f1_98_07_d3_46_ab_21_af_ec_01_e9_de_f2_aa_9f_4f_4c_40_54_d9_ab_d7_0c_83_13_36_76_7a_27_ff_7c_92_c1_9f_ec_50_dc_f2;
		cw        [ 76] =  64'hc4_19_6f_19_0a_9b_28_70;
		key_except[ 76] = 448'hc2_1f_69_1f_0c_9d_2e_76_cb_05_37_13_66_a2_b5_c6_0a_4c_85_18_f9_4d_1d_b5_82_43_8a_46_03_ff_be_f9_47_48_4b_b8_1b_f1_82_48_83_33_c1_1f_3f_96_75_89_84_4d_69_83_67_45_5d_80;
		cw        [ 77] =  64'hbd_94_46_3d_21_49_c9_11;
		key_except[ 77] = 448'hbb_92_40_3b_27_4f_cf_17_5c_13_a2_01_16_39_1f_e3_2e_ce_af_1e_4c_e4_c2_61_bb_87_0f_9b_17_9c_f2_3a_17_6e_44_01_33_0d_94_e4_69_ca_83_95_3f_41_af_cd_be_a0_5d_91_50_70_7c_28;
		cw        [ 78] =  64'hd2_f4_d3_13_a9_16_af_f4;
		key_except[ 78] = 448'hd4_f2_d5_15_af_10_a9_f2_fa_8c_ad_d7_b2_e5_9e_0b_37_e6_d8_69_59_37_3b_25_f6_50_8c_a8_a1_2d_c4_9b_69_3c_7c_ce_77_c4_48_48_2b_2e_e6_30_ab_36_6c_34_cd_9d_1e_ca_62_a8_f9_a7;
		cw        [ 79] =  64'he3_0e_13_25_80_eb_a2_47;
		key_except[ 79] = 448'he5_08_15_23_86_ed_a4_41_6b_97_00_5d_bc_9c_64_c1_93_80_a2_72_04_c1_59_e4_1a_5d_08_b7_06_72_90_86_2b_f0_a3_09_12_d8_70_ae_75_c6_6d_03_25_d4_c5_68_12_0c_56_97_16_1b_ca_8d;
		cw        [ 80] =  64'hea_7f_b5_e3_d7_b4_5b_5b;
		key_except[ 80] = 448'hec_79_b3_e5_d1_b2_5d_5d_66_78_fb_7e_c8_ac_60_3a_cb_93_fa_ed_8a_0b_b5_db_dc_f9_79_76_f8_4d_42_e4_d9_9d_a3_76_e9_58_fd_7b_b6_57_f8_f3_70_b9_fa_76_25_f6_ac_3e_9f_ab_df_5f;
		cw        [ 81] =  64'h70_24_9f_20_b3_e3_09_26;
		key_except[ 81] = 448'h76_22_99_26_b5_e5_0f_20_0e_94_8b_4d_ed_b6_8b_81_bc_86_3e_ee_34_63_0d_b4_1a_3b_07_2b_a6_75_cd_a0_22_1d_a0_c9_3a_7e_a8_22_ed_29_3d_2b_15_35_ed_44_06_9d_06_9f_95_2e_24_21;
		cw        [ 82] =  64'h16_9f_67_95_6d_ec_cc_c2;
		key_except[ 82] = 448'h10_99_61_93_6b_ea_ca_c4_dd_29_b6_98_1f_f4_7e_50_eb_e1_0d_1e_c5_b9_32_a3_35_c8_97_cd_0e_cc_92_ff_93_ea_dd_37_b6_57_e1_c8_7c_1e_4a_52_9a_d3_3f_89_ee_42_f4_e6_66_f3_76_24;
		cw        [ 83] =  64'h0d_d9_da_5d_32_c7_3d_ec;
		key_except[ 83] = 448'h0b_df_dc_5b_34_c1_3b_ea_58_cf_7c_b1_e7_72_b9_ad_12_7e_45_ca_f6_f6_fe_bd_27_66_62_6d_75_fe_ec_19_27_1f_57_ad_5c_b7_0e_dd_c1_bb_76_9e_cf_ec_25_97_de_a9_23_c9_cf_d5_70_d3;
		cw        [ 84] =  64'h9e_7b_78_77_83_71_e4_85;
		key_except[ 84] = 448'h98_7d_7e_71_85_77_e2_83_41_90_b4_eb_d2_5f_76_ac_33_70_fd_63_e0_d8_80_51_43_98_2e_f4_95_98_08_5c_71_b2_71_71_6e_a9_76_c1_df_56_25_b8_af_c8_1a_d0_e3_70_32_55_41_7d_5b_ef;
		cw        [ 85] =  64'ha3_73_f5_48_b6_6b_c0_15;
		key_except[ 85] = 448'ha5_75_f3_4e_b0_6d_c6_13_05_82_3b_6c_f6_99_48_ce_5d_18_d6_f6_cc_6b_48_51_89_bd_2b_fb_a5_3b_31_f5_36_f3_22_79_4b_44_fb_65_d4_dc_b5_35_3d_3d_93_18_b2_5a_7b_0f_91_08_3e_4f;
		cw        [ 86] =  64'h0c_76_ba_17_73_39_c3_43;
		key_except[ 86] = 448'h0a_70_bc_11_75_3f_c5_45_6c_00_ac_1b_d9_0f_59_f8_86_c2_59_d5_20_ea_90_73_53_eb_01_ba_b8_98_da_4d_d9_f7_c2_50_7a_27_3c_ca_b7_4a_79_b9_06_61_1e_bd_21_f0_d4_8d_c3_76_f3_0b;
		cw        [ 87] =  64'h5b_78_63_8e_38_e4_53_5e;
		key_except[ 87] = 448'h5d_7e_65_88_3e_e2_55_58_ae_ea_64_1d_0b_90_2a_2e_b1_0f_50_87_4f_a9_f5_a9_c6_ed_d5_0f_d4_4a_e1_d3_3c_05_89_57_d1_56_66_dc_4d_8d_dc_f7_49_d3_56_37_b3_f4_0b_a6_ae_93_b0_36;
		cw        [ 88] =  64'h28_35_3f_3f_d6_79_ca_d8;
		key_except[ 88] = 448'h2e_33_39_39_d0_7f_cc_de_6d_10_72_5e_d1_f3_11_f2_4e_cc_32_ff_aa_d9_90_33_d9_fb_01_e0_df_1e_ba_e8_dd_7b_62_71_1f_6a_a5_fa_e6_12_f1_bc_16_51_b6_6a_67_72_fd_97_db_1c_d5_01;
		cw        [ 89] =  64'h9e_ac_d3_1d_f2_88_f6_c6;
		key_except[ 89] = 448'h98_aa_d5_1b_f4_8e_f0_c0_79_c0_0c_d1_de_c0_3a_71_b3_ec_91_f0_44_b7_92_ba_33_f0_4c_ad_ba_c2_b0_99_bf_73_f5_42_1c_d5_4c_88_a9_0e_7f_a6_ea_f0_07_a8_e8_30_d7_ca_c7_5b_e8_b5;
		cw        [ 90] =  64'hfc_9e_56_ff_84_a6_9a_61;
		key_except[ 90] = 448'hfa_98_50_f9_82_a0_9c_67_7f_7d_22_78_b2_28_f7_21_6a_d9_a3_6d_54_80_bb_ed_7c_5b_7d_b7_13_ee_a6_3e_0d_b8_65_8e_90_19_b5_e9_3c_62_62_d7_7b_cd_e4_e0_8d_2f_15_b4_56_d9_de_79;
		cw        [ 91] =  64'h15_14_36_21_5b_ec_ec_87;
		key_except[ 91] = 448'h13_12_30_27_5d_ea_ea_81_c9_9b_a7_89_dd_7c_03_50_be_a4_2d_da_05_18_60_f3_17_ae_86_b1_0e_cd_90_60_b3_7b_98_17_3e_9b_b0_46_ed_c2_3c_12_90_02_3f_c9_76_40_d6_d4_a5_e2_54_a9;
		cw        [ 92] =  64'hd0_d6_92_a2_98_75_15_3b;
		key_except[ 92] = 448'hd6_d0_94_a4_9e_73_13_3d_9e_7d_6d_cf_88_1d_c3_8b_a4_a3_e4_e7_1b_42_27_6d_f6_3a_df_32_64_1b_c7_06_40_95_bc_85_d1_08_38_52_7f_61_ba_51_e5_23_44_56_0b_85_0c_fd_a8_8a_1b_3b;
		cw        [ 93] =  64'ha8_f5_be_07_2e_e3_b4_20;
		key_except[ 93] = 448'hae_f3_b8_01_28_e5_b2_26_d9_44_3a_8c_f0_16_8d_a8_4e_a4_d6_43_b5_ea_8a_bd_79_0a_ca_eb_b5_7a_8e_61_01_32_1e_f9_58_b4_ad_e2_e4_3a_23_bb_f5_66_94_11_0b_7b_34_cd_35_14_7c_93;
		cw        [ 94] =  64'h2d_42_c3_b6_68_db_5b_02;
		key_except[ 94] = 448'h2b_44_c5_b0_6e_dd_5d_04_ac_73_08_03_2b_b4_5d_fd_84_43_63_1f_41_e7_cc_aa_4b_87_d1_0a_3c_f6_d3_9e_d8_ce_ca_09_d0_5f_0e_a4_53_89_09_c3_4e_77_a6_fd_b7_a8_c0_bb_74_52_a3_12;
		cw        [ 95] =  64'h82_d4_dc_7c_63_84_10_4e;
		key_except[ 95] = 448'h84_d2_da_7a_65_82_16_48_15_dd_ee_35_ce_02_1c_19_9d_dc_ec_44_66_a6_36_9f_37_41_6b_2b_68_48_29_38_a6_12_c6_06_68_3c_c8_d9_a1_0d_6e_1f_7a_69_09_53_88_00_87_18_4f_b6_3c_57;
		cw        [ 96] =  64'hde_86_f9_08_90_0c_ce_95;
		key_except[ 96] = 448'hd8_80_ff_0e_96_0a_c8_93_37_89_0d_c1_96_eb_42_62_35_a8_81_fc_6c_1f_a3_40_b6_b0_0d_b1_33_87_39_d7_3e_f9_34_16_07_61_5c_00_39_44_b6_8c_a9_31_73_a8_ec_64_5f_4a_80_cc_8a_2d;
		cw        [ 97] =  64'h0b_76_40_6e_34_24_01_0d;
		key_except[ 97] = 448'h0d_70_46_68_32_22_07_0b_04_9e_64_2c_03_09_48_29_55_9a_74_85_46_a0_e4_45_55_2d_23_1b_d1_0a_61_16_24_87_02_46_42_0e_75_d5_34_cd_14_b5_09_49_00_57_91_b2_07_14_88_90_32_4e;
		cw        [ 98] =  64'he9_88_87_a5_e7_7f_0e_10;
		key_except[ 98] = 448'hef_8e_81_a3_e1_79_08_16_7f_3f_8a_ce_64_b5_2d_f7_4a_25_aa_3e_08_e3_ef_36_ac_1e_19_0e_3f_34_92_a0_cb_48_37_0d_bb_4c_af_a6_c6_8b_82_c1_b4_f5_ed_68_1e_2e_c8_ff_11_b9_ed_00;
		cw        [ 99] =  64'heb_e1_dc_09_18_56_c8_9b;
		key_except[ 99] = 448'hed_e7_da_0f_1e_50_ce_9d_d7_0a_5b_07_be_7b_00_2f_8f_0c_d6_ce_eb_16_eb_40_ae_a5_8b_f0_f4_27_2a_33_57_39_8e_6f_47_20_de_34_43_d6_ba_ac_39_27_e3_13_fe_3c_39_08_b8_86_4d_0f;
	
		#2;
		
		for(i=0;i<100;i=i+1)
		begin
			cwt=cw[i];
			#2;
			if(key!=key_except[i])
				$display("error at %d",i);
			#2;
		end
		
		#2;
		$finish;
	end
	
	
	key_computer k(
						.cw(cwt)
						,.key(key)
					);
endmodule