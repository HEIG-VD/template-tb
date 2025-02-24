system("mkdir -p build/figures");

@default_files = ('report.tex');

$pdf_mode = 1;
$pdflatex = 'lualatex -pdf --synctex=1 -file-line-error -interaction=nonstopmode --shell-escape --output-directory=build';
$biber = 'biber';
$bibtex_use = 2;
$out_dir = 'build';
$clean_ext .= ' bbl bcf blg aux log glo gls glg nlo nls acr acn alg pythontex-files-%R/* pythontex-files-%R';

add_cus_dep('acn', 'acr', 0, 'makeacronyms');
sub makeacronyms {
  system("makeglossaries $_[0]");
}

add_cus_dep('nlo', 'nls', 0, 'makenlo2nls');
sub makenlo2nls {
  system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}

$pythontex = 'pythontex %O %S';
$extra_rule_spec{'pythontex'} = [ 'internal', '', 'mypythontex', "%Y%R.pytxcode", "%Ypythontex-files-%R/%R.pytxmcr", "%R", 1 ];

sub mypythontex {
   my $result_dir = $out_dir.'/aux/'."pythontex-files-$$Pbase";
   my $ret = Run_subst( $pythontex, 2 );
   rdb_add_generated( glob "$result_dir/*" );
   open( my $fh, "<", $$Pdest );
   if ($fh) {
      while (<$fh>) {
         if ( /^%PythonTeX dependency:\s+'([^']+)';/ ) {
             print "Found pythontex dependency '$1'\n";
             rdb_ensure_file( $rule, $out_dir.'/aux/'.$1 );
         }
      }
      undef $fh;
   }
   else {
       warn "mypythontex: I could not read '$$Pdest'\n",
            "  to check dependencies\n";
   }
   return $ret;
}
