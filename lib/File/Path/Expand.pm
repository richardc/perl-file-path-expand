use strict;
package File::Path::Expand;
our $VERSION = 1.0;
use User::pwent;
use Exporter;
use base 'Exporter';
use Carp qw(croak);
our @EXPORT = qw( expand_filename );

sub expand_filename {
    my $path = shift;
    $path =~ s{^~/}{ $ENV{HOME} ? "$ENV{HOME}/" : _home_of( $> )."/" }e;
    $path =~ s{^~(.*?)/}{ _home_of( $1 )."/" }e;
    return $path;
}

sub _home_of {
    my $user = shift;
    local $Carp::carplevel += 2;
    my $ent = getpw($user)
      or croak "no such user '$user'";
    return $ent->dir;
}

1;
__END__

=head1 NAME

File::Path::Expand - expand filenames

=head1 SYNOPSIS

 use File::Path::Expand;
 print expand_filename("~richardc/foo"); # prints "/home/richardc/foo"

=head1 DESCRIPTION

File::Expand expands user directories in filenames.  For the simple
case it's no more complex than s{^~/}{$HOME/}, but for other cases it
consults C<getpwent> and does the right thing.

=head1 AUTHOR

Richard Clamp <richardc@unixbeard.net>

=head1 COPYRIGHT

=head1 SEE ALSO

=cut
