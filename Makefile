SAMPLE=./pandoc_latex_levelup.sample
MD=$(SAMPLE).md
PDF=$(SAMPLE).pdf
TEX=$(SAMPLE).tex

FILTER=./pandoc_latex_levelup.py
TEMPLATE=./pandoc_latex_levelup.template.tex

DIST=dist

sdist: 
	python setup.py sdist

install: 
	python setup.py install	

pypi:
	twine upload $(DIST)/*

test: basic_test  $(TEX) $(PDF) 

basic_test:
	echo 'hello world' | pandoc -t json | python -tt ./pandoc_latex_levelup.py 

%.tex: %.md
	pandoc --filter $(FILTER) --template $(TEMPLATE) --latex-engine xelatex --toc --number-sections $(MD) -o $(TEX)

%.pdf:  %.md
	pandoc --filter $(FILTER) --template $(TEMPLATE) --latex-engine xelatex --toc --number-sections $(MD) -o $(PDF)

testpypi: sdist 
	twine upload $(DIST)/* -r testpypi
	#mkvirtualenv test-pandoc-latex-levelup
	#workon test-pandoc-latex-levelup
	pip install --user -i https://testpypi.python.org/pypi pandoc-latex-levelup
	pip uninstall pandoc-latex-levelup
	#rmvirtualenv test-pandoc-latex-levelup

docker: 
	docker build .

clean:
	rm -f $(PDF)
	rm -f $(TEX)
	rm -fr $(DIST)
