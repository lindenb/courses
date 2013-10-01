.PHONY:all clean

all: parallel01.pdf
	evince $< &

parallel01.pdf : parallel01.tex
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<
 




clean:
	rm -f $(foreach P,aux log out pdf idx, parallel01.${P}) *~
