FILES = .paper.md \
		metadata.yaml

OUTPUT = build

FLAGS = --bibliography=bibliography.bib \
		--csl=bibliography.csl \
		--pdf-engine=xelatex \
		-s \
		-f markdown

FLAGS_PDF = --template=template.latex

all: pdf

pdf:
	cat paper.md |perl -pe 's/^\|(.+?)|\|.+/    \1  /g' > .paper.md; pandoc -o $(OUTPUT)/paper.pdf $(FLAGS) $(FLAGS_PDF) $(FILES)

clean:
	rm build/*

