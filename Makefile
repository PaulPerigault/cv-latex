.PHONY: build clean docker

build:
	mkdir -p out
	cd cv && pdflatex -output-directory=../out -interaction=nonstopmode main.tex
	cd cv && pdflatex -output-directory=../out -interaction=nonstopmode main.tex

docker:
	docker build --output out --target export .

clean:
	rm -f out/*.aux out/*.log out/*.out out/*.toc
