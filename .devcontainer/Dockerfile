FROM ubuntu:24.04
LABEL maintainer="Yves Chevallier <yves.chevallier@heig-vd.ch>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Texlive
RUN apt-get install -y texlive-base \
    texlive-binaries texlive-extra-utils texlive-lang-french \
    texlive-latex-base texlive-luatex texlive-pstricks \
    texlive-pictures texlive-latex-recommended \
    texlive-science texlive-fonts-extra latexmk biber

RUN apt-get install -y wget git inkscape locales sudo python3-pygments make

# Draw.io for building figures
ENV DRAWIO_VERSION=26.0.9
RUN apt-get install -y xvfb libnotify4 libxss1 xdg-utils libsecret-1-0 libappindicator3-1 libgbm1
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v$DRAWIO_VERSION/drawio-amd64-$DRAWIO_VERSION.deb && \
    dpkg -i drawio-amd64-$DRAWIO_VERSION.deb && \
    rm drawio-amd*

COPY drawio-cli /usr/bin/drawio-cli
RUN chmod +x /usr/bin/drawio-cli

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Update font cache
RUN fc-cache -fv

# Need more Python Packages?
RUN apt-get install -y python3-pip
RUN rm /usr/lib/python3.12/EXTERNALLY-MANAGED

RUN pip install control numpy

# Clear cache, man page and documentation
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives /usr/share/doc/* \
    /usr/share/man/* /usr/share/locale/* /tmp/* /var/tmp/* /usr/share/info/* \
    /etc/ssh/ssh_host_* && \
    mkdir -p /var/lib/apt/lists /var/cache/apt/archives /usr/share/man /usr/share/doc

ENV XDG_RUNTIME_DIR="/tmp/runtime"
RUN mkdir -p $XDG_RUNTIME_DIR && chmod 700 $XDG_RUNTIME_DIR
RUN chmod 777 /tmp/runtime

WORKDIR /latex
