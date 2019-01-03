PDFLATEX := pdflatex -halt-on-error

.PHONY: all clean

all: PolkaDotSlides.pdf

%.pdf: %.tex
	$(PDFLATEX) $<
	bibtex $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	while read X; do rm -f .$$X; done < .gitignore
