#!/bin/bash
<<<<<<< HEAD
PEP="file1.pep file2.pep file3.pep"
TRANSCRIPT=cat
TRANSLATE=cat

for P in ${PEP}
do
  if [ ! -f "${P/%pep/dna}" ];
  then
      echo "ATAGACAGATAAG"  >   ${P/%pep/dna}
  fi
  ${TRANSCRIPT} ${P/%pep/dna} >    ${P/%pep/rna}
  ${TRANSLATE}     ${P/%pep/rna} >   ${P}
done

cat ${PEP} > merged.protein
=======
TRANSCRIPT=cat
TRANSLATE=cat
rm -f merge.protein
for DNA in file1.dna file2.dna file3.dna
do
	echo "ATGCTAGTAGATGC" > ${DNA}
	${TRANSCRIPT} ${DNA} > ${DNA/%.dna/.rna}
	if [ ! -f  ${DNA/%.dna/.pep} ]
	then
		${TRANSLATE} ${DNA/%.dna/.rna} > ${DNA/%.dna/.pep}
	fi
	cat ${DNA/%.dna/.pep} >> merge.protein
done
>>>>>>> 878c5ab1d42247314eb6d8ea32af0da27610fe7f
