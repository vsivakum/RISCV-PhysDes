change_names -rules verilog -hierarchy
write -format ddc -hierarchy -output BLOCKNAME.ddc
write -f verilog -hierarchy -output BLOCKNAME.v
write_sdf BLOCKNAME.sdf
write_sdc -nosplit BLOCKNAME.sdc
write_milkyway -overwrite -output "BLOCKNAME_DCT"
report_timing -transition_time -nets -attributes -nosplit
report_area -nosplit -hierarchy
report_power -nosplit -hier
report_reference -nosplit -hierarchy
report_resources -nosplit -hierarchy
exit 0
