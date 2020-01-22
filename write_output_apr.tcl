change_names -rules verilog -hierarchy
write_verilog "VS_lib_icc.output.v" 
write_sdf "VS_lib_icc.output.sdf" 
write_sdc "VS_lib_icc.output.sdc"
extract_rc -coupling_cap
write_parasitics -format SBPF -output "VS_lib_icc.output.sbpf"
set_write_stream_options -child_depth 20 -flatten_via
write_stream -format oasis -lib_name /tmp/pdtry/sifive_u74_risc_v_core_eval_kit/VS_lib_icc -cells {BLOCKNAME} BLOCKNAME.oas
save_mw_cel
close_mw_cel
quit
