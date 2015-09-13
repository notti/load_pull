.PHONY: FORCE_MAKE clean
.DELETE_ON_ERROR:
pdf: main.pdf
main.pdf: FORCE_MAKE
	latexmk -pdf -shell-escape -interaction=nonstopmode main.tex
main_full.pdf: FORCE_MAKE
	latexmk -pdf main_full.tex
clean:
	latexmk -CA
	rm -rf figures/*
