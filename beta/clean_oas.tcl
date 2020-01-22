layout open /tmp/pdtry/sifive_u74_risc_v_core_eval_kit/BLOCKNAME.oas ??
#Returns extent of selected object(s)
proc getExt {ids} {
  set x []; set y [];
  foreach id $ids {
    set coords [cell object info $id coords]
    #Separate coordinates into x/y
    for {set i 0} {$i < [llength $coords]} {incr i} {
      set n [lindex $coords $i]
      if {[expr $i %2] == 0} {lappend x $n} else {lappend y $n}
    }
  }
  set x [lsort -real $x]; set y [lsort -real $y];
  return [list [lindex $x 0]  [lindex $y 0] [lindex $x end] [lindex $y end]]
}
proc add { lay } {
  edit
  set z {0 0 0 0}
  set dldt $lay
  if {$dldt ne ""} {
    rectangle -layer $lay $z
    #ln
    select at $z
    select delete
  }
}
proc edit { } {
  if {[cell edit_state] ne {Cell is in "editable" mode.}} {
    cell edit_state 1
    }
}


#Draw rectangle at extent
proc ext {lay} {
 layer add $lay
  rectangle -layer [$lay] [getExt [select list]]
}
layout display filter_layer_hier 1
layout display layer_hier_level {0-10}
add 50:0
layer delete 81:0
layer delete 94:0
layer delete 97:0
layer show *
view default
#set coordfc [view coords]
#set x [select at $coordfc]
rectangle -layer 50:0 [getExt [select at [view coords]]]
layer hide *
layer show 50:0
layout save -format oasis /tmp/pdtry/sifive_u74_risc_v_core_eval_kit/BLOCKNAME.oas -rename /tmp/pdtry/sifive_u74_risc_v_core_eval_kit/BLOCKNAME.oas
exit
