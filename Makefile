# Prerequisits:
#	xmlto for html
#	fop, docbook-xsl for pdf

xsl = /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl

.PHONY : all clean

all : book/index.html book.pdf  book_en/index.html book_en.pdf

%/index.html : %.xml
	rm -rf $*; mkdir $*
	cd $* && ln -s ../img img
	xmlto -o $* --skip-validation html $<

%.fo : %.xml
	xsltproc -o $@ $(xsl) $<

%.pdf : %.fo
	fop -pdf $@ -fo $<

clean:
	rm -rf book book_en *.fo *.pdf
