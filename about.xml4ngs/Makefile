.PHONY:all clean
GREPV= egrep -v -E '^make'
slides2fo=${HOME}/src/xslt-sandbox/stylesheets/fo/slideshow2fo.xsl


define MAKE2
	$(MAKE) -f $(1) | ${GREPV} > $(addsuffix .out,$(1))
	cat $(1) | sed 's/	/    /g' > $(addsuffix .tmp,$(1))
endef


all:validate xml4ngs.pdf  preparexinclude

show: xml4ngs.pdf
	evince $< &

xml4ngs.pdf : preparexinclude validate slides.xml  ${slides2fo}
	fop -xml slides.xml  -xsl ${slides2fo} -pdf $@
	
validate: slides.xml
	xmllint --noout $<

show.fo: slides.xml
	xsltproc --xinclude ${slides2fo} $<

preparexinclude : tmp1.jpg tmp2.jpg tmp3.jpg tmp4.jpg tmp.mk

tmp.mk: tmp.xsl project.xml 
	xsltproc $^ > $@

tmp.xsl: 
	curl -o $@ "https://raw.github.com/lindenb/xml4ngs/master/stylesheets/project2make.xsl"

tmp1.jpg:
	curl -o $@ "https://pbs.twimg.com/media/A9v2MKXCAAA8hmJ.jpg:large"

tmp2.jpg:
	echo "digraph G{\
	SAMPLE1_FASTQ1_1 -> SAMPLE1_ALIGN1_1;\
	SAMPLE1_FASTQ1_2 -> SAMPLE1_ALIGN1_2;\
	SAMPLE1_ALIGN1_1 -> SAMPLE1_BAM_1;\
	SAMPLE1_ALIGN1_2 -> SAMPLE1_BAM_1;\
	}" | dot -T jpg -o $@

tmp3.jpg:
	echo "digraph G{$(foreach PAIR,1 2,\
	SAMPLE1_FASTQ${PAIR}_1 -> SAMPLE1_ALIGN${PAIR}_1;\
	SAMPLE1_FASTQ${PAIR}_2 -> SAMPLE1_ALIGN${PAIR}_2;\
	SAMPLE1_ALIGN${PAIR}_1 -> SAMPLE1_BAM_${PAIR};\
	SAMPLE1_ALIGN${PAIR}_2 -> SAMPLE1_BAM_${PAIR};\
	SAMPLE1_BAM_${PAIR} -> SAMPLE1_BAM;\
	)}" | dot -T jpg -o $@

tmp4.jpg:
	echo "digraph G{$(foreach SAMPLE,SAMPLE1 SAMPLE2,$(foreach PAIR,1 2,\
	${SAMPLE}_FASTQ${PAIR}_1 -> ${SAMPLE}_ALIGN${PAIR}_1;\
	${SAMPLE}_FASTQ${PAIR}_2 -> ${SAMPLE}_ALIGN${PAIR}_2;\
	${SAMPLE}_ALIGN${PAIR}_1 -> ${SAMPLE}_BAM_${PAIR};\
	${SAMPLE}_ALIGN${PAIR}_2 -> ${SAMPLE}_BAM_${PAIR};\
	${SAMPLE}_BAM_${PAIR} -> ${SAMPLE}_BAM;\
	)${SAMPLE}_BAM -> VCF;)}" | dot -T jpg -o $@


clean.tmp:
	
	
clean: clean.tmp
	rm -f *.out *.tmp makefile.pdf

