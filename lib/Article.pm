package Article;
use DBI;
use Storable;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(new save get_articles);



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