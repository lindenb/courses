.PHONY=all clean
.SHELL=/bin/bash
all: emf01.pdf
	evince $< &

emf01.pdf: emf01.tex jeter01.tex  model/lims.genmodel
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<

jeter01.tex: ../../xslt-sandbox/stylesheets/emf/ecore2tex.xsl model/lims.ecore
	xsltproc $^ > $@

clean:
	rm -f jeter01.pdf jeter01.tex
