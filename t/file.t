BEGIN { $| = 1; print "1..33\n"; }
END {print "not ok 1\n" unless $loaded;}

use Digest::DMAC qw(dmac hexdigest base64digest);

$loaded = 1;
print "ok 1\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "DES", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "a4586ab48ac37eaa" ? "" : "not ", "ok 2\n";
print $base64mac1 eq "pFhqtIrDfqo=" ? "" : "not ", "ok 3\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "TEA", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "579c7f90a83e98c3" ? "" : "not ", "ok 4\n";
print $base64mac1 eq "V5x/kKg+mMM=" ? "" : "not ", "ok 5\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Rijndael", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "bfd3c170aecc526f71fa6a016a9e3aea" ? "" : "not ", "ok 6\n";
print $base64mac1 eq "v9PBcK7MUm9x+moBap466g==" ? "" : "not ", "ok 7\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Twofish2", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "37687795f019fd1040fa2eb6f3b8af17" ? "" : "not ", "ok 8\n";
print $base64mac1 eq "N2h3lfAZ/RBA+i6287ivFw==" ? "" : "not ", "ok 9\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "IDEA", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "d1bc48018761e0d0" ? "" : "not ", "ok 10\n";
print $base64mac1 eq "0bxIAYdh4NA=" ? "" : "not ", "ok 11\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "RC6", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "b4ad070e1f11745f927de0257ca859f7" ? "" : "not ", "ok 12\n";
print $base64mac1 eq "tK0HDh8RdF+SfeAlfKhZ9w==" ? "" : "not ", "ok 13\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Serpent", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "0ad27c46b680b8d83fbbe4137e63a687" ? "" : "not ", "ok 14\n";
print $base64mac1 eq "CtJ8RraAuNg/u+QTfmOmhw==" ? "" : "not ", "ok 15\n";

local $/ = undef;
$data = "DMAC.pm";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Blowfish", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "43c93e21e8b7e9d5" ? "" : "not ", "ok 16\n";
print $base64mac1 eq "Q8k+Iei36dU=" ? "" : "not ", "ok 17\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "DES", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "f9c9dfc4185a85b5" ? "" : "not ", "ok 18\n";
print $base64mac1 eq "+cnfxBhahbU=" ? "" : "not ", "ok 19\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "TEA", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "8ee3d75d1a64c9f8" ? "" : "not ", "ok 20\n";
print $base64mac1 eq "juPXXRpkyfg=" ? "" : "not ", "ok 21\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Rijndael", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "4e740fc1efca3de893aadaa24acc5145" ? "" : "not ", "ok 22\n";
print $base64mac1 eq "TnQPwe/KPeiTqtqiSsxRRQ==" ? "" : "not ", "ok 23\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Twofish2", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "df2a10b4a6382805284d4e4d414ddcc8" ? "" : "not ", "ok 24\n";
print $base64mac1 eq "3yoQtKY4KAUoTU5NQU3cyA==" ? "" : "not ", "ok 25\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "IDEA", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "54a16f5a1620ca2c" ? "" : "not ", "ok 26\n";
print $base64mac1 eq "VKFvWhYgyiw=" ? "" : "not ", "ok 27\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "RC6", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "9f1879198358da40175b415558d7e071" ? "" : "not ", "ok 28\n";
print $base64mac1 eq "nxh5GYNY2kAXW0FVWNfgcQ==" ? "" : "not ", "ok 29\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Serpent", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "a60132a5ca8b0bec5f5f4418f158ad5a" ? "" : "not ", "ok 30\n";
print $base64mac1 eq "pgEypcqLC+xfX0QY8VitWg==" ? "" : "not ", "ok 31\n";

local $/ = undef;
$data = "Makefile.PL";
open F, $data;
while (<F>) {
    $mac1 = &dmac("jcd", "Blowfish", $_);
    $hexmac1 = hexdigest($mac1);
    $base64mac1 = base64digest($mac1);
}

close F;

print $hexmac1 eq "8578d185005827ca" ? "" : "not ", "ok 32\n";
print $base64mac1 eq "hXjRhQBYJ8o=" ? "" : "not ", "ok 33\n";

