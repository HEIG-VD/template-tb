FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends locales \
    && rm -rf /var/lib/apt/lists/* \
	&& localedef -i fr_CH -c -f UTF-8 -A /usr/share/locale/locale.alias fr_CH.UTF-8
ENV LANG=fr_CH.UTF-8

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install TeX Live without documentation and language support
# src: https://gist.github.com/wkrea/b91e3d14f35d741cf6b05e57dfad8faf
RUN apt-get update && apt-get install -y --no-install-recommends \
    $( \
        apt-cache depends texlive-full | \
        awk '/Depends:/{print $2}' | \
        grep -vP 'doc$' | \
        grep -vP 'texlive-lang' | \
        grep -vP 'latex-cjk' | \
        tr '\n' ' ' \
    ) \
    && rm -rf /var/lib/apt/lists/*

# Install selected Tex Live languages support
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-lang-french \
    texlive-lang-english \
    texlive-lang-european \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    make \
    wget \
    xvfb \
    python3 \
    python3-pip \
    python3-venv \
    python3-pygments \
    inkscape \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v26.0.9/drawio-amd64-26.0.9.deb \
    && apt-get update && apt-get install -y --no-install-recommends \
    ./drawio*.deb \
    alsa-utils \
    && rm -rf /var/lib/apt/lists/* \
    && rm ./drawio*.deb

# Use the existing main user
ENV USER="ubuntu"

# Add `sudo` without password
RUN apt-get update && apt-get install -y --no-install-recommends sudo \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER \
    && rm -rf /var/lib/apt/lists/*

USER $USER
WORKDIR /home/$USER

RUN python3 -m venv --system-site-packages ./venv \
    && source ./venv/bin/activate \
    && pip install --no-cache-dir control

RUN echo -e "\nsource /home/$USER/venv/bin/activate\n" >> /home/$USER/.bashrc
