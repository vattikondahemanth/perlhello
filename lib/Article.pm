package Article;
use DBI;
use Storable;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(new save);

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
	
	my $dsn = "DBI:mysql:perlmysqldb";
	my %attr = ( PrintError=>0,  
             RaiseError=>1);
			 
	my $username = "root";
	my $password = 'password';
	
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