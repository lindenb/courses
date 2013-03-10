.PHONY:all clean
all: linux.pdf
linux.pdf : linux.tex
	latex $<
	latex $<
	dvips $(basename $<).dvi
	ps2pdf $(basename $<).ps

clean: 
	rm -f $(foreach SUF,dvi aux dvi.pdf log nav out ps pdf snm toc, linux.$(SUF) )
