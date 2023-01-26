
pdf: paseos-por-venecia.pdf
html: paseos-por-venecia.xhtml
doc: paseos-por-venecia.docx
epub: paseos-por-venecia.epub

paseos-por-venecia.pdf: texto/*.md
	pandoc --verbose -V geometry:paperheight=9in -V geometry=paperwidth=6in \
    -V language=spanish -V lang=es-ES \
    -V author='JJ Merelo' -V title='Paseos por Venecia'\
    -V documentclass=book\
    -o paseos-por-venecia.pdf \
    texto/*.md \
    --toc

paseos-por-venecia.xhtml: texto/*.md *.css *.txt
	pandoc  -o paseos-por-venecia.xhtml --standalone \
        --toc --metadata title="Paseos por Venecia" --metadata creator="JJ Merelo" --metadata rights="CC-BY-SA 3.0" \
        --css=paseos-por-venecia.css \
        paseos-por-venecia.txt  texto/*.md

paseos-por-venecia.docx: texto/*.md *.txt
	pandoc  -o paseos-por-venecia.docx \
        --metadata title="Paseos por Venecia" --metadata creator="JJ Merelo" --metadata rights="CC-BY-SA 3.0" \
        paseos-por-venecia.txt  texto/*.md

paseos-por-venecia.epub: texto/*.md *.css *.txt
	pandoc  -o paseos-por-venecia.epub --standalone  \
        --toc --metadata title="Paseos por Venecia" --metadata creator="JJ Merelo" --metadata rights="CC-BY-SA 3.0" \
        --css=paseos-por-venecia.css \
        paseos-por-venecia.txt  texto/*.md
