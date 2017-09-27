.PHONY:all clean
BASENAME=ruby01
all: ${BASENAME}.pdf
	evince $< &

${BASENAME}.pdf : ${BASENAME}.tex ruby64.png
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<
 
ruby64.png:
	curl -o $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Ruby_logo.png/64px-Ruby_logo.png"

clean:
	rm -f $(foreach P,aux log out pdf idx bib, ${BASENAME}.${P})  ruby64.png *~
