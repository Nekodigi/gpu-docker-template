wget -q --spider google.com 
if [ $? -ne 0 ] ; then
  echo "Proxyの設定が間違っています"
fi
echo "Proxy OK"

if ! command -v docker &> /dev/null
then
    echo "dockerがありません。管理者にインストールを申請してください"
    exit 1
fi
echo "docker OK"

if ! command -v nvidia-ctk &> /dev/null
then
    echo "nvidia-ctk(NVIDIAコンテナツールキット)がありません。管理者にインストールを申請してください"
    exit 1
fi
echo "nvidia-ctk OK"

if ! command -v nvidia-smi &> /dev/null
then
    echo "nvidia-smi(NVIDIAドライバ)がありません。管理者にインストールを申請してください"
    exit 1
fi
echo "nvidia-smi OK"