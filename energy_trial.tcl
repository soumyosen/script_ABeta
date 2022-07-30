
set fp [open "Log10Energy_2dimers_trial1.dat" w]

foreach a [list 3.9 4.0 4.1] {
	set num [expr round([expr 180.0/$a])]
        set numgap [expr $num-1]
	for {set s 0} {$s <= 10} {incr s} {
        	set d [expr 5.0+(0.1*$s)]
		mol new combine_6.0-$a.psf
		mol addfile combine_6.0-$a.pdb
        	set all [atomselect top all]
		set energy [namdenergy -nonb -sel $all -par par_all36_prot.prm]
		set nonbenergy [lindex [lindex $energy 0] 4]
		set nonbE_bw2dimers [expr $nonbenergy/$numgap]
		set log10energy [expr log10($nonbE_bw2dimers)]
		puts $fp "$numgap $nonbenergy $nonbE_bw2dimers $log10energy"
		#puts $fp "$d $a $log10energy"
		$all delete
		mol delete all
	}
}

