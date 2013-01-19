TRANSCRIPT=cat
TRANSLATE=cat
INDEXES=1 2 3
%.pep:%.rna
	${TRANSLATE} $< > $@
%.rna:%.dna
	${TRANSCRIPT} $< > $@

merged.protein: $(foreach INDEX,${INDEXES},file${INDEX}.pep )
	cat $^ > $@

$(foreach INDEX,${INDEXES},$(eval \
file${INDEX}:\
	echo "ATGCTAGTAGATGC" > $$@ \
))
