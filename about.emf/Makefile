.PHONY=all clean

all: emf01.pdf
	evince $< &

emf01.pdf: emf01.tex
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<

	

clean:
	
