.PHONY:all clean show
BASENAME=bioinfo2013
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

$(BASENAME).pdf : $(BASENAME).tex 
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<

clean: 
	rm -f $(foreach SUF,dvi aux dvi.pdf log nav out ps pdf snm toc vrb, $(BASENAME).$(SUF) ) *~ $(TOREMOVE)
