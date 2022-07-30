
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

set d 4.6
foreach a [list 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0] {
	set c [expr $c+1]
	fibrilform $all $d $a $c 
	exec deletePdbPsf.sh 
	}


$all delete
mol delete all

