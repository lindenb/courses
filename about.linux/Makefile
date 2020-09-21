all: $(addsuffix .png, $(addprefix fig,01 02 03 04 05 06))


fig01.png:
	echo "digraph G {rankdir=LR; n1[shape=rarrow label=keyboard];n2[shape=cylinder label=bash];n3[label=screen shape=box3d]; n1 -> n2[label=stdin]; n2-> n3[label=stdout];}" |dot -T png -o $@
fig02.png:
	echo "digraph G {rankdir=LR; n2[shape=cylinder label=echo];n3[label=screen shape=box3d]; n2-> n3[label=stdout];}" |dot -T png -o $@
fig03.png:
	echo "digraph G {rankdir=LR; n2[shape=cylinder label=pwd];n3[label=screen shape=box3d]; n2-> n3[label=stdout];}" |dot -T png -o $@
fig04.png:
	echo "digraph G {rankdir=LR; n2[shape=cylinder label=seq];n3[label=screen shape=box3d]; n2-> n3[label=stdout];}" |dot -T png -o $@
fig05.png:
	echo "digraph G {rankdir=LR; n1[shape=rarrow label=keyboard];n2[shape=cylinder label=cat];n3[label=screen shape=box3d]; n1 -> n2[label=stdin]; n2-> n3[label=stdout];}" |dot -T png -o $@
fig06.png:
	echo "digraph G {rankdir=LR; n1[shape=note label=file];n2[shape=cylinder label=cat];n3[label=screen shape=box3d]; n1 -> n2[label=input]; n2-> n3[label=stdout];}" |dot -T png -o $@
