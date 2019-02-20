PDFLATEX := pdflatex -halt-on-error
ifeq ($(V),)
PDFLATEX += -interaction=batchmode
endif

PDF := PolkaDotSlides.pdf
BBL := $(PDF:.pdf=.bbl)
TEX := $(PDF:.pdf=.tex)

.PHONY: all conservative destructive clean

all: conservative

conservative:
	[ ! -f $(TEX).bak ]
	(                                     \
	  trap '$(MAKE) restore' INT EXIT     ; \
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
	for X in $(addprefix .,$(shell cat .gitignore)); do rm -f $$X; done
