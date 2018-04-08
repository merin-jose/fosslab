#!/usr/bin/perl

#text display is done using  print command

#hash is used for commenting

clear;
print "hello world \n";
$a=10;
$b='number is $a \n';
$c="number is $a \n";

#perl scripts mainly have 2 datatypes strings and integers

print "a = $a \n";
print " $b \n";
print $c; 

#Perl automatically converts a string to an integer or the other way around,depending on the context

$a=10;
#performs addition 
$b=$a+20;
#concatenates two strings
$c=$a."is a number \n";

print "b= $b \n";
print "$c \n";

#arithematic operations +,-,*,/,**(exponent)
$add=5+6;
$sub=5-6;
$mult=5*6;
$div=6/2;
$exp=2**3;

print "results of arithematic operations are : $add $sub $mult $div $exp \n";

#Standard comparisons for integers: <, >, <=, >= , ==, !=
#String comparison: eq, ne, lt, le, gt, ge (alphabetical order)

$i="one";
if($i eq "one")
 {print "comparison sucesss \n";}  #string comparison

#implementation of conditionals
$j="two";
if($i ge $j)
{print "$i is greater \n";}
else
{print "$j is greater \n";}

#implementation of loops

for $i(2,4,6)
{print "$i \n";}

$i=1;
while($i<3)
{
print "$i \n";
$i+=1;
}

for($i=1;$i<3;$i++)
{print "$i \n";}


#implementing arrays
@array = (1,2,3,4);
print "full array : @array \n";
print "individual elements are : $array[0] $array[1] $array[2] $array[3] \n";
 
#to add an elemnt to end of array
push(@array,5);

#to add an elemnt to begining of array
unshift(@array,0);
print "\@array= @array \n";

#to delete an element at beging of array
pop(@array);

#to delete an elemnt at end of array
shift(@array);

print "\@array = @array \n";

#hashes in perl
%hash=('a',0,'b',1);
print "key values for hash are: $hash{a} $hash{b} \n";

$string = "aaaa
bbb
ccc";
print "perl can have multiline strings: $string \n";
