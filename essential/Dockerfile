FROM nvcr.io/nvidia/pytorch:24.01-py3

RUN apt update && apt-get install -y software-properties-common

RUN apt install -y \
    wget \
    curl \
    bzip2 \
    build-essential \
    git \
    fzf

RUN apt install -y \
    git-lfs \
    ca-certificates \
    libsndfile1-dev \
    libgl1 \
    libx11-6 \
    unzip

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg;
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null;
RUN apt update && apt install -y gh;

# Env improvements
RUN echo 'alias python="/usr/bin/python3"' >> /root/.zshrc

RUN pip3 install tensorflow[and-cuda]

# Uses "Spaceship" theme with some customization. Uses some bundled plugins and installs some more from github
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p web-search \
    -p copypath \
    -p copyfile \
    -p copybuffer \
    -p dirhistory \
    -p history \
    -p history-substring-search \
    -p jsontools \
    -p macos \
    -p thefuck \
    -p fzf \
    -p https://github.com/fdellwing/zsh-bat \
    -p https://github.com/MichaelAquilina/zsh-you-should-use \
    -p https://github.com/marlonrichert/zsh-autocomplete

WORKDIR /demo

RUN git clone https://github.com/Lightning-AI/tutorials.git

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

RUN pip3 install ema_pytorch denoising_diffusion_pytorch

WORKDIR /root

COPY utils.sh utils.sh
RUN echo 'source ~/utils.sh' >> ~/.zshrc

RUN echo 'alias form="ruff . --fix && black . && isort ."' >> ~/.zshrc

# Make .gitconfig first
COPY .gitconfig gitconfig
RUN cat gitconfig > .gitconfig

# When you use proxy
# COPY setup.sh setup.sh
# RUN sh setup.sh
