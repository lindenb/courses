.PHONY:all clean

all: parallel01.pdf
	evince $< &

parallel01.pdf : parallel01.tex jeter01.png
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<
 
jeter01.png:
	curl -o $@ "https://www.gnu.org/software/parallel/logo-gray+black300.png"

clean:
	rm -f $(foreach P,aux log out pdf idx bib, parallel01.${P}) *~
