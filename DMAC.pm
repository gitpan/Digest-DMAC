package Digest::DMAC;

use diagnostics;
use strict;
use warnings;
use Carp;
use Crypt::CBC;
use MIME::Base64;
use Exporter;
use vars qw($VERSION @EXPORT_OK @ISA);
$VERSION = '1.1';
@ISA = ('Exporter');
@EXPORT_OK = qw(dmac hexdigest base64digest);

sub createcipher
{
    my ($key, $iv, $cipher) = @_;
    my $cipher_obj = Crypt::CBC->new({'key' => $key,
                                      'cipher' => $cipher,
                                      'iv' => $iv,
                                      'regenerate_key' => 1,
                                      'padding' => 'standard',
                                      'prepend_iv' => 0});
    return $cipher_obj;
}

sub createsubkey
{
    my ($key, $iv, $cipher, $data) = @_;
    my $tempcipher = &createcipher($key, $iv, $cipher);
    return $tempcipher->encrypt($data);
}

sub dmac
{
    my ($key, $cipher, $inputdata) = @_;

    my $DATASIZE = length $inputdata;
    my $data = pack "a$DATASIZE", $inputdata;

    $cipher = $cipher=~/^Crypt::/ ? $cipher : "Crypt::$cipher";
    eval "require $cipher";
    croak "Couldn't load $cipher: $@" if ($@);

    $cipher =~ s/^Crypt::// unless $cipher->can('blocksize');

    my $BLOCKSIZE = eval {$cipher->blocksize};
    my $iv = pack "x$BLOCKSIZE", 0;

    my $subkey1 = &createsubkey($key, $iv, $cipher, 0);
    my $subkey2 = &createsubkey($key, $iv, $cipher, 1);

    my $cipher1 = &createcipher($subkey1, $iv, $cipher);
    my $ciphertext = $cipher1->encrypt($data);
    my $mac1 = substr $ciphertext, -$BLOCKSIZE;

    my $cipher2 = &createcipher($subkey2, $iv, $cipher);
    my $mac2 = $cipher2->encrypt($mac1);

    my $final_mac = substr $mac2, -$BLOCKSIZE;
    return $final_mac;
}

sub hexdigest
{
    my ($data) = @_;
    return unpack("H*", $data);
}

sub base64digest
{
    my ($data) = @_;
    return encode_base64($data, "");
}

1;

__END__

=head1 NAME

Digest::DMAC 1.0

=head1 EXAMPLE 1

use Crypt::CBC;

use Digest::DMAC qw(dmac hexdigest base64digest);

my $key = "jcd";

my $cipher = "Serpent";

my $data = "This is a test";

my $mac = &dmac($key, $cipher, $data);

print hexdigest($mac), "\n";

print base64digest($mac), "\n";

=head1 EXAMPLE 2

use Crypt::CBC;

use Digest::DMAC qw(dmac hexdigest base64digest);

local $/ = undef;    # slurp whole file

$infile = "../DMAC.pm";

open F, $infile;

while (<F>) {

    $mac1 = &dmac($key, $cipher, $_);
}

print hexdigest($mac1), "\n";

print base64digest($mac1), "\n";

=head1 DESCRIPTION

This is B<Double MAC> (B<DMAC>), also known as B<Encrypted MAC>
(B<EMAC>). Unlike B<HMAC>, which reuses an existing one-way hash
function, such as B<MD5>, B<SHA-1> or B<RIPEMD-160>, DMAC reuses an
existing block cipher to produce a secure B<message authentication
code> (B<MAC>).

Using the block cipher, a message is encrypted in B<CBC mode>. The last
block is taken as the MAC of the message. For fixed-length messages,
this method is provably secure. In reality, however, messages have
arbitrary lengths, and this method is not secure. To make secure MACs
for variable length messages, the last block is encrypted once again
with a different key. The security of this construction has been proved
in the paper, ``CBC MAC for Real-Time Data Sources'' by Erez Petrank
and Charles Rackoff. The security can be proved on the assumption that
the underlying block cipher is pseudo-random.

The performance and key-agility of DMAC are reasonable. DMAC is
preferable for short messages because the block length is smaller
compared to the schemes based on a hash function. DMAC is also chosen
as one of the NESSIE winners for Message Authentication Codes, along
with B<UMAC>, B<TTMAC> and B<HMAC>. The current NESSIE specification
chooses the B<AES> as block cipher.

Also specified in the paper by Petrank and Rackoff is the construction
of two encryption keys from a single key. The first subkey is derived
by encrypting "0" (zero) using the original secret key. To produce the
second subkey, a "1" (one) is encrypted using the original secret key.
The first subkey is used in CBC mode to encrypt the entire message. The
last ciphertext block is then re-encrypted with the second subkey. The
result is a MAC whose length is equal to the block length of the cipher
used.

=head1 PREREQUISITES

The module B<Crypt::CBC> is required, plus any block cipher that is
capable of returning its block size when queried. B<RC5> is not
supported, however, because its block size is variable.

B<MIME::Base64> is required if a base64 encoding of output is desired.

=head1 AUTHOR

Julius C. Duque <jcduque (AT) lycos (DOT) com>

=cut
