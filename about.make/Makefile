.PHONY:all clean
GREPV= egrep -v -E '^make'
slides2fo=${HOME}/src/xslt-sandbox/stylesheets/fo/slideshow2fo.xsl


define MAKE2
	$(MAKE) -f $(1) | ${GREPV} > $(addsuffix .out,$(1))
	cat $(1) | sed 's/	/    /g' > $(addsuffix .tmp,$(1))
endef


all:validate makefile.pdf  preparexinclude

show: makefile.pdf
	evince $< &

makefile.pdf: preparexinclude validate slides.xml  ${slides2fo}
	fop -xml slides.xml  -xsl ${slides2fo} -pdf $@
	
validate: slides.xml
	xmllint --noout $<

show.fo: slides.xml
	xsltproc --xinclude ${slides2fo} $<

preparexinclude:
	$(MAKE) clean.tmp
	$(call MAKE2,make01.mk)
	rm file2.rna
	$(MAKE) -f make01.mk  | ${GREPV} > make01.mk.2.out
	touch file1.dna file3.pep
	$(MAKE) -f make01.mk  | ${GREPV} > make01.mk.3.out
	$(MAKE) clean.tmp
	$(call MAKE2,make02.mk)
	$(MAKE) clean.tmp
	$(call MAKE2,make03.mk)
	
clean.tmp:
	rm -f *.pep *.dna *.protein 
	
clean: clean.tmp
	rm -f *.out *.tmp makefile.pdf
