source env.sh

scp setup.sh $USER@$GPU_URL:~/setup.sh
scp test.sh $USER@$GPU_URL:~/test.sh
ssh $USER@$GPU_URL sh setup.sh
ssh $USER@$GPU_URL sh test.sh