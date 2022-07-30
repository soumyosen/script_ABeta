
proc fibrilform { sel dist ang count } {
	 
	puts "Start system $count"
	set num [expr round([expr 180.0/$ang])]

	for {set i 1} {$i <= $num} {incr i} {
		set tr [vecscale $i "0.0 0.0 $dist"]
		$sel moveby [vecinvert [measure center $sel weight mass]]
		$sel move [transaxis z $ang deg]
		$sel moveby $tr
		[atomselect top {chain B}] set segname B$i
		[atomselect top {chain H}] set segname H$i
		$sel writepdb z_$count-$i.pdb
		$sel writepsf z_$count-$i.psf
	}
	package require psfgen
	
	for {set j 1} {$j <= $num} {incr j} {
		readpsf z_$count-$j.psf
		coordpdb z_$count-$j.pdb
	}

	writepsf combine_$dist-$ang.psf
	writepdb combine_$dist-$ang.pdb
	resetpsf
}

mol new bh.psf
mol addfile bh.pdb
set all [atomselect top all]
set c 0

for {set s 3} {$s <= 13} {incr s} {
	set d [expr 4.7+(0.1*$s)]
        foreach a [list 0.2] {
		set c [expr $c+1]
		fibrilform $all $d $a $c 
		exec deletePdbPsf.sh 
	}
}

$all delete
mol delete all

