# Prerequisits:
#	xmlto for html
#	fop, docbook-xsl for pdf

xsl = /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl

.PHONY : all clean

all : book_ru/index.html book_en/index.html book_en.pdf book_ru.pdf

%/index.html : %.xml
	rm -rf $*; mkdir $*
	cd $* && ln -s ../img img
	xmlto -o $* --skip-validation html $<

%.pdf : %.xml fop.xconf
	fop -c fop.xconf -xml $*.xml -xsl $(xsl) -pdf $@

clean:
	rm -rf book_ru book_en
	rm -f *.fo *.pdf
