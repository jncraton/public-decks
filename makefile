all: bw-memory/index.html llm-pdc/index.html llm-everyone/index.html exceptions/index.html python-for/index.html truthfinders-ai/index.html cs-intro/index.html

.PHONY: clean

%/index.html: %/slides.md reveal.js
	pandoc --mathjax -t revealjs --template=revealjs-template.html --standalone --css=../style.css -V revealjs-url=../reveal.js -V theme:white -V history=true -o $@ $<
	ln -sf ../reveal.js $*/reveal.js
	qrencode "https://jncraton.github.io/slide-decks/$*" -o "$*/qr.png"

spellcheck:
	find */slides.md -exec aspell --home-dir=. --check --dont-backup {} \;

reveal.js:
	git clone --depth=1 --branch 5.2.0 https://github.com/hakimel/reveal.js

clean:
	rm -f */index.html
	rm -rf */reveal.js
	rm -rf reveal.js
