use ExtUtils::MakeMaker;

WriteMakefile (
    'NAME' => 'Digest::DMAC',
    'VERSION_FROM' => 'DMAC.pm',
    'PREREQ_PM' => {'Crypt::CBC' => '2.08'},
    'LIBS' => [''],
    'DEFINE' => '',
    'INC' => '',
    'dist' => {'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz',
               'ZIP' => '/usr/bin/zip', 'ZIPFLAGS' => '-rl'}
)

