.PHONY:all clean show
BASENAME=linux
show: $(BASENAME).pdf 
	evince $< &

all: $(BASENAME).pdf 
linux.pdf : $(BASENAME).tex
	latex $<
	latex $<
	dvips $(basename $<).dvi
	ps2pdf $(basename $<).ps



clean: 
	rm -f $(foreach SUF,dvi aux dvi.pdf log nav out ps pdf snm toc vrb, $(BASENAME).$(SUF) ) *~
