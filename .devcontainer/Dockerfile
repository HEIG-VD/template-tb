FROM nowox/latex:3.0

ARG USERNAME=tmz
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME
RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER $USERNAME
# ENV USER=${USERNAME}
# RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
# RUn chmod 0440 /etc/sudoers.d/$USERNAME

# Bind bashrc
ADD .bashrc /root/.bashrc
ADD .bashrc /home/${USERNAME}/.bashrc

ENTRYPOINT [ "/bin/bash" ]