.PHONY: all clean

all: book/index.html book_en/index.html

%/index.html: %.xml
	rm -rf $*; mkdir $*
	cd $* && ln -s ../img img
	xmlto -o $* --skip-validation html $<

clean:
	rm -rf book book_en
