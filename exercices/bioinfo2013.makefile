.PHONY:all clean
.SECONDARY=
SEQUENCES=alpha beta gamma

%.rna:%.dna
	tr "Tt" "Uu" < $< > $@
%.fa:%.rna
	echo ">$(basename $(notdir $<))" > $@ && cat $< >> $@


all: sequences.fa

sequences.fa : $(foreach S,${SEQUENCES}, $(addsuffix .fa,${S}))
	cat $^ > $@

alpha.dna:
	echo  "ATCGATCGCATCGATATAGC" > $@

beta.dna:
	echo  "ATCCGGCTAAGCTATATAGCT" > $@

gamma.dna:
	echo  "CCTTGACTGAGCGATCGGG" > $@

clean:
	rm -f *.fa *.dna *.rna
