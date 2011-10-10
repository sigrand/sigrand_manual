#!/bin/sh

mkdir -p ./html_en/
xmlto -o ./html_en/ html book_en.xml --skip-validation
xsltproc -o book_en.fo /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl book_en.xml
fop -pdf book_en.pdf -fo book_en.fo
rm -f book_en.fo
cd html_en
ln -s ../img ./img