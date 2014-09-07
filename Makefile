overall.pdf: overall.tex literature.bib
	latexmk -pdfps overall.tex
clean:
	latexmk -CA
