
set fp [open "Log10Energy_2dimers1.dat" w]

for {set s 0} {$s <= 2} {incr s} {
        set d [expr 4.7+(0.1*$s)]
	foreach a [list 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0] {
		set num [expr round([expr 180.0/$a])]
		set numgap [expr $num-1]			
		mol new combine_$d-$a.psf
		mol addfile combine_$d-$a.pdb
        	set all [atomselect top all]
		set energy [namdenergy -nonb -sel $all -par par_all36_prot.prm]
		set nonbenergy [lindex [lindex $energy 0] 4]
		set nonbE_bw2dimers [expr $nonbenergy/$numgap]
		set log10energy [expr log10($nonbE_bw2dimers)]
		puts $fp "$d $a $log10energy"
		$all delete
		mol delete all
	}
}

