FROM ubuntu:latest
LABEL maintainer="Yves Chevallier <yves.chevallier@heig-vd.ch>"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y texlive-xetex
RUN apt-get install -y texlive-lang-french
RUN apt-get install -y texlive-fonts-extra
RUN apt-get install -y texlive-science
RUN apt-get install -y latexmk

RUN apt-get install -y python3 python3-pip

RUN apt-get -y install inkscape

RUN apt-get -y install libnotify4 libxss1 xdg-utils
RUN apt-get -y install libsecret-1-0 libappindicator3-1
RUN apt-get -y install wget
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v14.6.13/drawio-amd64-14.6.13.deb
RUN dpkg -i drawio-amd*

# Update font cache
RUN fc-cache -fv

# Clear cache, man page and documentation
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/share/man
RUN rm -f /etc/ssh/ssh_host_*
RUN mkdir -p /usr/share/man
RUN find /usr/share/doc -depth -type f ! -name copyright -delete
RUN find /usr/share/doc -type f -name "*.pdf" -delete
RUN find /usr/share/doc -type f -name "*.gz" -delete
RUN find /usr/share/doc -type f -name "*.tex" -delete
RUN (find /usr/share/doc -type d -empty -delete || true)
RUN mkdir -p /usr/share/doc
RUN rm -rf /var/cache/apt/archives
RUN mkdir -p /var/cache/apt/archives
RUN rm -rf /tmp/* /var/tmp/*
RUN (find /usr/share/ -type f -empty -delete || true)
RUN (find /usr/share/ -type d -empty -delete || true)
RUN mkdir -p /usr/share/texmf/source
RUN mkdir -p /usr/share/texlive/texmf-dist/source

ENV USER=latex