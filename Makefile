TEX_FILES = \
	elegantbook-cn.tex \
	src/*.tex
CLASS_FILES = elegantbook.cls
BIB_FILES = reference.bib
IMAGES = image/*.png image/*.jpg

.PHONY: all
all: elegantbook-cn.pdf

elegantbook-cn.pdf: $(TEX_FILES) $(CLASS_FILES) $(IMAGES) $(BIB_FILES)
	xelatex $< || (make clean && exit 5)
	biber elegantbook-cn || (make clean && exit 6)
	xelatex $< || (make clean && exit 7)
	xelatex $< || (make clean && exit 8)

.PHONY: clean
clean:
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb # latex auxiliary files
	rm -f *.dvi *.xdv *-converted-to.* # intermediate documents
	rm -f .pdf
	rm -f *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml # bibliography auxiliary files
	rm -f *.fdb_latexmk *.synctex *.synctex\(busy\) *.synctex.gz *.synctex.gz\(busy\) *.pdfsync # build tool auxilary files
	rm -rf latex.out/
	rm -f elegantbook-cn.pdf
