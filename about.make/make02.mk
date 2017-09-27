TRANSCRIPT=cat
TRANSLATE=cat

%.pep:%.rna
	${TRANSLATE} $< > $@
%.rna:%.dna
	${TRANSCRIPT} $< > $@

merged.protein: file1.pep file2.pep file3.pep
	cat $^ > $@

file1.dna:
	echo "ATGCTAGTAGATGC" > $@
file2.dna:
	echo "ATGCTAGTAGATGC" > $@
file3.dna:
	echo "ATGCTAGTAGATGC" > $@
