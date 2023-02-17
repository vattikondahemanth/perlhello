package Article;
use DBI;
use Storable;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(new save get_articles);


use HTTP::Request ();
use LWP::UserAgent;
use JSON::Parse qw/parse_json parse_json_safe/;

sub get_commits{
	
	my $url = 'https://api.github.com/repos/vattikondahemanth/perlhello/commits?sha=main';
	my $header = ['Content-Type' => 'application/json; charset=UTF-8'];

	$request = HTTP::Request->new('GET', $url, $header);
	$ua = LWP::UserAgent->new;
	$response = $ua->request($request);
	my $q = parse_json_safe($response->decoded_content);

	my @commit_results;

	foreach my $commit_dict (@$q) {
		$committer = $commit_dict ->  {commit} -> {committer} -> {name};
		$commit_message =  $commit_dict ->  {commit} -> {message};
		$commit_date = $commit_dict ->  {commit} -> {committer} -> {date};
		
		my %temp_dict = (name => {},  message => {}, date => {});
		
		%temp_dict = (name => $committer,  message => $commit_message, date => $commit_date);
		push(@commit_results, \%temp_dict);
		
	}
	return @commit_results;
	
}



#warn("=========Type of \$var is " . ref($response->decoded_content) . "\n");
#@commit_list = $response->decoded_content;

#warn("=========Type of \$q is " . ref(\$q) . "\n");

#warn("=========Count of \$q is " . scalar($q) . "\n");
#foreach my $commit (@commit_list) {
#  warn($commit);
#}


our $dsn = "DBI:mysql:perlmysqldb";
our %attr = ( PrintError=>0,  
             RaiseError=>1);
			 
our $username = "root";
our $password = 'password';



sub new {

   my $class = shift;
   my $self = {
      _title => shift,
      _content  => shift,

   };

   
   bless $self, $class;
   return $self;
}


sub save {
	my ($self) = @_;
	
	
	
	my $dbh  = DBI->connect($dsn,$username,$password, \%attr);
	
	my $stmt = $dbh->prepare("INSERT INTO article (_title, _content) VALUES (?, ?)");
	
	$stmt->bind_param(1, $self -> {_title} );
	$stmt->bind_param(2, $self -> {_content} );
	
	#my %hash = %{$self};
	#$stmt->bind_param(1, $hash{'_title'});
	#$stmt->bind_param(2, $hash{'_content'});
	
	$stmt->execute() or die "Couldn't execute statement: " . $stmt->errstr;
	
	
	$dbh->disconnect();
	
}


sub get_articles {
	warn("============= get_articles is being executed!\n");
	my @result;
	my ($self, $p1, $p2) = @_;
	$p1 = ($p1 - 1) * $p2;

	my $dbh  = DBI->connect($dsn,$username,$password, \%attr);
	my $stmt = $dbh->prepare("SELECT  _title, _content from article order by _title asc limit ? offset ?");
	$stmt->bind_param(1, $p2 ); #10
	$stmt->bind_param(2, $p1 ); #0
	
	$stmt->execute() or die "Couldn't execute statement: " . $stmt->errstr;
	
	while (($title, $content) = $stmt->fetchrow_array) {
		push(@result, Article->new($title,  $content));
	}
	
	
	$dbh->disconnect();
	
	return \@result;
	
}


sub index(){
	
}