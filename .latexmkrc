system ("mkdir -p build/figures");

@default_files = ('report.tex');
@cus_dep_list = (@cus_dep_list, "glo gls 0 makenomenclature");
sub makenomenclature {
   system("makeindex $_[0].glo -s nomencl.ist -o $_[0].gls"); }
@generated_exts = (@generated_exts, 'glo');

# Custom dependency and function for nomencl package
  add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
  sub makenlo2nls {
  system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}

$out_dir = 'build';
$pdflatex = 'xelatex --synctex=1 -interaction=nonstopmode -shell-escape';
$latex = 'latex --synctex=1 -interaction=nonstopmode -shell-escape';