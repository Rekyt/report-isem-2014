# Makefile for report

.PHONY: all clean wc wcsum

all: reporttemplate.pdf

reporttemplate.pdf: reporttemplate.tex
	@xelatex $<
	@bibtex $(patsubst %.tex, %.aux, $<)
	@xelatex $<
	@xelatex $<

reporttemplate.tex: 0-Summary.tex 1-Introduction.tex 2-MaterialsAndMethods.tex 3-Results.tex 4-Discussion.tex 5-AuthorsContributions.tex 6-References.tex
	@touch $@

wc:
	@perl texcount.pl -inc -nobib -sum=1,1,1,0,0,0,0 reporttemplate.tex

wcsum:
	@perl texcount.pl 0-Summary.tex

clean:
	@echo "Removing .log files..."
	@rm *.log
	@echo "Removing .aux files..."
	@rm *.aux
	@rm *.blg *.bbl *.out
