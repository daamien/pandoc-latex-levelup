pandoc-latex-levelup
===============================================================================

[![Build
Status](https://travis-ci.org/daamien/pandoc-latex-levelup.svg?branch=master)](https://travis-ci.org/daamien/pandoc-latex-levelup)
[![Docker Automated
Build](https://img.shields.io/docker/automated/daamien/pandoc-latex-levelup.svg)](https://hub.docker.com/r/daamien/pandoc-latex-levelup/)

A pandoc filter to shift the level of all headers in a latex/pdf output 

The filter is written in Python with
[panflute](http://scorreia.com/software/panflute/) 
which I recommend if you want to create your own pandoc filters.
 

Install
-------------------------------------------------------------------------------

```
sudo pip install pandoc-latex-levelup
```

or 

```
docker run -d daamien/pandoc-latex-levelup
```

Quick Start
-------------------------------------------------------------------------------


```
pandoc --filter pandoc-latex-levelup \
       --template ./pandoc_latex_levelup.template.tex \
       --latex-engine xelatex \
       ./pandoc_latex_levelup.sample.md \ 
       --toc -N \
       -o ./pandoc_latex_levelup.sample.pdf
```



Configuration
-------------------------------------------------------------------------------


FIXME

Example
-------------------------------------------------------------------------------

See [pandoc-latex-levelup.sample.md](pandoc-latex-levelup.sample.md)

and [pandoc-latex-levelup.sample.pdf](pandoc-latex-levelup.sample.pdf)

Contributing & Getting Help
-------------------------------------------------------------------------------

If you have any difficulties with this software, please file an issue here :

https://github.com/daamien/pandoc-latex-levelup/issues

License
-------------------------------------------------------------------------------

This software is available under the BSD 3-Clause Licence.

see [LICENSE](LICENSE)
