echo '
GPU_URL=""
USER_NAME=""
USER_PASS=""
MS_USER_NAME=""
MS_USER_PASS=""
PROXY_URL=""
PORT=""

proxy=$MS_USER_NAME:$MS_USER_PASS@$PROXY_URL:$PORT
http_proxy="http://$proxy"
https_proxy="$http_proxy"
ftp_proxy="$http_proxy"
socks_proxy="$http_proxy"
HTTP_PROXY="$http_proxy"
HTTPS_PROXY="$http_proxy"

export http_proxy https_proxy ftp_proxy socks_proxy HTTP_PROXY HTTPS_PROXY' > ~/proxy.sh

echo 'source ~/proxy.sh' >> ~/.bash
echo 'source ~/proxy.sh' >> ~/.bash_profile
echo 'source ~/proxy.sh' >> ~/.zshrc
echo "==SETUP COMPLETED=="