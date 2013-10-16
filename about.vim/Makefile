.PHONY:all clean
BASENAME=vim01
all: ${BASENAME}.pdf
	evince $< &

${BASENAME}.pdf : ${BASENAME}.tex vim128.png
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<
 
vim128.png:
	curl -o $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/128px-Vimlogo.svg.png"

clean:
	rm -f $(foreach P,aux log out pdf idx bib, ${BASENAME}.${P})  vim128.png *~
