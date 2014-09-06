overall.pdf: overall.tex
	latexmk -pdfps overall.tex
clean:
	latexmk -CA
