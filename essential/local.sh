. ./env.sh

if [ ! -f ~/.ssh/id_rsa ]
then
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ''
fi
ssh-copy-id $USER_NAME@$GPU_URL

scp env.sh $USER_NAME@$GPU_URL:~/env.sh
scp setup.sh $USER_NAME@$GPU_URL:~/setup.sh
scp test.sh $USER_NAME@$GPU_URL:~/test.sh
scp better.sh $USER_NAME@$GPU_URL:~/better.sh

ssh $USER_NAME@$GPU_URL pwd
ssh $USER_NAME@$GPU_URL source env.sh
ssh $USER_NAME@$GPU_URL "source env.sh; sh setup.sh"
ssh $USER_NAME@$GPU_URL "source proxy.sh; sh test.sh"
