.PHONY: all clean

all: book.html

%.html: %.xml
	rm -rf out; mkdir out
	cd out && ln -s ../img img
	xmlto -o out --skip-validation html $<

clean:
	rm -f *.html
	rm -rf out
