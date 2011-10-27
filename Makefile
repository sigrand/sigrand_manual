# Prerequisits:
#	xmlto for html
#	fop, docbook-xsl for pdf
#
# Use make -jN for full CPU utilization

#xsl = /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl

# for dockbook 5
xsl = /usr/share/xml/docbook/stylesheet/docbook-xsl-ns/fo/docbook.xsl

xslt_params  = -param paper.type A4 -param section.autolabel 1 -param toc.section.depth 3
xslt_params += -param section.label.includes.component.label 1 -param shade.verbatim 1
xslt_params += -param ulink.show 0 -param variablelist.as.blocks 1 -param variablelist.as.blocks 1
xslt_params += -param ulink.show 0 -param variablelist.as.blocks 1 -param use.extentions 1

.PHONY : all clean

all : book_ru/index.html book_en/index.html book_en.pdf book_ru.pdf

%/index.html : %.xml
	rm -rf $*; mkdir $*
	cd $* && ln -s ../img img
	nice -19 xmlto -o $* --skip-validation html $<

%.pdf : %.xml fop.xconf
	nice -19 fop ${xslt_params} -c fop.xconf -xml $*.xml -xsl $*.xsl -pdf $@

clean:
	rm -rf book_ru book_en
	rm -f *.fo *.pdf
