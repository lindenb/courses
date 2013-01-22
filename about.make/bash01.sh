#!/bin/bash
TRANSCRIPT=cat
TRANSLATE=cat
rm -f merge.protein
for DNA in file1.dna file2.dna file3.dna
do
	echo "ATGCTAGTAGATGC" > ${DNA}
	${TRANSCRIPT} ${DNA} > ${DNA/%.dna/.rna}
	${TRANSLATE} ${DNA/%.dna/.rna} > ${DNA/%.dna/.pep}
	cat ${DNA/%.dna/.pep} >> merge.protein
done

