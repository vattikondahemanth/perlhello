 #!/usr/bin/perl
 use Cwd qw(realpath);
 use File::Basename;
 use Mason;
 use HTML::Mason;
 use HTML::Mason::Request;
 use Plack::Builder;
 use Template;
 
 use warnings;
 use strict;
   
 # Include Mason plugins here
my @plugins = ('PSGIHandler', 'HTMLFilters');
  
# Create Mason object
my $cwd = dirname( realpath(__FILE__) );
my $interp = Mason->new(
    comp_root => "$cwd/comps",
    data_dir  => "$cwd/data",
    plugins   => \@plugins,
);


unshift(@INC, "$cwd/lib");
 
# PSGI app
my $app = sub {
    my $env = shift;
    $interp->handle_psgi($env);
};
builder {
    enable 'Session';
    $app;
};