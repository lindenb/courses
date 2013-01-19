TRANSCRIPT=cat
TRANSLATE=cat

merged.protein: file1.pep file2.pep file3.pep
	cat file1.pep file2.pep \
		file3.pep > merged.protein

file1.pep: file1.rna
	 ${TRANSLATE} file1.rna > file1.pep

file1.rna : file1.dna
	${TRANSCRIPT} file1.dna > file1.rna

file1.dna:
	echo "ATGCTAGTAGATGC" > file1.dna

file2.pep: file2.rna
	 ${TRANSLATE} file2.rna > file2.pep

file2.rna : file2.dna
	${TRANSCRIPT} file2.dna > file2.rna

file2.dna:
	echo "ATGCTAGTAGATGC" > file2.dna


file3.pep: file3.rna
	 ${TRANSLATE} file3.rna > file3.pep

file3.rna : file3.dna
	${TRANSCRIPT} file3.dna > file3.rna

file3.dna:
	echo "ATGCTAGTAGATGC" > file3.dna
