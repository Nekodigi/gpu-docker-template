source env.sh

yes y |  ssh-keygen -t rsa -b 4096   All Enter!
scp ~/.ssh/id_rsa.pub $USER@$GPU_URL:~/.ssh/authorized_keys (pass)

cd ~
git clone https://github.com/Nekodigi/gpu-docker-template.git
cd gpu-docker-template/essential

scp setup.sh $USER@$GPU_URL:~/setup.sh
scp test.sh $USER@$GPU_URL:~/test.sh
ssh $USER@$GPU_URL sh setup.sh
ssh $USER@$GPU_URL sh test.sh