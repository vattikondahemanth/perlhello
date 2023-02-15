use Foo;
use Article;

my $object = new Article( "TestTitle", "TestContent");
print("\n");

#print $object -> {_title};
#print("\n");


$object -> save();
print("\n");

