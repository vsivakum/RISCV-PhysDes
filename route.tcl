route_opt -initial_route_only
route_opt -skip_initial_route -effort low
route_opt -incremental -size_only
verify_zrt_route
source write_output_apr.tcl

