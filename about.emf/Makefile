.PHONY=all clean

all: emf01.pdf
	evince $< &

emf01.pdf: emf01.tex jeter01.tex
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<

jeter01.tex: ../../xslt-sandbox/stylesheets/emf/ecore2tex.xsl model/laboratory.ecore
	xsltproc $^ > $@

clean:
	
