all: index.html

clean:
	rm -f index.html

index.html: index.md template.html Makefile
	pandoc --toc -s --css reset.css --css style.css -i $< -o $@ --template=index_template.html

.PHONY: all clean