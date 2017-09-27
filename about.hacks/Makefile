.PHONY:all clean
TARGET=hacks01
all: ${TARGET}.pdf
	evince $< &

${TARGET}.pdf : ${TARGET}.tex
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<
 
clean:
	rm -f $(foreach P,aux log out pdf idx, ${TARGET}.${P}) *~
