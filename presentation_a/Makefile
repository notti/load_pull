.PHONY: FORCE_MAKE clean
.DELETE_ON_ERROR:
pdf: main.pdf
main.pdf: FORCE_MAKE
	latexmk -pdf -shell-escape -interaction=nonstopmode main.tex
main_dual.pdf: FORCE_MAKE
	latexmk -pdf main_dual.tex
main_single.pdf: FORCE_MAKE
	latexmk -pdf main_single.tex
release: main_single.pdf main_dual.pdf
clean:
	latexmk -CA
	rm -rf figures/*
