
uid=$(id -u)
gid=$(id -g)
name=$(id -un)

sed -i "s/\bARG USERNAME=.*$/ARG USERNAME=$name/" ./.devcontainer/Dockerfile
sed -i "s/\bARG USER_UID=.*$/ARG USER_UID=$uid/" ./.devcontainer/Dockerfile