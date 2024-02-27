GPU_URL=""
USER_NAME=""

yes y |  ssh-keygen -t rsa -b 4096   
scp ~/.ssh/id_rsa.pub $USER_NAME@$GPU_URL:~/.ssh/authorized_keys

scp setup.sh $USER_NAME@$GPU_URL:~/setup.sh
scp test.sh $USER_NAME@$GPU_URL:~/test.sh
scp better.sh $USER_NAME@$GPU_URL:~/better.sh
ssh $USER_NAME@$GPU_URL sh setup.sh
ssh $USER_NAME@$GPU_URL "source ~/.zshrc; sh test.sh"