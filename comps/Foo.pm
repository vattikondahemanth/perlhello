package Foo;

use Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(bar blat);


sub bar { 
   print "Hello $_[0]\n" 
}

sub blat { 
   print "World $_[0]\n" 
}

