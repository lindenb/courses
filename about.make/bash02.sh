#!/bin/bash
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
