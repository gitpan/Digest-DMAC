BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}

use Digest::DMAC qw(dmac hexdigest base64digest);

$loaded = 1;
print "ok 1\n";

$mac1 = &dmac("jcd", "DES", "This is a test");
$hexmac1 = hexdigest($mac1);
$base64mac1 = base64digest($mac1);

print $hexmac1 eq "1e6e422eefe2ae5e" ? "" : "not ", "ok 2\n";
print $base64mac1 eq "Hm5CLu/irl4=" ? "" : "not ", "ok 3\n";

$mac1 = &dmac("jcd", "TEA", "This is a test");
$hexmac1 = hexdigest($mac1);
$base64mac1 = base64digest($mac1);

print $hexmac1 eq "82e200d017577e92" ? "" : "not ", "ok 4\n";
print $base64mac1 eq "guIA0BdXfpI=" ? "" : "not ", "ok 5\n";

