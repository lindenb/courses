.PHONY:all clean show
BASENAME=workflow01
%.pdf:%.ps
	ps2pdf $<
%.pnm:%.jpg
	jpegtopnm $< > $@
%.ps:%.pnm
	pnmtops $< > $@
%.epsi:%.ps
	ps2epsi $<
%.ps:%.svg
	inkscape --without-gui --export-ps=$@ $<
%.pnm:%.gif
	giftopnm $< > $@

show: $(BASENAME).pdf 
	evince $< &

all: $(BASENAME).pdf 

$(BASENAME).pdf : $(BASENAME).tex jeter_stuff.png
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $< 

jeter_stuff.png:
	curl -o jeter_stuff.gif "http://2.bp.blogspot.com/-IZCOhEYv5Lw/Tb9Zf8DOn1I/AAAAAAAADAo/ySX52LZ5OAQ/s1600/stuff.gif"
	convert jeter_stuff.gif jeter_stuff.png
	rm jeter_stuff.gif

clean: 
	rm -f *.dvi *.aux *.dvi.pdf *.log *.nav *.out *.ps *.pdf *.snm *.toc *.vrb *~ $(TOREMOVE) \
		samflags*.svg samflags*.png
