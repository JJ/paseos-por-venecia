
pdf: paseos-por-venecia.pdf

paseos-por-venecia.pdf: texto/*.md
	pandoc --verbose -V geometry:paperheight=9in -V geometry=paperwidth=6in \
    -V language=spanish -V lang=es-ES \
    -V author='JJ Merelo' -V title='Paseos por Venecia'\
    -V documentclass=book\
    -o paseos-por-venecia.pdf \
    texto/*.md \
    --toc
