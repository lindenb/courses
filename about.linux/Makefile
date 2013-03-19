.PHONY:all clean show
BASENAME=linux
TOREMOVE=

%.pnm:%.jpg
	jpegtopnm $< > $@
%.ps:%.pnm
	pnmtops $< > $@
%.epsi:%.ps
	ps2epsi $<
%.ps:%.svg
	inkscape --without-gui --export-ps=$@ $<


show: $(BASENAME).pdf 
	evince $< &

all: $(BASENAME).pdf  
linux.pdf : $(BASENAME).tex linux01.ps linux02.ps linux03.ps
	latex $<
	latex $<
	dvips $(basename $<).dvi
	ps2pdf $(basename $<).ps

linux01.png: linux01.svg Microsoft_Excel_2013_icon.png
	inkscape --without-gui --export-latex --export-png=$@ $< 

TOREMOVE+=Microsoft_Excel_2013_icon.png
Microsoft_Excel_2013_icon.png:
	curl -s -o $@ "http://upload.wikimedia.org/wikipedia/en/c/cb/Microsoft_Excel_2013_icon.png"

TOREMOVE+=Alphanumeric_keyboard.jpg
Alphanumeric_keyboard.jpg:
	curl -s -o $@ "http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Alphanumeric_keyboard.jpg/478px-Alphanumeric_keyboard.jpg"

TOREMOVE+=LG_L194WT-SF_LCD_monitor.jpg
LG_L194WT-SF_LCD_monitor.jpg:
	curl -s -o $@ "http://upload.wikimedia.org/wikipedia/commons/7/7e/LG_L194WT-SF_LCD_monitor.jpg"
	


clean: 
	rm -f $(foreach SUF,dvi aux dvi.pdf log nav out ps pdf snm toc vrb, $(BASENAME).$(SUF) ) *~ $(TOREMOVE)
