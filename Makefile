.PHONY: FORCE_MAKE clean
.DELETE_ON_ERROR: pdf
pdf: main.pdf
main.pdf: FORCE_MAKE
	latexmk -pdf -shell-escape -interaction=nonstopmode main.tex
	
clean:
	latexmk -CA
