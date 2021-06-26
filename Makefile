BUILDDIR=build
LATEXMK=latexmk
INKSCAPE=inkscape

all: report.tex
	$(LATEXMK) -pdf -jobname=$(BUILD)/report.pdf $<

%.pdf: %.svg
	inkscape --file=$< --export-area-drawing --without-gui --export-pdf=$@

%.pdf: %.pdf.py
	python3 $< > $@

%.pdf: %.drawio.xml
	drawio -x -fpdf -t --crop $< -o $@

$(BUILDDIR):
	mkdir -p $@

clean:
	$(LATEXMK) -C