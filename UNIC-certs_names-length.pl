#!/usr/bin/perl

# Functionality: print the names of grads in descending order
# wrt the length (in terms of num of characters) of their full name
# This is used to ensure if the lenghty names fit into the pdf field of the template
# First used for MOOC 9


$inf = "mooc9grads.csv";

$c = 0;
%name2len = ();


open (I,$inf) || die ("Can not open $inf\n");
$r = <I>;
$r = <I>;
while ($r ne "")
 {
  $c++;
  chomp($r);
  
  @f = ();
  @f = split(/,/,$r);
  $n = $f[0];
  
  $num_letters = 0;
  @let = ();
  @let = split(//,$n);
  $num_letters = $#let + 1;
  $name2len{$n} = $num_letters;
  #print ("-->", $n, "<--",  $num_letters,"\n");
  $r = <I>;
 }

print ("Num of entries: ", $c, "\n");

#foreach (sort { $a <=> $b } keys(%name2len) )
foreach (sort {$name2len{$b} <=> $name2len{$a}} keys %name2len)
 {
    print ($_, ": ", $name2len{$_}, "\n");
 }
