wget -q --spider google.com 
if [ $? -ne 0 ] ; then
  echo "Proxyの設定が間違っています"
else
  echo "Proxy OK"
fi

if ! [ -x "$(command -v docker)" ]; then
    echo "dockerがありません。管理者にインストールを申請してください"
    exit 1
else
  echo "docker OK"
fi

if ! [ -x "$(command -v nvidia-ctk)" ]; then
    echo "nvidia-ctk(NVIDIAコンテナツールキット)がありません。管理者にインストールを申請してください"
    exit 1
else
  echo "nvidia-ctk OK"
fi

if ! [ -x "$(command -v nvidia-smi)" ]; then
    echo "nvidia-smi(NVIDIAドライバ)がありません。管理者にインストールを申請してください"
    exit 1
else
  echo "nvidia-smi OK"
fi