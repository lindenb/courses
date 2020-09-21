all: $(addsuffix .png, $(addprefix fig,01))
fig01.png:
	echo "digraph G {rankdir=LR; n1[shape=rarrow label=keyboard];n2[shape=cylinder label=bash];n3[label=screen shape=box3d]; n1 -> n2[label=stdin]; n2-> n3[label=stdout];}" |dot -T png -o $@
