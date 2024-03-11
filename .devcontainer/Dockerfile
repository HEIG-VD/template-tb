FROM library/ubuntu:jammy

LABEL maintainer="Yves Chevallier <yves.chevallier@heig-vd.ch>"

ARG USERNAME=latex
ARG WORKDIR=/latex
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Texlive
RUN apt-get install -y latexmk biber
RUN apt-get install -y texlive-base \
    texlive-binaries \
    texlive-extra-utils \
    texlive-lang-french \
    texlive-latex-base \
    texlive-xetex \
    texlive-pstricks \
    texlive-pictures \
    texlive-latex-recommended \
    texlive-science \
    texlive-fonts-extra

# Python
RUN apt-get install -y git python3 python3-pip

# Inkscape
RUN apt-get install -y inkscape

# Additional utilities
RUN apt-get install -y wget xvfb locales sudo

# Pygments for LaTeX minted
RUN pip install control Pygments

# Draw.io for building figures
RUN apt-get install -y libnotify4 libxss1 xdg-utils libsecret-1-0 libappindicator3-1 libgbm1 libasound2
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v24.0.4/drawio-arm64-24.0.4.deb
RUN dpkg -i drawio-arm64*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update font cache
RUN fc-cache -fv

# User
WORKDIR /latex

# USER $USERNAME
# ENV USER=${USERNAME}
# RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
# RUN groupadd --gid $USER_GID $USERNAME
# RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
# RUn chmod 0440 /etc/sudoers.d/$USERNAME

# Bind bashrc
# ADD .bashrc /root/.bashrc
# ADD .bashrc /home/${USERNAME}/.bashrc
