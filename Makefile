# sudo apt install inotify-tools latexmk

FILES = $(shell ls main.tex main.bib tex/*.tex)

build:
	latexmk -pdf main.tex

watch: build
	inotifywait --quiet --monitor --event close_write --format %e $(FILES) | while read events; do latexmk -pdf main.tex; done

clean:
	rm -f main.aux main.lof main.lot main.out main.run.xml main.toc main.bbl main.blg main.dvi main.fdb_latexmk main.fls main.log
	rm main.pdf || echo "Already clean"
