.PHONY:all clean show
BASENAME=gene2bio2013
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

$(BASENAME).pdf : $(BASENAME).tex jeter_tmp1.pdf
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<

jeter_tmp1.gif:
	curl -o $@ "http://2.bp.blogspot.com/-IZCOhEYv5Lw/Tb9Zf8DOn1I/AAAAAAAADAo/ySX52LZ5OAQ/s1600/stuff.gif"

clean: 
	rm -f $(foreach SUF,dvi aux dvi.pdf log nav out ps pdf snm toc vrb, $(BASENAME).$(SUF) ) *~ $(TOREMOVE)
