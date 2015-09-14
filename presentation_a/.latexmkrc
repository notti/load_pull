our %externalflag = ();

$pdflatex = 'internal mypdflatex %O %S %B';

sub mypdflatex {
    our %externalflag;
    my $n = scalar(@_);
    my @args = @_[0 .. $n - 2];
    my $base = $_[$n - 1];

    system 'lualatex', @args;
    if ($? != 0) {
        return $?
    }
    if ( !defined $externalflag->{$base} && -e "$base.makefile" ) {
        $externalflag->{$base} = 1;
        system ("$make -j5 -f $base.makefile");
    }
    return $?;
}

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    if ( $silent ) {
        system "makeglossaries -q '$_[0]'";
    }
    else {
        system "makeglossaries '$_[0]'";
    };
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'makefile', 'figlist', 'auxlock';
$clean_ext .= ' %R.ist %R.xdy';
