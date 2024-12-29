# Define variables for directories and files
POSTS_DIR = blog
TEMPLATES_DIR = templates
OUTPUT_DIR = .
STYLE_FILES = reset.css style.css

POSTS = $(wildcard $(POSTS_DIR)/*.md)
POSTS_HTML = $(patsubst $(POSTS_DIR)/%.md, $(POSTS_DIR)/%.html, $(POSTS))

all: index.html blog.html $(POSTS_HTML)

clean:
	rm -f index.html blog.html $(POSTS_HTML)

index.html: index.md templates/index_template.html Makefile
	pandoc --toc -s --css reset.css --css style.css -i $< -o $@ --template=templates/index_template.html

blog.html: blog.md templates/index_template.html Makefile
	pandoc --toc -s --css reset.css --css style.css -i $< -o $@ --template=templates/index_template.html

# Rule to generate individual post HTML files
$(POSTS_DIR)/%.html: $(POSTS_DIR)/%.md $(TEMPLATES_DIR)/index_template.html
	pandoc --toc -s --css ../reset.css --css ../style.css -i $< -o $@ --template=templates/index_template.html


.PHONY: all clean
