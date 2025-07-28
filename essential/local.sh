. ./env.sh

if [ ! -f ~/.ssh/id_rsa ]
then
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ''
fi

if ssh-copy-id $USER_NAME@$GPU_URL
then
    proxy="$PROXY_URL"

    if [ -n "$PORT" ]
    then
        proxy="$proxy:$PORT"
    fi

    if [ -n "$MS_USER_NAME" ]
    then
        proxy_user="$(printf '%s\n' "$MS_USER_NAME" \
            | sed -e 's/:/%3a/g')"

        if [ -n "$MS_USER_PASS" ]
        then
            proxy_user="$proxy_user:$(printf '%s\n' "$MS_USER_PASS" \
                | sed -e 's/:/%3a/g')"
        fi

        proxy="$(printf '%s\n' "$proxy_user" \
            | sed -e 's/@/%40/g')@$proxy"
    fi

    if [ ! -f proxy.sh ]
    then
        touch proxy.sh
    fi
    chmod 600 proxy.sh
    printf 'export ALL_PROXY="%s"\n' "$(printf '%s\n' "$proxy" \
        | sed -e 's/\(["$`\]\)/\\\1/g')" \
        | cat - proxy1.sh > proxy.sh

    scp proxy.sh setup.sh test.sh better.sh "$USER_NAME@$GPU_URL:~"

    ssh "$USER_NAME@$GPU_URL" 'sh ~/setup.sh && source ~/.proxy.sh && sh ~/test.sh && rm ~/setup.sh ~/test.sh'
else
    echo 'Error: 環境変数とパスワードを確認してください'
    echo "USER_NAME = $USER_NAME"
    echo "GPU_URL   = $GPU_URL"
    false
fi
