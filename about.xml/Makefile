.PHONY:all clean
GREPV= egrep -v -E '^make'
slides2fo=${HOME}/src/xslt-sandbox/stylesheets/fo/slideshow2fo.xsl


define MAKE2
	$(MAKE) -f $(1) | ${GREPV} > $(addsuffix .out,$(1))
	cat $(1) | sed 's/	/    /g' > $(addsuffix .tmp,$(1))
endef


all:validate xml.pdf  preparexinclude

show: xml.pdf
	evince $< &

xml.pdf: preparexinclude validate slides.xml  ${slides2fo}
	fop -xml slides.xml  -xsl ${slides2fo} -pdf $@
	
validate: slides.xml
	xmllint --noout $<

show.fo: slides.xml
	xsltproc --xinclude ${slides2fo} $<

preparexinclude:togo1.txt.tmp togo1.xml.tmp togo1.json.tmp \
	 tmp1.png tmp2.png tmp3.gif tmp4.png tmp5.png tmp6.png

togo1.txt.tmp:
	curl -o $@ "http://togows.dbcls.jp/entry/pubmed/16381885"
togo1.xml.tmp:
	curl -o $@ "http://togows.dbcls.jp/entry/pubmed/16381885.xml"
togo1.json.tmp:
	curl "https://raw.github.com/Klortho/Eutils-JSON/master/samples/efetch.pubmed.json" | tr "\n" " "| tr -s " \t" | fold -w 50 > $@

tmp1.png:
	curl -o $@ "http://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/DOM-model.svg/428px-DOM-model.svg.png"

tmp2.png:
	curl -o $@ "http://upload.wikimedia.org/wikipedia/commons/2/2c/Languages_xml.png"

tmp3.gif:
	curl -o $@ "http://www.december.com/html/images/svg.gif"

tmp4.png:
	curl -o $@ "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/XSLT_en.svg/220px-XSLT_en.svg.png"

tmp5.png: tmp5.svg
	inkscape -z -b white -y 1 -f $< -e $@
tmp5.svg:
	 xsltproc genes2svg.xsl genes1.xml > $@

tmp6.png:
	curl -o $@ "http://www.w3c.it/talks/2009/athena/images/SimpleExample.png"

clean.tmp:
	
	
clean: clean.tmp
	rm -f *.out *.tmp makefile.pdf

