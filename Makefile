.PHONY: FORCE_MAKE clean
.DELETE_ON_ERROR:
pdf: main.pdf
main.pdf: FORCE_MAKE
	latexmk -pdf -shell-escape -interaction=nonstopmode main.tex
main_full.pdf: FORCE_MAKE
	latexmk -pdf main_full.tex
main_print.pdf: FORCE_MAKE
	latexmk -pdf main_print.tex
release: main_full.pdf main_print.pdf
clean:
	latexmk -CA
	rm -rf figures/* *.bbl
