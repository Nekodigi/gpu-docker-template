test -f ~/proxy.sh && (
    test -f ~/.proxy.sh || (
        echo '[[ -f ~/.proxy.sh ]] && . ~/.proxy.sh' >> ~/.bashrc

        test -f ~/.bash_profile || (echo '[[ -f ~/.bashrc ]] && . ~/.bashrc' > ~/.bash_profile)
        echo '[[ -f ~/.proxy.sh ]] && . ~/.proxy.sh' >> ~/.bash_profile

        echo '[[ -f ~/.proxy.sh ]] && . ~/.proxy.sh' >> ~/.zshrc
    )
) && mv ~/proxy.sh ~/.proxy.sh \
    && echo "==SETUP COMPLETED=="
