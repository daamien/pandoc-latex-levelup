FROM python:3

COPY . /tmp

WORKDIR /tmp 

# Set the env variables to non-interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-full \
    fontconfig \
    pandoc

RUN pip install pandoc-latex-levelup

RUN pandoc --filter ./pandoc_latex_levelup.py --toc -N ./pandoc_latex_levelup.sample.md -o ./pandoc_latex_levelup.sample.pdf
