 #!/usr/bin/perl
 use Cwd qw(realpath);
 use File::Basename;
 use Mason;
 use HTML::Mason;
 use HTML::Mason::Request;
 use Plack::Builder;
 use Plack::App::File;
 use Template;
 use Path::Router;
 use Mason::Plugin::RouterSimple;
 
 use warnings;
 use strict;
   
 # Include Mason plugins here
my @plugins = ('PSGIHandler', 'HTMLFilters', 'RouterSimple');
  
# Create Mason object
my $cwd = dirname( realpath(__FILE__) );
my $interp = Mason->new(
    comp_root => "$cwd/comps",
    data_dir  => "$cwd/data",
    plugins   => \@plugins,
);


unshift(@INC, "$cwd/lib");


my $app = sub {
    my $env = shift;
    $interp->handle_psgi($env);
};

builder {
    enable 'Session';
	mount "/images" => Plack::App::File->new( root => "$cwd/static/images" );
	mount "/" => $app;
};