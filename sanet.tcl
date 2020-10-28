#=== Node Configuration options ===#
##= Channel Type =##
set val(chan) Channel/WirelessChannel;
##= Radio-propagation model =##
set val(prop) Propagation/TwoRayGround;
##= Network interface type =##
set val(netif) Phy/WirelessPhy;
##= MAC type=##
set val(mac)  Mac/802_11 ;
##= Interface queue type=##
set val(ifq) Queue/DropTail/PriQueue ;
##= Link layer type=##
set val(ll)  LL;
##= Antenna model=##
set val(ant) Antenna/OmniAntenna ;
##= Max packet in ifq=##
set val(ifqlen) 50 ;
##= Number of mobilnodes=##
set val(nn) 13 ;
##= Routing Protocol=##
set val(rp) DSDV ;
##= topo dim=##
set val(x) 1000;
set val(y) 1000;
#================================================#
#=== ===#
##= =##
set ns [new Simulator]
$ns color 2 Red
$ns color 1 Bleu
##= =##
set tracefd [open sanet.tr w]
$ns trace-all $tracefd
##= =##
set namtrace [open sanet.nam w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
##= =##
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
##= =##
create-god $val(nn)
#================================================#
#=== ===#
set chan_1 [new $val(chan)]
set chan_2 [new $val(chan)]
#= =#
#== ==#
$ns node-config -adhocRouting $val(rp) -llType $val(ll) -macType $val(mac) -ifqType $val(ifq) -ifqLen $val(ifqlen) -antType $val(ant) -propType $val(prop) -phyType $val(netif) -topoInstance $topo -agentTrace ON -routerTrace ON -macTrace ON -movementTrace OFF -channel $chan_1
#== ==#
##= =##
for {set i 0} {$i < 7} {incr i} {
	set ID_($i) $i;
	set node_($i) [$ns node];
	$node_($i) set id $ID_($i);
	$node_($i) random-motion 0;
	$ns initial_node_pos $node_($i) 20;
}
##= =##
Phy/WirelessPhy set CPThresh_ 10.0
Phy/WirelessPhy set CSThresh_ 4.4613e-10    ;#250m
Phy/WirelessPhy set RXThresh_ 4.4613e-10    ;#250m
#Phy/WirelessPhy set bandwidth_ 512kb
#Phy/WirelessPhy set Pt_ 0.2818
#Phy/WirelessPhy set freq_ 2.4e+9
#Phy/WirelessPhy set L_ 1.0
#Antenna/OmniAntenna set X_ 0
#Antenna/OmniAntenna set Y_ 0
#Antenna/OmniAntenna set Z_ 0.25
#Antenna/OmniAntenna set Gt_ 1
#Antenna/OmniAntenna set Gr_ 1
##= =##
for {set i 7} {$i < $val(nn)} {incr i} {
	set ID_($i) $i;
	set node_($i) [$ns node];
	$node_($i) set id $ID_($i);
	$node_($i) random-motion 0;
	$ns initial_node_pos $node_($i) 20;
}
##= =##
$node_(0) set X_ 500.0;
$node_(0) set Y_ 800.0;
$node_(0) set Z_ 0.0;
##= =##
$node_(1) set X_ 650.0;
$node_(1) set Y_ 650.0;
$node_(1) set Z_ 0.0;
##= =##
$node_(2) set X_ 800.0;
$node_(2) set Y_ 500.0;
$node_(2) set Z_ 0.0;
##= =##
$node_(7) set X_ 650.0;
$node_(7) set Y_ 350.0;
$node_(7) set Z_ 0.0;
##= =##
$node_(6) set X_ 500.0;
$node_(6) set Y_ 200.0;
$node_(6) set Z_ 0.0;
##= =##
$node_(5) set X_ 350.0;
$node_(5) set Y_ 350.0;
$node_(5) set Z_ 0.0;
##= =##
$node_(8) set X_ 200.0;
$node_(8) set Y_ 500.0;
$node_(8) set Z_ 0.0;
##= =##
$node_(3) set X_ 350.0;
$node_(3) set Y_ 650.0;
$node_(3) set Z_ 0.0;
##= =##
$node_(4) set X_ 500.0;
$node_(4) set Y_ 500.0;
$node_(4) set Z_ 0.0;
##= =##
$node_(9) set X_ 425.0;
$node_(9) set Y_ 425.0;
$node_(9) set Z_ 0.0;
##= =##
$node_(10) set X_ 575.0;
$node_(10) set Y_ 575.0;
$node_(10) set Z_ 0.0;
##= =##
$node_(11) set X_ 425.0;
$node_(11) set Y_ 575.0;
$node_(11) set Z_ 0.0;
##= =##
$node_(12) set X_ 575.0;
$node_(12) set Y_ 425.0;
$node_(12) set Z_ 0.0;
##= =##
$ns at 0.0 "$node_(0) setdest 500.0 800.0 0.0";
$ns at 0.0 "$node_(1) setdest 650.0 650.0 0.0";
$ns at 0.0 "$node_(2) setdest 800.0 500.0 0.0";
$ns at 0.0 "$node_(7) setdest 650.0 350.0 0.0";
$ns at 0.0 "$node_(6) setdest 500.0 200.0 0.0";
$ns at 0.0 "$node_(5) setdest 350.0 350.0 0.0";
$ns at 0.0 "$node_(8) setdest 200.0 500.0 0.0";
$ns at 0.0 "$node_(3) setdest 350.0 650.0 0.0";
$ns at 0.0 "$node_(4) setdest 500.0 500.0 0.0";
$ns at 0.0 "$node_(9) setdest 425.0 425.0 0.0";
$ns at 0.0 "$node_(10) setdest 575.0 575.0 0.0";
$ns at 0.0 "$node_(11) setdest 425.0 575.0 0.0";
$ns at 0.0 "$node_(12) setdest 575.0 425.0 0.0";
##= =##
$ns at 0.0 "$node_(0) label Sender_a";
$ns at 0.0 "$node_(1)  label Sender_b";
$ns at 0.0 "$node_(2)  label Gateway";
$ns at 0.0 "$node_(3)  label Gateway";
$ns at 0.0 "$node_(4)  label Gateway";
$ns at 0.0 "$node_(5)  label Recevier_a";
$ns at 0.0 "$node_(6)  label Recevier_b";
$ns at 0.0 "$node_(7)  label cell";
$ns at 0.0 "$node_(8)  label cell";
$ns at 0.0 "$node_(9)  label cell";
$ns at 0.0 "$node_(10)  label cell";
$ns at 0.0 "$node_(11)  label cell";
$ns at 0.0 "$node_(12)  label cell";
##= =##
#for {set i 0} {$i < $val(nn) } { incr i } {
#        $ns at [ expr 15+round(rand()*500) ] "$node_($i) setdest [ expr 10+round(rand()*500) ] [ expr 10+round(rand()*500) ] [ expr 2+round(rand()*15) ]"
#    }
#$ns at 200.0 "$node_(3) setdest 450.0 320.0 20.0";
#====================================================#
##
set tcp1 [new Agent/TCP/Newreno];
$tcp1 set class_ 2;
set sink1 [new Agent/TCPSink];
$ns attach-agent $node_(1) $tcp1;
$ns attach-agent $node_(6) $sink1;
$ns connect $tcp1 $sink1;
set ftp1 [new Application/FTP];
$ftp1 attach-agent $tcp1;
$ns at 3.0 "$ftp1 start";
$ns at 590.0 "$ftp1 stop";
##
set tcp2 [new Agent/TCP/Vegas];
$tcp2 set class_ 1;
set sink2 [new Agent/TCPSink];
$ns attach-agent $node_(0) $tcp2;
$ns attach-agent $node_(5) $sink2;
$ns connect $tcp2 $sink2;
set ftp2 [new Application/FTP];
$ftp2 attach-agent $tcp2;
$ns at 3.0 "$ftp2 start";
$ns at 590.0 "$ftp2 stop";
#=====================================================#
##
for {set i 0} {$i < $val(nn)} {incr i} {
	$ns at 600.0 "$node_($i) reset";
}
##
$ns at 600.0 "stop";
$ns at 600.01 "puts \"NS EXITING\" ;$ns halt"
proc stop {} {
	global ns tracefd namtrace
	$ns flush-trace
	close $tracefd
	close $namtrace
}
puts "Starting NS"
$ns run
