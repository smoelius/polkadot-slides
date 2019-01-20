PDFLATEX := pdflatex -halt-on-error
ifeq ($(V),)
PDFLATEX += -interaction=batchmode
endif

PDF := PolkaDotSlides.pdf
BBL := $(PDF:.pdf=.bbl)
TEX := $(PDF:.pdf=.tex)

.PHONY: all additive destructive clean

all: additive

additive:
	(                                     \
	  trap '$(MAKE) restore' EXIT         ; \
	  sed -i.bak -f preprocess.sed $(TEX) ; \
	  $(MAKE) $(PDF)                      \
	)

destructive:
	[ ! -f $(TEX).bak ]
	sed -i.bak -f preprocess.sed $(TEX)
	$(MAKE) $(PDF)

restore:
	mv -f $(TEX).bak $(TEX)

%.pdf: %.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<

%.bbl: %.tex
	$(PDFLATEX) $<
	bibtex $(basename $<)

clean:
	while read X; do rm -f .$$X; done < .gitignore
