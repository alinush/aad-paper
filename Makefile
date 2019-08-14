#
# Makefile for acmart package
#
# This file is in public domain
#
# $Id: Makefile,v 1.10 2016/04/14 21:55:57 boris Exp $
#

PACKAGE=acmart

PAPER ?= main.tex


PDF = ${PAPER:%.tex=%.pdf}

all: clean figures ${PDF}

svg_to_eps: figures/accaad.eps figures/AT.eps figures/forest.eps figures/model.eps

svg_to_pdf: figures/accaad.pdf figures/AT.pdf figures/forest.pdf figures/model.pdf

figures: svg_to_eps svg_to_pdf

figures/%.eps: figures/%.svg
	inkscape -D -z --file=$(realpath $<) --export-eps=$(realpath .)/$@

figures/%.pdf: figures/%.svg
	inkscape -D -z --file=$(realpath $<) --export-dpi=300 --export-pdf=$(realpath .)/$@ 

# This is for generating acmart.pdf
#%.pdf:  %.dtx   $(PACKAGE).cls
#	pdflatex $<
#	- bibtex $*
#	pdflatex $<
#	- makeindex -s gind.ist -o $*.ind $*.idx
#	- makeindex -s gglo.ist -o $*.gls $*.glo
#	pdflatex $<
#	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
#	do pdflatex $<; done

%.cls: %.ins %.dtx
	pdflatex $<

#paper/%: %
#	cp $^ paper

#paper/$(PACKAGE).cls: $(PACKAGE).cls
#paper/ACM-Reference-Format.bst: ACM-Reference-Format.bst

#main.pdf: main.tex $(PACKAGE).cls ACM-Reference-Format.bst
$(PDF): $(PAPER) $(PACKAGE).cls ACM-Reference-Format.bst
	cd $(dir $@) && pdflatex $(notdir $<)
	- cd $(dir $@) && bibtex $(notdir $(basename $<))
	cd $(dir $@) && pdflatex $(notdir $<)
	cd $(dir $@) && pdflatex $(notdir $<)
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $(basename $<).log) \
	  do cd $(dir $@) && pdflatex $(notdir $<); done

.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).cls


clean:
	$(RM) *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	*.log \
	*.aux \
	*.out \
	*.bbl \
	*.blg \
	*.cut \
	main.pdf \
	*synctex.gz \
	*.fls \
	*.fdb_latexmk

distclean: clean


#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PACKAGE); mv ../$(PACKAGE).tgz .

zip:  all clean
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'

documents.zip: all
	zip $@ acmart.pdf acmguide.pdf *.cls *.bst

open: main.pdf
	xdg-open main.pdf
