use ExtUtils::MakeMaker;

WriteMakefile (
    'NAME' => 'Digest::DMAC',
    'VERSION_FROM' => 'DMAC.pm',
    'PREREQ_PM' => {'Crypt::CBC' => '2.08'},
    'LIBS' => [''],
    'DEFINE' => '',
    'INC' => '',
    'dist' => {'COMPRESS' => 'bzip2 -9', 'SUFFIX' => 'bz2'}
)

