# file: Makefile	George B. Moody (george@mit.edu)

main.pdf:	main.tex
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

main.ps:	main.dvi
	dvips -Ppdf -t letter -o main.ps main

main.dvi:	main.tex
	latex main	# creates main.aux, needed by bibtex
	bibtex main	# creates main.bbl, needed by latex
	latex main	# merges references
	latex main  # produces final copy with correct citation numbers

kit:
	make clean
	cd ..; tar cfvz latex.tar.gz latex
	cd ..; rm -f latex.zip; zip -r latex.zip latex

clean:
	# cd example1; make clean
	# cd example2; make clean
	rm -f main.aux main.bbl main.blg main.dvi main.log
	rm -f main.ps *~