use strict;
package File::Expand;
our $VERSION = 1.0;


1;
__END__

=head1 NAME

File::Expand - expand filenames

=head1 SYNOPSIS

 use File::Expand;
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
