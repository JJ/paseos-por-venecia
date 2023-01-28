
MDFILES = $(wildcard texto/*.md)
CALMAMDFILES = $(filter-out texto/15.Idioma.md texto/16.Inventos.md, $(MDFILES))
ALLFILES = $(MDFILES)  $(wildcard *.txt) $(wildcard *.css)

pdf: paseos-por-venecia.pdf
calmapdf: venecia-con-calma.pdf
html: paseos-por-venecia.xhtml
doc: paseos-por-venecia.docx
epub: paseos-por-venecia.epub

paseos-por-venecia.pdf: $(MDFILES)
	pandoc --verbose -V geometry:paperheight=9in -V geometry=paperwidth=6in \
	--pdf-engine=xelatex -V 'fontfamily:fbb'\
    -V language=spanish -V lang=es-ES \
    -V author='JJ Merelo' -V title='Paseos por Venecia'\
    -V documentclass=book\
    -o paseos-por-venecia.pdf \
    texto/*.md \
    --toc

venecia-con-calma.pdf : $(CALMAMDFILES)
		pandoc --verbose -V geometry:paperheight=9in -V geometry=paperwidth=6in \
	--pdf-engine=xelatex -V 'fontfamily:fbb'\
    -V language=spanish -V lang=es-ES \
    -V author='JJ Merelo' -V title='Venecia con calma'\
    -V documentclass=book\
    -o venecia-con-calma.pdf \
    $(CALMAMDFILES)\
    --toc

paseos-por-venecia.xhtml: $(ALLFILES)
	pandoc  -o paseos-por-venecia.xhtml --standalone \
        --toc --metadata title="Paseos por Venecia" --metadata creator="JJ Merelo" --metadata rights="CC-BY-SA 3.0" \
        --css=paseos-por-venecia.css \
        paseos-por-venecia.txt  texto/*.md

paseos-por-venecia.docx: $(ALLFILES)
	pandoc  -o paseos-por-venecia.docx \
        --metadata title="Paseos por Venecia" --metadata creator="JJ Merelo" --metadata rights="CC-BY-SA 3.0" \
        paseos-por-venecia.txt  texto/*.md

paseos-por-venecia.epub: $(ALLFILES)
	pandoc  -o paseos-por-venecia.epub --standalone  \
        --toc --metadata title="Paseos por Venecia" --metadata creator="JJ Merelo" --metadata rights="CC-BY-SA 3.0" \
        --css=paseos-por-venecia.css \
        paseos-por-venecia.txt  texto/*.md
