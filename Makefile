BUILDDIR=build
LATEXMK=latexmk
INKSCAPE=inkscape
FIGDIR=assets/figures
OUT=report

SVGS=$(wildcard $(FIGDIR)/*.svg)
DIOS=$(wildcard $(FIGDIR)/*.xml)
PDFS=$(wildcard $(FIGDIR)/*.pdf)
PYFS=$(wildcard $(FIGDIR)/*.py)
FIGS_SVG=$(patsubst %.svg, $(BUILDDIR)/%.svg.pdf, $(SVGS))
FIGS_XML=$(patsubst %.xml, $(BUILDDIR)/%.xml.pdf, $(DIOS))
FIGS_PDF=$(patsubst %.pdf, $(BUILDDIR)/%.pdf, $(PDFS))
FIGS_PY=$(patsubst %.py, $(BUILDDIR)/%.py.pdf, $(PYFS))

FIGS=$(FIGS_SVG) $(FIGS_XML) $(FIGS_PDF) $(FIGS_PY)

all: $(OUT).tex $(FIGS) | $(BUILDDIR)
	$(LATEXMK) -quiet -pdf

figures: $(FIGS)

$(FIGS_SVG): $(BUILDDIR)/%.svg.pdf: %.svg | dirs
	inkscape --file=$< --export-area-drawing --without-gui --export-pdf=$@

$(FIGS_PY): $(BUILDDIR)/%.py.pdf: %.py | dirs
	python3 $< > $@

$(FIGS_XML): $(BUILDDIR)/%.xml.pdf: %.xml | dirs
	xvfb-run -a drawio -x -fpdf -t --crop $< -o $@ --no-sandbox

$(FIGS_PDF): $(BUILDDIR)/%.pdf: %.pdf | dirs
	cp $< $@

dirs: $(BUILDDIR)

$(BUILDDIR): $(BUILDDIR)/$(FIGDIR)

$(BUILDDIR)/$(FIGDIR):
	mkdir -p $@

clean:
	$(RM) $(BUILDDIR)/$(OUT).*
	$(LATEXMK) -C

mrproper:
	$(RM) -rf $(BUILDDIR)

.PHONY: all figures dirs clean mrproper