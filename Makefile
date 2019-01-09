PDFLATEX := pdflatex -halt-on-error
ifeq ($(V),)
PDFLATEX += -interaction=batchmode
endif

PDF := PolkaDotSlides.pdf
TEX := $(PDF:.pdf=.tex)

.PHONY: all additive destructive clean

all: additive

additive:
	(                                            \
	  TMPTEX=$$(mktemp --suffix=.tex --tmpdir=.) && \
	  TMPPDF=$$(basename $$TMPTEX .tex).pdf      && \
	  sed -f preprocess.sed $(TEX) > $$TMPTEX    && \
	  $(MAKE) $$TMPPDF                           && \
	  mv -f $$TMPPDF $(PDF)                      && \
	  rm -f $$(basename $$TMPTEX .tex).*         \
	)

destructive:
	git diff-index --exit-code HEAD $(TEX)
	sed -i -f preprocess.sed $(TEX)
	$(MAKE) $(PDF)

%.pdf: %.tex
	$(PDFLATEX) $<
	bibtex $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	while read X; do rm -f .$$X; done < .gitignore
	for X in $(wildcard tmp.*); do rm -f $$X; done
