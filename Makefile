PDFLATEX := pdflatex -halt-on-error
ifeq ($(V),)
PDFLATEX += -interaction=batchmode
endif

PDF := PolkaDotSlides.pdf
TEX := $(PDF:.pdf=.tex)

.PHONY: all additive destructive clean

all: additive

additive: $(PDF)
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
	bibtex $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	while read X; do rm -f .$$X; done < .gitignore
	for X in $(wildcard tmp.*); do rm -f $$X; done
