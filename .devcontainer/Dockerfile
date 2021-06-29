FROM ubuntu:20.04
LABEL maintainer="Yves Chevallier <yves.chevallier@heig-vd.ch>"

ARG USERNAME=latex
ARG WORKDIR=/latex
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG DRAWIO_VERSION=14.6.13
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y texlive-xetex texlive-extra-utils \
    texlive-bibtex-extra biber \
    texlive-lang-french texlive-fonts-extra texlive-science \
    latexmk git python3 python3-pip inkscape libnotify4 libxss1 xdg-utils \
    libsecret-1-0 libappindicator3-1 wget xvfb sudo locales

# Draw.io for building figures
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/drawio-amd64-${DRAWIO_VERSION}.deb
RUN dpkg -i drawio-amd*

# Pygments for LaTeX minted
RUN pip install control Pygments

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update font cache
RUN fc-cache -fv

# Clear cache, man page and documentation
RUN apt-get clean -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /usr/share/man &&\
    rm -f /etc/ssh/ssh_host_* &&\
    mkdir -p /usr/share/man &&\
    find /usr/share/doc -depth -type f ! -name copyright -delete &&\
    find /usr/share/doc -type f -name "*.pdf" -delete &&\
    find /usr/share/doc -type f -name "*.gz" -delete &&\
    find /usr/share/doc -type f -name "*.tex" -delete &&\
    (find /usr/share/doc -type d -empty -delete || true) &&\
    mkdir -p /usr/share/doc &&\
    rm -rf /var/cache/apt/archives &&\
    mkdir -p /var/cache/apt/archives &&\
    rm -rf /tmp/* /var/tmp/* &&\
    (find /usr/share/ -type f -empty -delete || true) &&\
    (find /usr/share/ -type d -empty -delete || true) &&\
    mkdir -p /usr/share/texmf/source &&\
    mkdir -p /usr/share/texlive/texmf-dist/source


# Create the user
# RUN groupadd --gid $USER_GID $USERNAME &&\
#     useradd --uid $USER_UID --gid $USER_GID -m $USERNAME &&\
#     echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME &&\
#     chmod 0440 /etc/sudoers.d/$USERNAME
# RUN mkdir -p ${WORKDIR} && chown ${USERNAME}:${USERNAME} ${WORKDIR}
# USER $USERNAME
# ENV USER=${USERNAME}
WORKDIR /latex

# Bind bashrc
ADD .bashrc /root/.bashrc
ADD .bashrc /home/${USERNAME}/.bashrc
