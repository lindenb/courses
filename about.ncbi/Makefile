.PHONY:all clean show
SHELL=/bin/bash
BASENAME=ncbi01
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

$(BASENAME).pdf : $(BASENAME).tex jeter01svg.png jeterpubmed.png
	pdflatex --enable-write18 -interaction=errorstopmode -halt-on-error $<

jeter01.svg:
	xsltproc <(curl -s "https://raw.github.com/lindenb/xslt-sandbox/master/stylesheets/bio/ncbi/gb2svg.xsl")  "http://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=14971102&retmode=xml&rettype=gbc" | xmllint --format - > $@
	
jeter01svg.png:jeter01.svg
	 inkscape -z --export-png=$@ $<

jeterpubmed.png: pubmed2rstats.xsl jeter.pubmed.xml
	xsltproc $^  | R --no-save

jeter.pubmed.xml:
	 curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&retmode=xml&id=23858435,22378742,22111918,22022500,21416625,21347420,21270037,21253683,21233145,21157923,20976177,20943689,20847260,19805035,19789646,19711481,19711459,19711448,19603827,19407199,19225569,18951476,18719266,18436782,18195356,18174420,17654673,17431180,17431179,17363001,17223615,17148248,16840697,16822743,16555983,16351976,16350345,16284159,15986487,15933198,15790853,15790815,15352202,15347508,15306807,15306316,15101419,12748649,12713747,12125061,11875567,11387472,11221507,10538820,9177210,17808183,17750663,4521659"

clean: 
	rm -f $(foreach SUF,dvi aux dvi.pdf log nav out ps pdf snm toc vrb, $(BASENAME).$(SUF) ) *~ $(TOREMOVE)
