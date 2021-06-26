BUILDDIR=build
LATEXMK=latexmk
INKSCAPE=inkscape
FIGDIR=assets/figures

SVGS=$(wildcard $(FIGDIR)/*.svg)
DIOS=$(wildcard $(FIGDIR)/*.xml)
PDFS=$(wildcard $(FIGDIR)/*.pdf)
PYFS=$(wildcard $(FIGDIR)/*.py)
FIGS_SVG=$(patsubst $(FIGDIR)/%.svg, $(BUILDDIR)/figures/%.svg.pdf, $(SVGS))
FIGS_XML=$(patsubst $(FIGDIR)/%.xml, $(BUILDDIR)/figures/%.xml.pdf, $(DIOS))
FIGS_PDF=$(patsubst $(FIGDIR)/*.pdf, $(BUILDDIR)/figures/%.pdf, $(PDFS))
FIGS_PY=$(patsubst $(FIGDIR)/*.py, $(BUILDDIR)/figures/%.py.pdf, $(PDFS))

FIGS=$(FIGS_SVG) $(FIGS_XML) $(FIGS_PDF) $(FIGS_PY)

all: report.tex $(FIGS) | $(BUILDDIR)
	$(LATEXMK) -pdf -jobname=$(BUILDDIR)/report $<

figures: $(FIGS)

$(FIGS_SVG): $(BUILDDIR)/figures/%.svg.pdf: $(FIGDIR)/%.svg | $(BUILDDIR)/figures
	inkscape --file=$< --export-area-drawing --without-gui --export-pdf=$@

$(FIGS_PY): $(BUILDDIR)/figures/%.py.pdf: $(FIGDIR)/%.py | $(BUILDDIR)/figures
	python3 $< > $@

$(FIGS_XML): $(BUILDDIR)/figures/%.xml.pdf: $(FIGDIR)/%.xml | $(BUILDDIR)/figures
	drawio -x -fpdf -t --crop $< -o $@

$(FIGS_PDF): $(BUILDDIR)/figures/%.pdf: $(FIGDIR)/%.pdf | $(BUILDDIR)/figures
	cp $< $@

$(BUILDDIR):
	mkdir -p $@

$(BUILDDIR)/figures:
	mkdir -p $@

clean:
	$(LATEXMK) -C

mrproper:
	$(RM) -rf $(BUILDDIR)