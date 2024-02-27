wget -q --spider google.com 
if [ $? -ne 0 ] ; then
  echo "Proxyの設定が間違っています"
fi
echo "Proxy OK"

if ! [ -x "$(command -v docker)" ]; then
then
    echo "dockerがありません。管理者にインストールを申請してください"
    exit 1
fi
echo "docker OK"

if ! [ -x "$(command -v nvidia-ctk)" ]; then
then
    echo "nvidia-ctk(NVIDIAコンテナツールキット)がありません。管理者にインストールを申請してください"
    exit 1
fi
echo "nvidia-ctk OK"

if ! [ -x "$(command -v nvidia-smi)" ]; then
then
    echo "nvidia-smi(NVIDIAドライバ)がありません。管理者にインストールを申請してください"
    exit 1
fi
echo "nvidia-smi OK"