FROM ubuntu:jammy

LABEL maintainer="Ted Kent" 
LABEL email="tjkent88@gmail.com"
LABEL version="0.1"
LABEL description="This is a container to be used to build out code"
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# Install basic dependencies for compiling
RUN \
    apt update \
    && apt install -y build-essential clang curl flex bison g++ gawk gcc-multilib g++-multilib \
    gettext git libncurses-dev libssl-dev python3-distutils rsync unzip zlib1g-dev \
    file wget

# Install Oh-My-Zsh
RUN \
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    #-p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions

WORKDIR /root
CMD [ "zsh", "-i" ]
