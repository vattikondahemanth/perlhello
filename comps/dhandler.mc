<%args>

</%args>

<%init>

warn("============dhandler is being executed!\n");
my $my_request = $m->req;

warn($my_request);
# use Data::Dumper;
# warn(Dumper($my_request));

my $path = $my_request->{'env'}->{'REQUEST_URI'};

warn($path);



my ($component) = $path =~ m{^/(\w+)}; # Extract the first word after the /
$component ||= "index"; # Default to "index" if no component is specified




if ($path =~ m{^/dhandler}) {
	$m->redirect('index');
}
elsif ($path =~ m{^/create}) {
    $m->comp('new_article.mc');
}
elsif ($path =~ m{^/cancel}) {
    $m->redirect('/');
}
elsif ($path =~ m{^/add}) {
    $m->comp('new_article.mc');
}

elsif ($path =~ m{^/bar}) {
    $m->comp('bar.mc');
}
else {
    $m->comp('404.mc');
}


</%init>
